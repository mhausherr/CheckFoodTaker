//
//  CFAppDelegate.m
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import "CFAppDelegate.h"

#import "CFMasterViewController.h"
#import "CFClient.h"
#import "CFProduct.h"

@implementation CFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //[self initializeServer];

    CFMasterViewController *masterViewController = [[CFMasterViewController alloc] initWithNibName:@"CFMasterViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initializeServer
{
    // Override point for customization after application launch.
    
    CFProduct *nutella = [[CFProduct alloc] init];
    nutella.label = @"Nutella";
    nutella.latitude = +37.77583400;
    nutella.longitude = -122.41641700;
    nutella.peremptionDate = [NSDate dateWithTimeIntervalSinceNow:3*3600*24];
    [[[CFClient sharedClient] productsTable] insert:[nutella insertServerRepresentation] completion:^(NSDictionary *item, NSError *error) {
        NSLog(@"%@",item);
        NSLog(@"error %@",error);
    }];
    
    CFProduct *delichoc = [[CFProduct alloc] init];
    delichoc.label = @"Delichoc";
    delichoc.latitude = +37.75583400;
    delichoc.longitude = -122.39641700;
    delichoc.peremptionDate = [NSDate dateWithTimeIntervalSinceNow:4*3600*24];
    [[[CFClient sharedClient] productsTable] insert:[delichoc insertServerRepresentation] completion:^(NSDictionary *item, NSError *error) {
        NSLog(@"%@",item);
        NSLog(@"error %@",error);
    }];
    
    CFProduct *coca = [[CFProduct alloc] init];
    coca.label = @"Coca";
    coca.latitude = +37.77493400;
    coca.longitude = -122.40541700;
    coca.peremptionDate = [NSDate dateWithTimeIntervalSinceNow:5*3600*24];
    [[[CFClient sharedClient] productsTable] insert:[coca insertServerRepresentation] completion:^(NSDictionary *item, NSError *error) {
        NSLog(@"%@",item);
        NSLog(@"error %@",error);
    }];
}

@end
