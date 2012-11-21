//
//  CFDetailViewController.h
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFProduct.h"

@interface CFDetailViewController : UIViewController

@property (strong, nonatomic) CFProduct *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (IBAction)takeObject:(id)sender;
@end
