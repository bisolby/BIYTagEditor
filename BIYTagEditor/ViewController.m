//
//  ViewController.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 2..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "ViewController.h"

#import "BIYTextField.h"

#import "BIYTagObject.h"
#import "BIYTagCollectionViewCell.h"

#define PREFIX_TEXT @"# "

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate, BIYTagCollectionViewCellDelegate>

@property (strong, nonatomic) NSMutableArray<BIYTagObject *> *TAGS;

@property (weak, nonatomic) IBOutlet BIYTextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchAddButton;

@property (assign, nonatomic) CGFloat searchViewTrailingContraintConstant;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchViewTrailingConstraint;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) BIYTagCollectionViewCell *tagCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _TAGS = [NSMutableArray new];
    for (NSInteger i = 0 ; i < 3 ; i++){
        [_TAGS addObject:[[BIYTagObject alloc] initWithKey:i andValue:[self generatedRandomWord]]];
    }
    
    _searchViewTrailingContraintConstant = CGRectGetWidth(_searchAddButton.bounds) + 8.f;
    _searchViewTrailingConstraint.constant = -_searchViewTrailingContraintConstant;
    
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.contentInset = UIEdgeInsetsMake(0, 16, 0, 16);
    
    UINib *nib = [UINib nibWithNibName:@"BIYTagCollectionViewCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"BIYTagCollectionViewCell"];
    
    _tagCell = [[NSBundle mainBundle] loadNibNamed:@"BIYTagCollectionViewCell" owner:self options:nil][0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchAddButtonTapped:(UIButton *)sender
{
    [_searchTextField resignFirstResponder];
    
    //call the search api
    
    _searchTextField.text = @"";
    
    _searchViewTrailingConstraint.constant = -_searchViewTrailingContraintConstant;
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:.3f animations:^{
        [weakSelf.view layoutIfNeeded];
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = PREFIX_TEXT;
    
    _searchViewTrailingConstraint.constant = 0.f;
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:.3f animations:^{
        [weakSelf.view layoutIfNeeded];
    }];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    //call the search api
    
    textField.text = @"";
    
    _searchViewTrailingConstraint.constant = -_searchViewTrailingContraintConstant;
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:.3f animations:^{
        [weakSelf.view layoutIfNeeded];
    }];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSRange substringRange = [textField.text rangeOfString:PREFIX_TEXT];
    
    if (range.location >= substringRange.location && range.location < substringRange.location + substringRange.length) {
        return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([textField.text isEqualToString:PREFIX_TEXT]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _TAGS.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BIYTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BIYTagCollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.broadcastTag = _TAGS[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    _tagCell.broadcastTag = _TAGS[indexPath.row];
    CGSize size = CGSizeMake([_tagCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width, 40.f);
    return size;
}

#pragma mark - BIYTagCollectionViewCellDelegate

- (void)removeTag:(BIYTagCollectionViewCell *)cell
{
    [_TAGS removeObject:cell.broadcastTag];
    
    [self.collectionView reloadData];
}

#pragma mark - Generating Random Word

- (NSString *)generatedRandomWord
{
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyz";
    NSUInteger wordLength = arc4random() % 10 + 5;
    NSMutableString *s = [NSMutableString stringWithCapacity:wordLength];
    for (NSUInteger i = 0U; i < wordLength; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    
    return s;
}

@end
