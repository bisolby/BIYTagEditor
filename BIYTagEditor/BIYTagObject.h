//
//  BIYTagObject.h
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 11..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIYTagObject : NSObject

@property (assign, nonatomic) NSInteger tagKey;
@property (strong, nonatomic) NSString *tagValue;

- (instancetype)initWithKey:(NSInteger)key andValue:(NSString *)value;

@end
