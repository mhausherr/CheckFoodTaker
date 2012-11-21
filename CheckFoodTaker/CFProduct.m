//
//  CFProduct.m
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import "CFProduct.h"

@implementation CFProduct

- (NSDictionary *)insertServerRepresentation
{
    return [self dictionaryWithValuesForKeys:@[@"label",@"longitude",@"latitude",@"peremptionDate"]];
}

- (NSDictionary *)serverRepresentation
{
    return [self dictionaryWithValuesForKeys:@[@"id",@"available"]];
}

- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)title
{
    return self.label;
}

@end
