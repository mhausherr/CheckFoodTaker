//
//  CFMasterViewController.h
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CFDetailViewController;

@interface CFMasterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView      *tableView;
@property (strong, nonatomic) IBOutlet MKMapView        *mapView;
@property (strong, nonatomic) CFDetailViewController    *detailViewController;

@end
