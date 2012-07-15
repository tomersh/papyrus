// Papyrus - Protocol driven framework for automatic loading 
// and rendering of ViewControllers for iPhone apps.
// http://github.com/tomersh/papyrus
//
//Copyright 2012 Tomer Shiri - papyrus@shiri.info
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
// 
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

#import "ScrolledViewViewControllerBase.h"

@interface ScrolledViewViewControllerBase ()

@end

@implementation ScrolledViewViewControllerBase

-(int) getPosition {
    return 0;
}

-(int) getHeight {
    return view == nil ? 0 : view.frame.size.height;
}

-(BOOL) isVisible {
    return view != nil;
}

-(id)init {
    self = [super init];
    if (!self) return self;
    view = [[ViewForScrollviewView alloc] init];
    return self;
}

-(void)loadView {
    [super loadView];
    [self.view addSubview:view]; 
}

-(void)setText:(NSString *)text {
    if (view == nil) return;
    [view setText:text];
}


-(void)dealloc {
    [view release];
    [super dealloc];
}

@end
