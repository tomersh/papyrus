//
//  ViewForScrollviewProtocol.h
//  Papyrus
//
//  Created by Tomer shiri on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PapyrusScrollviewViewProtocol.h"

@protocol ViewForScrollviewProtocol <PapyrusScrollviewViewProtocol>

-(void) setText:(NSString*) text;

@end
