//
//  FirstTabViewController.m
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstTabViewController.h"
#import "ViewForScrollviewProtocol.h"

@interface FirstTabViewController ()

+(NSString*) numberToWord:(int) number;

@end

@implementation FirstTabViewController

-(id)init {
    self = [super initWithPapyrusScrollviewViewProtocol:@protocol(ViewForScrollviewProtocol) andStyle:GenericBoxedViewStyleTabbed];
    if (!self) return self;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"papyrus.jpg"]];
    int i = 1;
    for (UIViewController<ViewForScrollviewProtocol>* viewController in self.viewControllers) {
        [viewController setText:[NSString stringWithFormat:@"%@",[FirstTabViewController numberToWord:i++]]];
    }
    return self;
}

-(void)loadView {
    [super loadView];
    [self layoutSubviewsOnView];
}

-(int)getPosition {
    return 0;
}

-(TabVisiblityStatus) tabVisiblityStatus {
    return TabVisibleStatusSelectable;
}

-(NSString*) getTabCaption {
    return @"First Tab";
}
-(NSString*) getTabIconFileName {
    return @"dog-paw";
}

+(NSString*) numberToWord:(int) number {
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterSpellOutStyle];
    [formatter setLocale:[NSLocale currentLocale]];
    NSString* numberString = [formatter stringFromNumber:[NSNumber numberWithInt: number]];
    [formatter release];
    return numberString;
}

-(void)dealloc {
    [super dealloc];
}

@end
