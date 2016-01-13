//
//  RandomAvatar.m
//  RandomAvatar
//
//  Created by Ding on 15/9/9.
//  Copyright (c) 2015年 liuding. All rights reserved.
//

#import "RandomAvatar.h"

@implementation RandomAvatar

+ (UIImage *)randomAvatarWithDotColor:(UIColor *)dotColor backgroundColor:(UIColor *)bgColor diameter:(NSUInteger)diameter
{
    if (!dotColor) {
        dotColor = [UIColor blueColor];
    }
    
    if (!bgColor) {
        bgColor = [UIColor clearColor];
    }
    

    CGFloat dotDiameter = 10;
    CGFloat margin = -1;
    
    CGFloat totalW = dotDiameter * [self numberOfDotsWide];
    CGFloat totalH = dotDiameter * [self numberOfDotsHeight];
    CGSize size  = CGSizeMake(totalW + ([self numberOfDotsWide]-1) * margin, totalH + ([self numberOfDotsHeight]-1) * margin);
//    CGRect rect = (CGRect){CGPointZero, size};

    
    UIImage *avatar;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    {
        CGContextRef imgCtx = UIGraphicsGetCurrentContext();

     
        [self drawSymbolWithColor:dotColor
                       edgeLength:dotDiameter
                           margin:margin
                       startPoint:CGPointZero
                        inContext:imgCtx];
        
        
        avatar = UIGraphicsGetImageFromCurrentImageContext();
        
    }
    UIGraphicsEndImageContext();
    
    
    return [self circularImage:avatar withDiameter:diameter highlightedColor:bgColor];

}

+ (UIImage *)circularImage:(UIImage *)image withDiameter:(NSUInteger)diameter highlightedColor:(UIColor *)highlightedColor
{
    NSParameterAssert(image != nil);
    NSParameterAssert(diameter > 0);
    
    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        if (highlightedColor != nil) {
            CGContextSetFillColorWithColor(context, highlightedColor.CGColor);
            CGContextFillEllipseInRect(context, frame);
        }
        
        
        UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frame];
        [imgPath addClip];
        CGFloat w = ceil(diameter/1.45);
        CGFloat x = (frame.size.width - w ) /2 ;
        CGFloat y = (frame.size.height - w ) /2;
        CGRect rect = CGRectMake(x, y, w, w);
        [image drawInRect:rect];
        
       
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (void)drawSymbolWithColor:(UIColor *)color
                 edgeLength:(CGFloat)edgeLength
                     margin:(CGFloat)margin
                 startPoint:(CGPoint)startPoint
                  inContext:(CGContextRef)ctx
{
    
    float x = 0;
    float y = 0;
    float l = edgeLength + margin ;
    
    NSArray *coord = [self randomCoordinate];
    
    
    CGRect frm;
    for (int r = 0; r < [coord count]; r++) {
        NSArray *column = coord[r];
        
        for (int c = 0; c < [column count]; c++) {

            BOOL on = [column[c] boolValue];
            
            y = startPoint.y + r * l;
            x = startPoint.x + c * l;
            
            frm = CGRectMake(x, y, edgeLength, edgeLength);

            if (on) {
                
                CGContextSetFillColorWithColor(ctx, color.CGColor);

                CGContextFillEllipseInRect(ctx, frm);

            } else {
//                CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
//                CGContextFillRect(ctx, frm);

            }
        }
    }
}


+ (NSInteger)numberOfDotsWide
{
    return 5;
}

+ (NSInteger)numberOfDotsHeight
{
    return 5;
}


+ (NSArray *)randomCoordinate
{
    NSInteger coorRow = [self numberOfDotsHeight];
    NSInteger coorCol = [self numberOfDotsWide];
    
    NSMutableArray *rowArray = [NSMutableArray arrayWithCapacity:coorRow];
    for (int row = 0; row < coorRow; row ++) {
        
        NSMutableArray *colArray = [NSMutableArray arrayWithCapacity:coorCol];
        for (int col = 0; col < coorCol/2; col ++) {
            int flag = arc4random()%2;
            [colArray addObject:@(flag)];
        }
        NSArray *rightPart = [self reverseArray:colArray];
        [colArray addObject:@(arc4random()%2)];
        [colArray addObjectsFromArray:rightPart];
        
        [rowArray addObject:colArray];
    }
    
    return rowArray;
}

+ (NSArray *)reverseArray:(NSArray *)array
{
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:array.count];
    
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    id theObject;
    while ( theObject = [enumerator nextObject]) {
        [mArray addObject:theObject];
    }
    
    return mArray;
    
}

@end
