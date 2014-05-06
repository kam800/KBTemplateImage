//
// Created by Kamil Borzym on 30.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

#import "KBIconTestView.h"
#import <KeepLayout/KeepLayout.h>

@interface KBIconTestView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *demoButton;
@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation KBIconTestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.000 green:0.500 blue:1.000 alpha:1.000];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.demoButton];
        [self addSubview:self.stateLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:40.0];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIButton *)demoButton
{
    if (!_demoButton) {
        _demoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _demoButton;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.backgroundColor = [UIColor clearColor];
        _stateLabel.font = [UIFont boldSystemFontOfSize:40.0];
        _stateLabel.textColor = [UIColor whiteColor];
    }
    return _stateLabel;
}

- (void)updateConstraints
{
    [super updateConstraints];

    self.titleLabel.keepTopInset.equal = KeepRequired(68.0);
    [self.titleLabel keepHorizontallyCentered];
    
    self.demoButton.keepTopOffsetTo(self.titleLabel).equal = KeepRequired(8.0);
    self.demoButton.keepHorizontalInsets.min = KeepFitting(8.0);
    [self.demoButton keepHorizontallyCentered];
    
    self.stateLabel.keepTopOffsetTo(self.demoButton).equal = KeepRequired(16.0);
    self.stateLabel.keepHorizontalInsets.min = KeepRequired(8.0);
    [self.stateLabel keepHorizontallyCentered];
}

@end
