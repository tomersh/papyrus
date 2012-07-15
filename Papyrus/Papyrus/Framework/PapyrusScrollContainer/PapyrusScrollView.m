//
//  CommonScrollView.m
//  Newsfeed
//
//  Created by Tomer Shiri on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PapyrusScrollView.h"


@interface PapyrusScrollView ()

-(void)updateScrollViewContentSizeHeight:(int) newHeight;
-(void)updateScrollViewContentSizeHeight:(int) newHeight animated:(BOOL) animated;

-(void) setTop:(int)topValue toView:(UIView*) view;

@end

@implementation PapyrusScrollView

@synthesize views, padding;


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    self.views = [[[NSMutableArray alloc] init] autorelease];
    return self;
}

-(id) init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

-(void) addView:(UIView*)subView {
    [self addView:subView animated:NO];
}

-(void) addView:(UIView*)subView animated:(BOOL) animated {
    if (subView == nil) return;
    [self setTop:(self.contentSize.height + self.padding) toView:subView];
    [self.views addObject:subView];
    [self addSubview:subView];
    [self updateScrollViewContentSizeHeight:(subView.frame.origin.y + subView.frame.size.height + self.padding) animated:animated];
}

- (void) removeView:(UIView*)subView {
    [self removeView:subView animated:NO];
}

- (void) removeView:(UIView*)subView animated:(BOOL) animated {
    if(subView == nil) return;
    [subView removeFromSuperview];
    [self.views removeObject:subView];
    [self refreshScrollView:animated];
}

- (void) refreshScrollView{
    [self refreshScrollView:NO];
}

- (void) refreshScrollView:(BOOL)animated {
    
    if ([self.views count] == 0) return;
    
    NSMutableArray* activeViews = [NSMutableArray arrayWithArray:self.views];
    [self clearAllViews];
    for (UIView* view in activeViews) {
        [self addView:view animated:animated];
    }
}

-(void) updateScrollViewContentSizeHeight:(int) newHeight {
    [self updateScrollViewContentSizeHeight:newHeight animated:NO];
}

-(void)updateScrollViewContentSizeHeight:(int) newHeight animated:(BOOL) animated {  
    
    CGRect frameBeforeStrech = CGRectMake(self.contentOffset.x, self.contentOffset.y, self.frame.size.width, self.frame.size.height);
    CGSize newSize = CGSizeMake(self.frame.size.width, newHeight);
    
    if (!animated) {
        self.contentSize = newSize;
    }
    else {
        [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationTransitionCurlUp
          animations:^{
              self.contentSize = newSize;
          } 
          completion:^(BOOL finished){}];
    }
    [self scrollRectToVisible:frameBeforeStrech animated:NO];
 }
 
-(void)clearAllViews {
    for (UIView* view in self.views) {
        [view removeFromSuperview];
    }
    [self.views removeAllObjects];
    self.contentSize = CGSizeMake(self.frame.size.width, 0);
}

-(void) setTop:(int)topValue toView:(UIView*) view {
    if (view == nil) return;
    view.frame = CGRectMake(view.frame.origin.x, topValue, view.frame.size.width, view.frame.size.height);
}

-(void) dealloc{
    self.views = nil;
    [super dealloc];
}

@end
