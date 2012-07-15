//
//  CommonScrollView.h
//  Newsfeed
//
//  Created by Tomer Shiri on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PapyrusScrollView : UIScrollView {
    NSMutableArray* views;
    int padding;
}

@property (nonatomic,retain) NSMutableArray* views;
@property (nonatomic,assign) int padding;

- (void) addView:(UIView*)subView;
- (void) addView:(UIView*)subView animated:(BOOL) animated;

- (void) removeView:(UIView*)subView;
- (void) removeView:(UIView*)subView animated:(BOOL) animated;

- (void) refreshScrollView;
- (void) refreshScrollView:(BOOL)animated;

- (void) clearAllViews;

@end
