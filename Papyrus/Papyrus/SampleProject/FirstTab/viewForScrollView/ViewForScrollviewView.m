//
//  ViewForScrollviewViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewForScrollviewView.h"

@interface ViewForScrollviewView ()

@end

@implementation ViewForScrollviewView


- (id)init {
    self = [self initWithFrame:CGRectMake(0, 0, 320, 200)];
    return self;
}


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    overlay = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x + 5, frame.origin.y + 5, frame.size.width - 10, frame.size.height - 10)];
    overlay.backgroundColor = [UIColor blackColor];
    overlay.alpha = 0.7f;
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, overlay.frame.size.width, overlay.frame.size.height)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = UITextAlignmentCenter;
    textLabel.font = [UIFont fontWithName:@"Arial" size:40.f];
    [overlay addSubview:textLabel];
    [self addSubview:overlay];
    return self;
}

-(void)setText:(NSString *)text {
    textLabel.text = text;
}


@end
