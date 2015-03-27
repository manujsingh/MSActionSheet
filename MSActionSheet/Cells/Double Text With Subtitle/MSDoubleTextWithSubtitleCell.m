//
//  MSDoubleTextWithSubtitleCell.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-22.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "MSDoubleTextWithSubtitleCell.h"
#import "UITableViewCell+MSActionSheet.h"
#import "UIColor+MSActionSheet.h"

@interface MSDoubleTextWithSubtitleCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIView *bottomBorder;

@end

@implementation MSDoubleTextWithSubtitleCell

static uint const DEFAULT_TEXT_COLOR = 0x000000;
static uint const DISABLED_TEXT_COLOR = 0xAAAAAA;
static uint const SELECTED_TEXT_COLOR = 0x118C4E;

static uint const DEFAULT_SUBTITLE_COLOR = 0x555555;
static uint const DISABLED_SUBTITLE_COLOR = 0x87CEFA;
static uint const SELECTED_SUBTITLE_COLOR = 0x118F4F;

static uint const DEFAULT_BACKGROUND_COLOR = 0xFFFFFF;
static uint const DISABLED_BACKGROUND_COLOR = 0xF7F7F7;
static uint const SELECTED_BACKGROUND_COLOR = 0xFFFFFF;

static uint const DEFAULT_BORDER_COLOR = 0xDDDDDD;
static uint const DISABLED_BORDER_COLOR = 0xDDDDDD;
static uint const SELECTED_BORDER_COLOR = 0xDDDDDD;

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (self.userInteractionEnabled) {
        self.title.textColor = selected ? [UIColor colorFromRGBA:SELECTED_TEXT_COLOR] : [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR];
        self.detail.textColor = selected ? [UIColor colorFromRGBA:SELECTED_TEXT_COLOR] : [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR];
        self.subtitle.textColor = selected ? [UIColor colorFromRGBA:SELECTED_SUBTITLE_COLOR] : [UIColor colorFromRGBA:DEFAULT_SUBTITLE_COLOR];
        self.backgroundColor = selected ? [UIColor colorFromRGBA:SELECTED_BACKGROUND_COLOR] : [UIColor colorFromRGBA:DEFAULT_BACKGROUND_COLOR];
        self.bottomBorder.backgroundColor = selected ? [UIColor colorFromRGBA:SELECTED_BORDER_COLOR] : [UIColor colorFromRGBA:DEFAULT_BORDER_COLOR];
    }
}

-(void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    
    self.title.textColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR] : [UIColor colorFromRGBA:DISABLED_TEXT_COLOR];
    self.detail.textColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR] : [UIColor colorFromRGBA:DISABLED_TEXT_COLOR];
    self.subtitle.textColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_SUBTITLE_COLOR] : [UIColor colorFromRGBA:DISABLED_SUBTITLE_COLOR];
    self.backgroundColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_BACKGROUND_COLOR] : [UIColor colorFromRGBA:DISABLED_BACKGROUND_COLOR];
    self.bottomBorder.backgroundColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_BORDER_COLOR] : [UIColor colorFromRGBA:DISABLED_BORDER_COLOR];
    
    [super setUserInteractionEnabled:userInteractionEnabled];
}

-(void)setupDisplayFromObject:(id)object
{
    if ([object isKindOfClass:[NSArray class]])
    {
        self.title.text = ((NSArray *)object)[0];
        self.detail.text = ((NSArray *)object)[1];
        self.subtitle.text = ((NSArray *)object)[2];
    }
    else
    {
        self.title.text = @"Error in object sent";
    }
}

@end
