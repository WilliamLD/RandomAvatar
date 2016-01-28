//
//  RandomAvatar.h
//  RandomAvatar
//
//  Created by Ding on 15/9/9.
//  Copyright (c) 2015年 liuding. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b)                   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RandomColor                     RGB(arc4random()%255, arc4random()%255, arc4random()%255)


@interface RandomAvatar : UIImage


+ (UIImage *)randomAvatarWithDotColor:(UIColor *)dotColor backgroundColor:(UIColor *)bgColor diameter:(NSUInteger)diameter;



@end
