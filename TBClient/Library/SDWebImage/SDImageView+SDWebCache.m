//
//  UIImageView+SDWebCache.m
//  SDWebData
//
//  Created by stm on 11-7-13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SDImageView+SDWebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView(SDWebCacheCategory)



- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url refreshCache:NO];
}

- (void)setImageWithURL:(NSURL *)url refreshCache:(BOOL)refreshCache
{
	[self setImageWithURL:url refreshCache:refreshCache placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url refreshCache:(BOOL)refreshCache placeholderImage:(UIImage *)placeholder
{
    SDWebDataManager *manager = [SDWebDataManager sharedManager];
	
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
	
    self.image = placeholder;
	
    if (url)
    {
        [manager downloadWithURL:url delegate:self context:nil refreshCache:refreshCache];
    }
}

- (void)cancelCurrentImageLoad
{
    [[SDWebDataManager sharedManager] cancelForDelegate:self];
}

#pragma mark -
#pragma mark SDWebDataManagerDelegate

- (void)webDataFinishWithData:(NSData *)aData context:(id)context isCache:(BOOL)isCache
{
    
    UIImage *img = [[UIImage alloc] initWithData:aData];
    self.image = img;

    if (isCache == NO) {
            
            //淡入淡出动画1
            [self fadeIn];
            
            //淡入淡出动画2
            //[self fadeInLayer:self.layer];
        }
    


}

- (void)fadeIn
{
    self.alpha = 0.0f;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.50f];
    self.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)fadeInLayer:(CALayer *)l
{
    CABasicAnimation *fadeInAnimate   = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAnimate.duration            = 0.3;
    fadeInAnimate.repeatCount         = 1;
    fadeInAnimate.autoreverses        = NO;
    fadeInAnimate.fromValue           = [NSNumber numberWithFloat:0.0];
    fadeInAnimate.toValue             = [NSNumber numberWithFloat:1.0];
    fadeInAnimate.removedOnCompletion = YES;
    [l addAnimation:fadeInAnimate forKey:@"animateOpacity"];
    return;
}

@end
