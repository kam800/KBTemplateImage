//
// Created by Kamil Borzym on 28.04.2014.
// Copyright (c) 2014 Killer Ball. All rights reserved.
//

#import "KBTemplateImageDemoViewController.h"
#import "KBIconTestViewController.h"

static NSString * const kCellIdentifier = @"kCellIdentifier";

@interface KBTemplateImageDemoViewController ()

@property (nonatomic, strong) NSArray *icons;

@end

@implementation KBTemplateImageDemoViewController

- (NSArray *)icons
{
    if (!_icons) {
        _icons = @[ @"Cloud", @"Globe", @"Photo", @"Radar" ];
    }
    return _icons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Icons";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.icons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    NSString *iconName = self.icons[indexPath.row];
    cell.textLabel.text = iconName;
    cell.imageView.image = [UIImage imageNamed:iconName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *iconName = self.icons[indexPath.row];
    KBIconTestViewController *iconTestVC = [[KBIconTestViewController alloc] initWithAlphaIconName:iconName];
    [self.navigationController pushViewController:iconTestVC animated:YES];
}

@end