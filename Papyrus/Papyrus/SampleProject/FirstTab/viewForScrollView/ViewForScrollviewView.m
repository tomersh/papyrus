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
