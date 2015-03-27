//
//  MSActionSheet.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-20.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "MSActionSheet.h"
#import "UITableViewCell+MSActionSheet.h"
#import "MSActionSheetHeaderView.h"

@interface MSActionSheet () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *actionSheet;
@property (nonatomic, strong) MSActionSheetHeaderView *headerView;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSArray *optionsArray;
@property (nonatomic, copy) NSArray *preSelectedOptionsArray;
@property (nonatomic, copy) NSArray *disabledOptionsArray;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<MSActionSheetDelegate> delegate;
@property (nonatomic) BOOL dismissOnClick;

@end

@implementation MSActionSheet

NSString *const kSingleTextCellIdentifier = @"MSSingleTextCell";
NSString *const kSingleTextWithSubtitleCellIdentifier = @"MSSingleTextWithSubtitleCell";
NSString *const kDoubleTextCellIdentifier = @"MSDoubleTextCell";
NSString *const kDoubleTextWithSubtitleCellIdentifier = @"MSDoubleTextWithSubtitleCell";

- (instancetype)initWithTitle:(NSString *)title delegate:(id<MSActionSheetDelegate>)delegate cellIdentifier:(NSString *)cellIdentifier options:(NSArray *)optionsArray preSelectedOptions:(NSArray *)preSelectedOptionsArray disabledOptions:(NSArray *)disabledOptionsArray dismissOnClickOutside:(BOOL)dismissOnClick
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.delegate = delegate;
        self.cellIdentifier = cellIdentifier;
        self.optionsArray = optionsArray;
        self.preSelectedOptionsArray = preSelectedOptionsArray;
        self.disabledOptionsArray = disabledOptionsArray;
        self.dismissOnClick = dismissOnClick;
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.bounces = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
    
        [self.tableView registerNib:[UINib nibWithNibName:self.cellIdentifier bundle:nil] forCellReuseIdentifier:self.cellIdentifier];
        [self.tableView reloadData];
        
    }
    return self;
}

-(void)show
{
    if([self.delegate isKindOfClass:[UIViewController class]])
    {
        [((UIViewController *)self.delegate).view addSubview:self];
        [self display];
    }
}

-(void)showFromTabBar
{
    if([self.delegate isKindOfClass:[UIViewController class]])
    {
        [((UIViewController *)self.delegate).tabBarController.view addSubview:self];
        [self display];
    }
}

#pragma mark - Private helper methods

-(void)build
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.01f];
    // Set header
    self.headerView = [[MSActionSheetHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 55)];
    self.headerView.title.text = self.title;
    
    
    // Set Action Sheet
    int actualTableHeight = CGRectGetHeight(((UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:self.cellIdentifier]).frame) * self.optionsArray.count;
    int height = CGRectGetHeight(self.headerView.frame) + actualTableHeight;
    
    if(height > CGRectGetHeight(self.frame)/2)
    {
        height = CGRectGetHeight(self.frame)/2;
    }
    
    self.actionSheet = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-height, CGRectGetWidth(self.frame), height)];
    
    [self.actionSheet addSubview:self.headerView];
    
    
    // Set table
    CGRect tableViewFrame = CGRectMake(0, CGRectGetHeight(self.headerView.frame), CGRectGetWidth(self.frame), height-CGRectGetHeight(self.headerView.frame));
    self.tableView.frame = tableViewFrame;
    if (CGRectGetHeight(self.tableView.frame) < actualTableHeight) {
        self.tableView.bounces = YES;
    }
    
    for (int i=0; i<self.preSelectedOptionsArray.count; i++) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:[self.preSelectedOptionsArray[i] integerValue] inSection:0]  animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    [self.actionSheet addSubview:self.tableView];
    
    [self addSubview:self.actionSheet];
    
}
-(void)display
{
    [self build];
    CGRect finalFrame = self.actionSheet.frame;
    CGRect frame = finalFrame;
    frame.origin = CGPointMake(0, CGRectGetHeight(self.frame));
    self.actionSheet.frame = frame;
    [UIView animateWithDuration:0.25f animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
        self.actionSheet.frame = finalFrame;
    }];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.25f animations:^{
        CGRect frame = self.actionSheet.frame;
        frame.origin = CGPointMake(0, CGRectGetHeight(self.frame));
        self.actionSheet.frame = frame;
        self.alpha = 0.025f;
    } completion:^(BOOL finished) {
        if(finished)
        {
            [self removeFromSuperview];
        }
    }];
}

#pragma mark - UIView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint subPoint = [self.actionSheet convertPoint:point fromView:self];
    UIView *result = [self.actionSheet hitTest:subPoint withEvent:event];
    if (!result && self.dismissOnClick) {
        self.dismissOnClick = NO;
        [self dismiss];
    }
    
    return [super hitTest:point withEvent:event];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.optionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if(cell)
    {
        [cell setupDisplayFromObject:self.optionsArray[indexPath.row]];
    }
    
    if([self.disabledOptionsArray containsObject:[NSNumber numberWithInteger:indexPath.row]])
    {
        cell.userInteractionEnabled = NO;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(actionSheet:didDismissWithOption:)])
    {
        [self.delegate actionSheet:self didDismissWithOption:self.optionsArray[indexPath.row]];
    }
    if([self.delegate respondsToSelector:@selector(actionSheet:didDismissWithOptionAtIndex:)])
    {
        [self.delegate actionSheet:self didDismissWithOptionAtIndex:indexPath.row];
    }
    [self dismiss];
}
@end
