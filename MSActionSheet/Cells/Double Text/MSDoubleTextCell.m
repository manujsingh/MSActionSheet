//
//  MSDoubleTextCell.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-22.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "MSDoubleTextCell.h"
#import "UIColor+MSActionSheet.h"
#import "UITableViewCell+MSActionSheet.h"

@interface MSDoubleTextCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UIView *bottomBorder;

@end

@implementation MSDoubleTextCell

static uint const DEFAULT_TEXT_COLOR = 0x000000;
static uint const DISABLED_TEXT_COLOR = 0xAAAAAA;
static uint const SELECTED_TEXT_COLOR = 0x118C4E;

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
        self.backgroundColor = selected ? [UIColor colorFromRGBA:SELECTED_BACKGROUND_COLOR] : [UIColor colorFromRGBA:DEFAULT_BACKGROUND_COLOR];
        self.bottomBorder.backgroundColor = selected ? [UIColor colorFromRGBA:SELECTED_BORDER_COLOR] : [UIColor colorFromRGBA:DEFAULT_BORDER_COLOR];
    }
}

-(void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    
    self.title.textColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR] : [UIColor colorFromRGBA:DISABLED_TEXT_COLOR];
    self.detail.textColor = userInteractionEnabled ? [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR] : [UIColor colorFromRGBA:DISABLED_TEXT_COLOR];
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
    }
    else
    {
        self.title.text = @"Error in object sent";
    }
}

@end
