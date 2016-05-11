//
//  BIYTagCollectionViewCell.h
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 11..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIYTagCollectionViewCell;
@class BIYTagObject;

@protocol BIYTagCollectionViewCellDelegate <NSObject>

- (void)removeTag:(BIYTagCollectionViewCell *)cell;

@end

@interface BIYTagCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<BIYTagCollectionViewCellDelegate> delegate;
@property (strong, nonatomic) BIYTagObject *broadcastTag;

@end
