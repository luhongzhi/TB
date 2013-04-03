//
//  TBClientViewController.m
//  TBClient
//
//  Created by Beny on 13-3-6.
//  Copyright (c) 2013年 Beny. All rights reserved.
//

#import "TBClientViewController.h"
#import "MBProgressHUD.h"

@interface TBClientViewController ()

@property (nonatomic,strong) MBProgressHUD *progressHUD;    //进度指示器


@end

@implementation TBClientViewController

#pragma mark - Init

-(MBProgressHUD *)progressHUD
{
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:_progressHUD];
    }
    return _progressHUD;
}


#pragma mark - ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MBProgressHUD
//显示正在加载HUD
-(void)showLoadingProgressHUD
{
    self.progressHUD.labelText = @"正在加载...";
    [self.progressHUD show:YES];
}
//隐藏正在加载HUD
-(void)stopLoadingProGressHUD
{
    [self.progressHUD hide:YES];
}

@end
