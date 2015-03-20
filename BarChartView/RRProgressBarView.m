//
////  RRProgressBarView.m
////  v0.1
////  https://github.com/smileyborg/UIView-AutoLayout
////
////  Copyright (c) 2015 Razvan Rusu
////
////  This code is distributed under the terms and conditions of the MIT license.
////
////  Permission is hereby granted, free of charge, to any person obtaining a copy
////  of this software and associated documentation files (the "Software"), to
////  deal in the Software without restriction, including without limitation the
////  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
////  sell copies of the Software, and to permit persons to whom the Software is
////  furnished to do so, subject to the following conditions:
////
////  The above copyright notice and this permission notice shall be included in
////  all copies or substantial portions of the Software.
////
////  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
////  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
////  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
////  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
////  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
////  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
////  IN THE SOFTWARE.
//
//
//#import "RRProgressBarView.h"
//#import "UIView+AutoLayout.h"
//
//@interface RRProgressBarView()
//
///**
// *  <#Description#>
// */
//@property (nonatomic, strong) NSLayoutConstraint *progressViewHeightConstraint;
//
///**
// *  <#Description#>
// */
//@property (nonatomic, strong) NSLayoutConstraint *progressViewWidthConstraint;
//
///**
// *  <#Description#>
// */
//@property (nonatomic, strong) UIView *progressBarView;
//
//
//@end
//
//@implementation RRProgressBarView
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if(self = [super initWithFrame:frame])
//    {
//        [self setBackgroundColor:[UIColor lightGrayColor]];
//        [self setProgressBarColor:[UIColor redColor]];
//        [self setupViews];
//        self.progress = 10.0;
//
//    }
//    return self;
//}
//
//- (void)setupViews
//{
//    self.progressBarView = [UIView new];
//    self.progressBarView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:self.progressBarView];
//    [self setProgressBarAlignment:RRProgressBarAlignmentVertical];
//
//
//}
//
//-(void)setProgress:(CGFloat)progress
//{
//    _progress = MIN(MAX(0.0, progress), 1.0);
//
//    switch (self.progressBarAlignment) {
//        case RRProgressBarAlignmentVertical:
//        {
//            CGFloat containerHeight = self.bounds.size.height;
//            CGFloat newProgressHeight = containerHeight * progress;
//
//            [UIView animateWithDuration:0.35f animations:^{
//                [self.progressViewHeightConstraint autoRemove];
//                _progressViewHeightConstraint = [_progressBarView autoSetDimension:ALDimensionHeight toSize:newProgressHeight];
//                [self.progressBarView layoutIfNeeded];
//                if(self) NSLog(@"Exista");
//            }];
//            break;
//        }
//        case RRProgressBarAlignmentHorizontal:
//        {
//            CGFloat containerWidth = self.bounds.size.width;
//            CGFloat newProgressWidth = containerWidth * progress;
//
//            [UIView animateWithDuration:0.35f animations:^{
//                [_progressViewWidthConstraint autoRemove];
//                _progressViewWidthConstraint = [_progressBarView autoSetDimension:ALDimensionWidth toSize:newProgressWidth];
//                [self.progressBarView layoutIfNeeded];
//            }];
//            break;
//        }
//        default:
//            break;
//    }
//
//
//}
//
//
//- (void)updateViewConstraints
//{
//    switch (self.progressBarAlignment) {
//
//        case RRProgressBarAlignmentVertical:
//            [UIView autoRemoveConstraints:[self.progressBarView constraints]];
//
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
//            self.progressViewHeightConstraint = [self.progressBarView autoSetDimension:ALDimensionHeight toSize:10.0];
//            [self.progressBarView layoutIfNeeded];
//            break;
//
//        case RRProgressBarAlignmentHorizontal:
//            [UIView autoRemoveConstraints:[self.progressBarView constraints]];
//
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
//            [self.progressBarView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0];
//            self.progressViewWidthConstraint = [self.progressBarView autoSetDimension:ALDimensionWidth toSize:10.0];
//            [self.progressBarView layoutIfNeeded];
//            break;
//
//        default:
//            break;
//    }
//}
//
//-(void)setProgressBarAlignment:(RRProgressBarAlignment)progressBarAlignment
//{
//    if(!(_progressBarAlignment = progressBarAlignment))
//    {
//        _progressBarAlignment = RRProgressBarAlignmentVertical;
//    }
//    [self updateViewConstraints];
//}
//
//-(void)setRoundCorners:(BOOL)roundCorners
//{
//    self.roundCorners = roundCorners;
//    if(roundCorners)
//    {
//        CGFloat cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2;
//        [UIView animateWithDuration:0.2 animations:^{
//            self.layer.cornerRadius = cornerRadius;
//            self.layer.masksToBounds = YES;
//            self.progressBarView.layer.cornerRadius = cornerRadius;
//        }];
//    }
//    else
//    {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.layer.cornerRadius = 0.0;
//            self.layer.masksToBounds = YES;
//            self.progressBarView.layer.cornerRadius = 0.0;
//        }];
//    }
//}
//
//-(void)setBackgroundViewRoundCorners:(BOOL)backgroundViewRoundCorners
//{
//    self.backgroundViewRoundCorners = backgroundViewRoundCorners;
//    if(backgroundViewRoundCorners)
//    {
//        CGFloat cornerRadius = MIN(self.frame.size.height, self.frame.size.width) / 2;
//        [UIView animateWithDuration:0.2 animations:^{
//            self.layer.cornerRadius = cornerRadius;
//            self.layer.masksToBounds = YES;
//
//        }];
//    }
//    else
//    {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.layer.cornerRadius = 0.0;
//
//            self.layer.masksToBounds = YES;
//        }];
//    }
//}
//
//-(void)setProgressBarColor:(UIColor *)progressBarColor
//{
//    _progressBarColor = progressBarColor;
//    [_progressBarView setBackgroundColor:progressBarColor];
//}
//
//
//@end
//



