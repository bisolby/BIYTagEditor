//
//  BIYTagCollectionViewCell.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 11..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "BIYTagCollectionViewCell.h"

#import "BIYTagObject.h"

@interface BIYTagCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@end

@implementation BIYTagCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setBroadcastTag:(BIYTagObject *)broadcastTag
{
    _broadcastTag = broadcastTag;
    
    _tagLabel.text = broadcastTag.tagValue;
}

- (IBAction)removeTagButtonTapped:(id)sender
{
    if ([_delegate conformsToProtocol:@protocol(BIYTagCollectionViewCellDelegate)])
    {
        if ([_delegate respondsToSelector:@selector(removeTag:)])
        {
            [_delegate removeTag:self];
        }
    }
}

@end
