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

@property (strong, nonatomic) RRProgressBarView *horizontalProgressBarView;

@property (strong, nonatomic) RRProgressBarView *verticalProgressBarView;

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
    
    _verticalProgressBarView = [[RRProgressBarView alloc] initWithFrame:CGRectMake(0, 0, 10, 150)];
    _verticalProgressBarView.roundCorners = YES;
    _verticalProgressBarView.progressBarColor = [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1];
    _verticalProgressBarView.progressBarDirection = RRProgressBarDirectionVertical;
    _verticalProgressBarView.progress = 0.33;
    _verticalProgressBarView.center = self.view.center;
    [self.view addSubview:_verticalProgressBarView];
    
    _horizontalProgressBarView = [[RRProgressBarView alloc] initWithFrame:CGRectMake(20, 35, self.view.bounds.size.width - 40, 15)];

    _horizontalProgressBarView.progressBarDirection = RRProgressBarDirectionHorizontal;
    _horizontalProgressBarView.progress = 0.99;
    _horizontalProgressBarView.progressBarColor = [UIColor colorWithRed:0.204 green:0.596 blue:0.859 alpha:1];
    _horizontalProgressBarView.roundCorners = YES;
    [self.view addSubview:_horizontalProgressBarView];
    
    //_progressBarView.progressBarAlignment = RRProgressBarAlignmentHorizontal;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)randomizeBarProgress:(FUIButton *)button
{
    CGFloat percent = (CGFloat)(arc4random() % 100 + 1.0) * 0.01;
    _verticalProgressBarView.progress = percent;
    percent = (CGFloat)(arc4random() % 100 + 1.0) * 0.01;
    _horizontalProgressBarView.progress = percent;
    NSLog(@"%f",percent);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
