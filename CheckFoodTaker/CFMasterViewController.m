//
//  CFMasterViewController.m
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import "CFMasterViewController.h"

#import "CFDetailViewController.h"
#import "CFClient.h"
#import "CFProduct.h"

@interface CFMasterViewController ()

@property (strong, nonatomic) NSArray *products;
- (IBAction)switchVisualisationMode:(id)sender;

@end

@implementation CFMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Liste", @"Liste");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIBarButtonItem *mapButton = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStyleBordered target:self action:@selector(switchVisualisationMode:)];
    self.navigationItem.rightBarButtonItem = mapButton;
    
    self.products = [NSArray array];
    
    [[[CFClient sharedClient] productsTable] readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error) {
        self.products = [CFProduct arrayFromServerRepresentation:items];
        [self.mapView addAnnotations:self.products];
        [self.tableView reloadData];
    }];
    /*NSPredicate *predicate = [NSPredicate predicateWithFormat:@"available == %d",NO];
    MSQuery *query = [[MSQuery alloc] initWithTable:[[CFClient sharedClient] productsTable] withPredicate:predicate];
    [query readWithCompletion:^(NSArray *items, NSInteger totalCount, NSError *error) {
        self.products = [CFProduct arrayFromServerRepresentation:items];
        [self.mapView addAnnotations:self.products];
        [self.tableView reloadData];
    }];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    CFProduct *product = self.products[indexPath.row];
    cell.textLabel.text = [product label];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CFProduct *product = self.products[indexPath.row];
    [self showDetailView:product];
}

/**************************************************************************************************/
#pragma mark - Map view

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == mapView.userLocation)
	{
		// We can return nil to let the MapView handle the default annotation view (blue dot):
		return nil;
	}
    else
    {
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];;
        annotationView.userInteractionEnabled = YES;
        annotationView.canShowCallout = YES;
        
        return annotationView;
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self showDetailView:view.annotation];
}

/**************************************************************************************************/
#pragma mark - Actions

- (void)switchVisualisationMode:(id)sender
{
    BOOL tableMode = self.tableView.hidden;
    self.tableView.hidden = !tableMode;
    self.mapView.hidden = tableMode;
    
    UIBarButtonItem *mapButton = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    self.navigationItem.leftBarButtonItem = tableMode?nil:mapButton;
}

- (void)showDetailView:(CFProduct *)product
{
    if (!self.detailViewController) {
        self.detailViewController = [[CFDetailViewController alloc] initWithNibName:@"CFDetailViewController" bundle:nil];
    }
    self.detailViewController.detailItem = product;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
