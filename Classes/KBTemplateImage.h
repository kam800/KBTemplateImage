//
// Created by Kamil Borzym on 25.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

@import UIKit;

@interface KBTemplateImage : NSObject

+ (instancetype)templateImageWithAlphaOfImage:(UIImage *)image;
- (instancetype)initWithAlphaOfImage:(UIImage *)image;

- (UIImage *)imageTintedWithColor:(UIColor *)color;

@end
