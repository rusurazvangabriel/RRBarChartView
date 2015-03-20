//
//  ViewController.m
//  BarChartView
//
//  Created by Razvan Rusu on 20/03/15.
//  Copyright (c) 2015 Razvan Rusu. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"
#import "FlatUIKit.h"
#import "RRProgressBarView.h"

@interface ViewController ()

@property (strong, nonatomic) RRProgressBarView *progressBarView;
@end

@implementation ViewController

- (void)_setStatusBar
{
    UIView *statusBarBackgroundView = [[UIView alloc] initForAutoLayout];
    statusBarBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:statusBarBackgroundView];
    
    [statusBarBackgroundView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0];
    [statusBarBackgroundView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0.0];
    [statusBarBackgroundView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0.0];
    [statusBarBackgroundView autoSetDimension:ALDimensionHeight toSize:20.0];
}

- (void)_setRandomizeFlatButton
{
    FUIButton *myButton = [[FUIButton alloc] initForAutoLayout];
    myButton.buttonColor = [UIColor turquoiseColor];
    myButton.shadowColor = [UIColor greenSeaColor];
    myButton.shadowHeight = 3.0f;
    myButton.cornerRadius = 6.0f;
    myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [myButton setTitle:@"Randomize" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [myButton addTarget:self action:@selector(randomizeBarProgress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:myButton];
    
    [myButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];
    [myButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [myButton autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:15];
    [myButton autoSetDimension:ALDimensionHeight toSize:40];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.114 green:0.118 blue:0.102 alpha:1]];
    [self _setStatusBar];
    [self _setRandomizeFlatButton];
    
    _progressBarView = [[RRProgressBarView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    _progressBarView.center = self.view.center;
    [self.view addSubview:_progressBarView];
    
    //_progressBarView.progressBarAlignment = RRProgressBarAlignmentHorizontal;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)randomizeBarProgress:(FUIButton *)button
{
    CGFloat percent = (CGFloat)(arc4random() % 100 + 1.0) * 0.01;
    
    if(_progressBarView.progressBarDirection == RRProgressBarDirectionVertical)
    {
        _progressBarView.progressBarDirection = RRProgressBarDirectionHorizontal;
    }
    else
    {
        _progressBarView.progressBarDirection = RRProgressBarDirectionVertical;
    }
    
    _progressBarView.progress = percent;
    NSLog(@"%f",percent);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
