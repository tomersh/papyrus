//
//  ViewForScrollviewViewController.h
//  Papyrus
//
//  Created by Tomer shiri on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewForScrollviewView : UIView {
    UIView* overlay;
    UILabel* textLabel;
}

-(void) setText:(NSString*) text;

@end
