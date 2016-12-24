//
//  ViewController.m
//  CustomActionSheet
//
//  Created by yaoshuai on 2016/12/24.
//  Copyright © 2016年 ys. All rights reserved.
//

#import "ViewController.h"
#import "LCActionSheet.h"

@interface ViewController ()<LCActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)defaultAction:(id)sender {
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"title"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"分享", @"删除", @"确认", nil];
    [actionSheet show];
}

- (IBAction)customStyleAction:(id)sender {
    LCActionSheet *actionSheet     = [[LCActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", nil];
    actionSheet.title              = @"This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very long title~";
    actionSheet.cancelButtonTitle  = @"Close";
    [actionSheet appendButtonTitles:@"Button 6", @"Button 7", nil];
    actionSheet.titleColor         = [UIColor orangeColor];
    actionSheet.buttonColor        = [UIColor greenColor];
    actionSheet.titleFont          = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonFont         = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonHeight       = 60.0f;
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    actionSheet.darkViewNoTaped    = YES;
    actionSheet.unBlur             = YES;
    
    // V 2.1.0+ use `destructiveButtonIndexSet` instead `redButtonIndexSet`.
    actionSheet.destructiveButtonIndexSet = [NSSet setWithObjects:@0, @2, nil];
    actionSheet.destructiveButtonColor    = [UIColor blueColor];
    
    // V 2.7.0+
    actionSheet.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
    
    [actionSheet show];
}

- (IBAction)blockAction:(id)sender {
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Block LCActionSheet" cancelButtonTitle:@"Cancel" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
        
    } otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", @"Button 6", nil];
    
    actionSheet.blurEffectStyle = UIBlurEffectStyleLight;
    
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    
    actionSheet.willPresentHandle = ^(LCActionSheet *actionSheet) {
        NSLog(@"willPresentActionSheet");
    };
    
    actionSheet.didPresentHandle = ^(LCActionSheet *actionSheet) {
        NSLog(@"didPresentActionSheet");
    };
    
    actionSheet.willDismissHandle = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"willDismissWithButtonIndex: %d", (int)buttonIndex);
    };
    
    actionSheet.didDismissHandle = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
    };
    
    [actionSheet show];
}



#pragma mark - LCActionSheetDelegate

- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
}

- (void)willPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"willPresentActionSheet");
}

- (void)didPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"didPresentActionSheet");
}

- (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"willDismissWithButtonIndex: %d", (int)buttonIndex);
}

- (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
}

@end
