//
//  BIYTextField.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 9..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "BIYTextField.h"

@implementation BIYTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.layer.cornerRadius = 4.f;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 10);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 10);
}

@end
