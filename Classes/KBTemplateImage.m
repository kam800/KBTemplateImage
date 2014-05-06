//
// Created by Kamil Borzym on 25.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

#import "KBTemplateImage.h"

@interface KBTemplateImage ()

@property (nonatomic, strong) UIImage *template;

@end

@implementation KBTemplateImage

+ (instancetype)templateImageWithAlphaOfImage:(UIImage *)image
{
    return [[KBTemplateImage alloc] initWithAlphaOfImage:image];
}

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Should use initWithAlphaOfImage:" userInfo:nil];
}

- (instancetype)initWithAlphaOfImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _template = image;
    }
    return self;
}

- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    CGSize imageSize = self.template.size;
    CGFloat scale = self.template.scale;

    CGSize graphicsSize = CGSizeMake(imageSize.width * scale, imageSize.height * scale);

    UIGraphicsBeginImageContext(graphicsSize);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect imageRect = CGRectMake(0.0, 0.0, graphicsSize.width, graphicsSize.height);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, imageRect);
    CGContextTranslateCTM(context, 0, graphicsSize.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
    CGContextDrawImage(context, imageRect, self.template.CGImage);

    UIImage *tinedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIImage *result = [UIImage imageWithCGImage:tinedImage.CGImage
                                          scale:self.template.scale
                                    orientation:self.template.imageOrientation];

    return result;
}

@end