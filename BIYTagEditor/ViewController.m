//
//  ViewController.m
//  BIYTagEditor
//
//  Created by mulberry on 2016. 5. 2..
//  Copyright © 2016년 bisolby. All rights reserved.
//

#import "ViewController.h"

#import "BIYTextField.h"

#define PREFIX_TEXT @"# "

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet BIYTextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchAddButton;

@property (assign, nonatomic) CGFloat searchViewTrailingContraintConstant;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchViewTrailingConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _searchViewTrailingContraintConstant = CGRectGetWidth(_searchAddButton.bounds) + 8.f;
    _searchViewTrailingConstraint.constant = -_searchViewTrailingContraintConstant;
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

@end
