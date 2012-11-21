//
//  CFProduct.h
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFModelObject.h"

@interface CFProduct : CFModelObject <MKAnnotation>

@property(nonatomic, strong) NSString   *label;
@property(nonatomic) double             longitude;
@property(nonatomic) double             latitude;
@property(nonatomic) BOOL               available;
@property(nonatomic) NSDate             *peremptionDate;

- (NSDictionary *)insertServerRepresentation;

@end
