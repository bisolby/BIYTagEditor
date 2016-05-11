//
//  BIYTagCollectionViewFlowLayout.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 11..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "BIYTagCollectionViewFlowLayout.h"

@implementation BIYTagCollectionViewFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *original   = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:original copyItems:YES];
    
    CGFloat leftMargin = self.sectionInset.left;
    
    for (UICollectionViewLayoutAttributes *layoutAttribute in attributes) {
        CGRect layoutAttributeFrame = layoutAttribute.frame;
        layoutAttributeFrame.origin.x = leftMargin;
        layoutAttribute.frame = layoutAttributeFrame;
        
        leftMargin += CGRectGetWidth(layoutAttribute.frame) + self.minimumInteritemSpacing;
    }
    
    return attributes;
}

@end
