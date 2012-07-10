//
//  FirstTabViewController.h
//  Papyrus
//
//  Created by Tomer shiri on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenericTabbedViewController.h"
#import "MainTabbedContainerProtocol.h"

@interface FirstTabViewController : UIViewController<MainTabbedContainerProtocol> {
    UIView* view;
}

@end
