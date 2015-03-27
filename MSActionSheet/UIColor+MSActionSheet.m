//
//  UIColor+MSActionSheet.m
//  MSActionSheet
//
//  Created by Manuj Singh on 2015-03-20.
//  Copyright (c) 2015 Manuj Singh. All rights reserved.
//

#import "UIColor+MSActionSheet.h"

@implementation UIColor (MSActionSheet)

+(UIColor *) colorFromRGBA:(uint)rgb alpha:(float) alpha
{
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0f
                           green:((float)((rgb & 0xFF00) >> 8))/255.0f
                            blue:((float)(rgb & 0xFF))/255.0f alpha:alpha];
}

+(UIColor *) colorFromRGBA:(uint)rgb
{
    return [UIColor colorFromRGBA:rgb alpha:1.0f];
}

@end
