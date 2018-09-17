//
//  WRHistogramView.h
//  360DNS_Manager
//
//  Created by Michael on 2017/4/22.
//  Copyright © 2017年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRHistogramView : UIView


- (UIImageView *)setHistogramFrame:(CGRect)histogramRect
                          maxArray:(NSMutableArray *)array
                           selfNum:(NSString *)selfNum;


@end
