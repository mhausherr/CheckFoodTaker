//
//  CFModelObject.h
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFModelObject : NSObject

@property (strong, nonatomic) NSString *id;

- (NSDictionary *)serverRepresentation;
+ (NSArray *)arrayFromServerRepresentation:(NSArray *)serverRepresentations;

@end
