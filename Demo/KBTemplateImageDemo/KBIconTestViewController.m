//
// Created by Kamil Borzym on 30.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

#import "KBIconTestViewController.h"
#import "KBIconTestView.h"
#import "KBTemplateImage.h"

@interface KBIconTestViewController ()

@property (nonatomic, strong) KBIconTestView *iconTestView;

@end

@implementation KBIconTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Should not use default initializer" userInfo:nil];
}

- (instancetype)initWithAlphaIconName:(NSString *)alphaIconName
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = alphaIconName;
        self.iconTestView.titleLabel.text = [NSString stringWithFormat:@"Tap the %@!", alphaIconName];
        
        UIImage *alphaImage = [UIImage imageNamed:alphaIconName];
        
        KBTemplateImage *templateImage = [KBTemplateImage templateImageWithAlphaOfImage:alphaImage];
        
        [self.iconTestView.demoButton setImage:[templateImage imageTintedWithColor:[UIColor whiteColor]]
                                      forState:UIControlStateNormal];
        [self.iconTestView.demoButton setImage:[templateImage imageTintedWithColor:[UIColor lightGrayColor]]
                                      forState:UIControlStateHighlighted];
        [self.iconTestView.demoButton setImage:[templateImage imageTintedWithColor:[UIColor yellowColor]]
                                      forState:UIControlStateSelected];
        [self.iconTestView.demoButton setImage:[templateImage imageTintedWithColor:[UIColor orangeColor]]
                                      forState:UIControlStateSelected | UIControlStateHighlighted];
    }
    return self;
}

- (KBIconTestView *)iconTestView
{
    if (!_iconTestView) {
        _iconTestView = [[KBIconTestView alloc] init];
        [_iconTestView.demoButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconTestView;
}

- (void)loadView
{
    self.view = self.iconTestView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.iconTestView.stateLabel.text = @"OFF";
}

- (void)buttonTapped:(UIButton *)button
{
    button.selected = !button.selected;
    self.iconTestView.stateLabel.text = button.selected ? @"ON" : @"OFF";
}

@end
