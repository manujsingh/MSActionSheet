//
//  ViewController.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-20.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "ViewController.h"
#import "MSActionSheet.h"

@interface ViewController () <MSActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

- (IBAction)showActionSheet:(id)sender {
    MSActionSheet *ac = [[MSActionSheet alloc] initWithTitle:@"Test Title" delegate:self cellIdentifier:kSingleTextCellIdentifier options:@[@"Normal Text",@"Pre Selected Text", @"Another Normal Text",@"Another Normal Text",@"Another Normal Text", @"Another Normal Text"] preSelectedOptions:@[[NSNumber numberWithInteger:1]] disabledOptions:nil dismissOnClickOutside:NO];
    [ac show];
}
- (IBAction)showFromTabBarSingleText:(id)sender {
    MSActionSheet *ac = [[MSActionSheet alloc] initWithTitle:@"Test Title" delegate:self cellIdentifier:kSingleTextCellIdentifier options:@[@"Normal Text",@"Pre Selected Text", @"Another Normal Text",@"Disabled Text",@"Another Normal Text", @"Another Normal Text"] preSelectedOptions:@[[NSNumber numberWithInteger:1]] disabledOptions:@[[NSNumber numberWithInteger:3]] dismissOnClickOutside:NO];
    [ac showFromTabBar];
}
- (IBAction)showFromTabBarSingleTextWithSubtitle:(id)sender {
    MSActionSheet *ac = [[MSActionSheet alloc] initWithTitle:@"Test Title" delegate:self cellIdentifier:kSingleTextWithSubtitleCellIdentifier options:@[@[@"Normal Text",@"Normal Subtitle"],@[@"Pre Selected Text",@"Pre Selected Subtitle"]] preSelectedOptions:@[[NSNumber numberWithInteger:1]] disabledOptions:nil dismissOnClickOutside:NO];
    [ac showFromTabBar];
}
- (IBAction)showFromTabBarDoubleText:(id)sender {
    MSActionSheet *ac = [[MSActionSheet alloc] initWithTitle:@"Test Title" delegate:self cellIdentifier:kDoubleTextCellIdentifier options:@[@[@"Normal Text",@"Normal Detail"],@[@"Pre Selected Text",@"Pre Selected Detail"]] preSelectedOptions:@[[NSNumber numberWithInteger:1]] disabledOptions:nil dismissOnClickOutside:YES];
    [ac showFromTabBar];
}
- (IBAction)showFromTabBarDoubleTextWithSubtitle:(id)sender {
    MSActionSheet *ac = [[MSActionSheet alloc] initWithTitle:@"Test Title" delegate:self cellIdentifier:kDoubleTextWithSubtitleCellIdentifier options:@[@[@"Normal Text",@"Normal Detail", @"Normal Subtitle"],@[@"Pre Selected Text",@"Pre Selected Detail", @"Pre Selected Subtitle"]] preSelectedOptions:@[[NSNumber numberWithInteger:1]] disabledOptions:nil dismissOnClickOutside:YES];
    [ac showFromTabBar];
}

#pragma mark - MSActionSheetDelegate
-(void)actionSheet:(MSActionSheet *)aActionSheet didDismissWithOption:(id)selection
{
    // Do something
}

-(void)actionSheet:(MSActionSheet *)aActionSheet didDismissWithOptionAtIndex:(NSInteger)optionIndex
{
    // Do something
}
@end
