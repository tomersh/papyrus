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

#import "MainTabbedViewController.h"
#import "MainTabbedContainerProtocol.h"

@interface MainTabbedViewController ()

@end

@implementation MainTabbedViewController


-(id)init {
    self = [super initWithTabType:@protocol(MainTabbedContainerProtocol)];
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadViewControllersOntoContainter];
}

@end
