//
//  BIYTagObject.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 11..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "BIYTagObject.h"

@implementation BIYTagObject

- (instancetype)initWithKey:(NSInteger)key andValue:(NSString *)value
{
    if (self = [self init]) {
        _tagKey = key;
        _tagValue = value;
    }
    
    return self;
}

@end
