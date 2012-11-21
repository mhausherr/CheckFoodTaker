//
//  CFClient.h
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>
#import "MSClient+CheckFood.h"

@interface CFClient : MSClient
+ (id)sharedClient;
@end