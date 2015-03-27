//
//  MSActionSheetHeaderView.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-20.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "MSActionSheetHeaderView.h"
#import "UIColor+MSActionSheet.h"

@implementation MSActionSheetHeaderView

static uint const DEFAULT_BORDER_COLOR = 0xBBBBBB;
static uint const DEFAULT_TEXT_COLOR = 0x222222;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[NSBundle mainBundle] loadNibNamed:@"MSActionSheetHeaderView" owner:self options:nil];
        [self.view setFrame:frame];
        [self addSubview:self.view];
        self.title.textColor = [UIColor colorFromRGBA:DEFAULT_TEXT_COLOR];
        [self addTopAndBottomBorder];
    }
    return self;
}

-(void)addTopAndBottomBorder
{
    CALayer *topBorder = [CALayer layer];
    topBorder.backgroundColor = [[UIColor colorFromRGBA:DEFAULT_BORDER_COLOR] CGColor];
    topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 1.0f);
    [self.layer addSublayer:topBorder];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.backgroundColor = [[UIColor colorFromRGBA:DEFAULT_BORDER_COLOR] CGColor];
    bottomBorder.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame), 1.0f);
    [self.layer addSublayer:bottomBorder];
}
@end
