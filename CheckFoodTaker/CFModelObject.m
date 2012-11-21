//
//  CFModelObject.m
//  CheckFoodKeeper
//
//  Created by Mathieu Hausherr on 11/11/12.
//  Copyright (c) 2012 LiveCode. All rights reserved.
//

#import "CFModelObject.h"

@implementation CFModelObject

@synthesize id;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (NSArray *)arrayFromServerRepresentation:(NSArray *)serverRepresentations
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *serverRepresentation in serverRepresentations) {
        id object = [[self alloc] init];
        [object setValuesForKeysWithDictionary:serverRepresentation];
        [array addObject:object];
    }
    return array;
}

- (NSDictionary *)serverRepresentation
{
    return [NSDictionary dictionary];
}

@end
