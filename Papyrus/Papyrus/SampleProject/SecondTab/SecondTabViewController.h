//
//  SecondTabViewController.h
//  Papyrus
//
//  Created by Tomer shiri on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabbedContainerProtocol.h"

@interface SecondTabViewController : UIViewController<MainTabbedContainerProtocol> {
    UIView* view;
}

@end