//  RRProgressBarView.m
//  v0.1
//  https://github.com/smileyborg/UIView-AutoLayout
//
//  Copyright (c) 2015 Razvan Rusu
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.



//  RRProgressBarView.m
//  v0.1
//  https://github.com/...
//
//  Copyright (c) 2015 Razvan Rusu
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.


#import "RRProgressBarView.h"
#import "UIView+AutoLayout.h"

@interface RRProgressBarView()

@property (nonatomic, assign) CGFloat _currentProgressViewOrWidth;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSLayoutConstraint *progressViewMarginConstraint1;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSLayoutConstraint *progressViewMarginConstraint2;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSLayoutConstraint *progressViewMarginConstraint3;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) NSLayoutConstraint *progressViewFillConstraint;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) UIView *progressBarView;

@end

@implementation RRProgressBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _progress = 0.0;
        __currentProgressViewOrWidth = 0.0;
        _progressBarDirection = RRProgressBarDirectionVertical;
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.progressBarView = [[UIView alloc] initForAutoLayout];
    [_progressBarView setBackgroundColor:[UIColor redColor]];
    [self addSubview:self.progressBarView];
    [self _removeAllConstraints];
    [self _updateConstraints];
}

- (void)_removeAllConstraints
{
    [_progressBarView autoRemoveConstraintsAffectingView];
    self.progressViewFillConstraint = nil;
}

- (void)_updateConstraints
{
    switch (_progressBarDirection) {
        case RRProgressBarDirectionVertical:
        {
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
            self.progressViewFillConstraint = [self.progressBarView autoSetDimension:ALDimensionHeight toSize:__currentProgressViewOrWidth];
            break;
        }
        case RRProgressBarDirectionHorizontal:
        {
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0];
            [_progressBarView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
            self.progressViewFillConstraint = [self.progressBarView autoSetDimension:ALDimensionWidth toSize:__currentProgressViewOrWidth];
            break;
        }
        default:
            break;
    }
    
}

-(void)setProgressBarDirection:(RRProgressBarDirection)progressBarDirection
{
    _progressBarDirection = progressBarDirection;
    [self _removeAllConstraints];
    [self _updateConstraints];
}

-(void)setProgress:(CGFloat)progress
{
    _progress = MIN(MAX(0.0, progress), 1.0);
    
    
    
    [UIView animateWithDuration:0.35f animations:^{
        [self.progressViewFillConstraint autoRemove];
        
        switch (_progressBarDirection) {
            case RRProgressBarDirectionVertical:
            {
                CGFloat containerHeight = self.bounds.size.height;
                CGFloat newProgressHeight = containerHeight * progress;
                __currentProgressViewOrWidth = newProgressHeight;
                self.progressViewFillConstraint = [self.progressBarView autoSetDimension:ALDimensionHeight toSize:newProgressHeight];
                break;
            }
            case RRProgressBarDirectionHorizontal:
            {
                CGFloat containerWidth = self.bounds.size.width;
                CGFloat newProgressWidth = containerWidth * progress;
                __currentProgressViewOrWidth = newProgressWidth;
                self.progressViewFillConstraint = [self.progressBarView autoSetDimension:ALDimensionWidth toSize:newProgressWidth];
                break;
            }
            default:
                break;
        }
        [self layoutIfNeeded];
    }];
}

-(void)setRoundCorners:(BOOL)roundCorners
{
    _roundCorners = roundCorners;
    if(roundCorners)
    {
        CGFloat cornerRadius = MIN(self.frame.size.height, self.frame.size.width) / 2;
        [UIView animateWithDuration:0.2 animations:^{
            self.layer.cornerRadius = cornerRadius;
            self.layer.masksToBounds = YES;
            self.progressBarView.layer.cornerRadius = cornerRadius;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.layer.cornerRadius = 0.0;
            self.layer.masksToBounds = YES;
            self.progressBarView.layer.cornerRadius = 0.0;
        }];
    }
}

-(void)setBackgroundViewRoundCorners:(BOOL)backgroundViewRoundCorners
{
    _backgroundViewRoundCorners = backgroundViewRoundCorners;
    if(backgroundViewRoundCorners)
    {
        CGFloat cornerRadius = MIN(self.frame.size.height, self.frame.size.width) / 2;
        [UIView animateWithDuration:0.2 animations:^{
            self.layer.cornerRadius = cornerRadius;
            self.layer.masksToBounds = YES;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.layer.cornerRadius = 0.0;
            self.layer.masksToBounds = YES;
        }];
    }
}

-(void)setProgressBarColor:(UIColor *)progressBarColor
{
    _progressBarColor = progressBarColor;
    [_progressBarView setBackgroundColor:progressBarColor];
}


@end




