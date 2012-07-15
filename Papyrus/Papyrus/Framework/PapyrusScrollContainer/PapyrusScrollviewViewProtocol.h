//
//  BoxViewProtocol.h
//  Newsfeed
//
//  Created by Tomer shiri on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PapyrusBasedViewControllerProtocol.h"

@protocol PapyrusScrollviewViewProtocol <PapyrusBasedViewControllerProtocol>

-(int) getHeight;

-(BOOL) isVisible;

@end
