//
//  WRHistogramView.m
//  360DNS_Manager
//
//  Created by Michael on 2017/4/22.
//  Copyright © 2017年 Michael. All rights reserved.
//

#import "WRHistogramView.h"

#define ANIMATETIME 0.8
@implementation WRHistogramView

#pragma mark 自定义柱状图
- (UIImageView *)setHistogramFrame:(CGRect)histogramRect
                          maxArray:(NSMutableArray *)array
                           selfNum:(NSString *)selfNum{
    
    
    NSString *maxValue = [array valueForKeyPath:@"@max.floatValue"];
    
    // 传入图片的位置,大小
    CGFloat imageViewX = histogramRect.origin.x;
    
    CGFloat imageViewY = histogramRect.origin.y;
    
    CGFloat imageViewW = histogramRect.size.width;
    
    CGFloat imageViewH = histogramRect.size.height;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
    
    // 最大值
    if ([maxValue floatValue] > [selfNum floatValue]) {
        
        
        // 最小值为柱状图宽
        if (imageViewH * [selfNum floatValue] / [maxValue floatValue] <= imageViewW) {
            
            // 最小值小于柱状图宽
            [UIView animateWithDuration:ANIMATETIME animations:^{
                
                imageView.frame = CGRectMake(imageViewX, imageViewY + imageViewH - imageViewW, imageViewW, imageViewW);
                imageView.layer.cornerRadius = imageViewW / 2;
                imageView.layer.masksToBounds = YES;
            }];
            
        }else{
            
            // 最小值大于柱状图宽
            [UIView animateWithDuration:ANIMATETIME animations:^{
                
                imageView.frame = CGRectMake(imageViewX, (imageViewY + imageViewH) - (imageViewH * [selfNum floatValue] / [maxValue floatValue]), imageViewW, imageViewH * [selfNum floatValue] / [maxValue floatValue]);
                imageView.layer.cornerRadius = imageViewW / 2;
                imageView.layer.masksToBounds = YES;
                
            }];
            
        }
        
    }else if ([maxValue floatValue] == [selfNum floatValue] && [maxValue floatValue] != 0) {
        
        // 最小值等于柱状图宽
        [UIView animateWithDuration:ANIMATETIME animations:^{
            
            imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
            imageView.layer.cornerRadius = imageViewW / 2;
            imageView.layer.masksToBounds = YES;
            
        }];
        
        
    }else if ([maxValue floatValue] == [selfNum floatValue] && [maxValue floatValue] == 0) {
        
        // 最小值等于柱状图宽
        [UIView animateWithDuration:ANIMATETIME animations:^{
            
            imageView.frame = CGRectMake(imageViewX, imageViewY + imageViewH - imageViewW, imageViewW, imageViewW);
            imageView.layer.cornerRadius = imageViewW / 2;
            imageView.layer.masksToBounds = YES;
            
        }];
        
        
    }
    return imageView;
}


@end
