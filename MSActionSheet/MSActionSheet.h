//
//  MSActionSheet.h
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-20.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSActionSheet;

extern NSString *const kSingleTextCellIdentifier;
extern NSString *const kSingleTextWithSubtitleCellIdentifier;
extern NSString *const kDoubleTextCellIdentifier;
extern NSString *const kDoubleTextWithSubtitleCellIdentifier;

@protocol MSActionSheetDelegate <NSObject>

-(void)actionSheet:(MSActionSheet *)aActionSheet didDismissWithOption:(id)selection;
-(void)actionSheet:(MSActionSheet *)aActionSheet didDismissWithOptionAtIndex:(NSInteger)optionIndex;

@optional
-(void)actionSheetDismissed:(MSActionSheet *)aActionSheet;

@end

@interface MSActionSheet : UIView

- (instancetype)initWithTitle:(NSString *)title delegate:(id<MSActionSheetDelegate>)deleaget cellIdentifier:(NSString *)cellIdentifier options:(NSArray *)optionsArray preSelectedOptions:(NSArray *)preSelectedOptionsArray disabledOptions:(NSArray *)disabledOptionsArray dismissOnClickOutside:(BOOL)dismissOnClick;

-(void)show;
-(void)showFromTabBar;

@end
