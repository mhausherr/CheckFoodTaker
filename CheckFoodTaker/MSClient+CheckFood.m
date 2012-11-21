//
//  MSClient+CheckFood.m
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import "MSClient+CheckFood.h"

@implementation MSClient (CheckFood)

- (MSTable*)productsTable
{
    return [self getTable:@"product"];
}

@end