//
//  ViewController.m
//  Inberdar
//
//  Created by hw17a042 on 2018/11/17.
//  Copyright © 2018年 Taiju Okuda. All rights reserved.
//

#import "ViewController.h"
#import "MyGLView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSRect viewFrame = [self.view frame];
    MyGLView *glView = [[MyGLView alloc] initWithFrame:viewFrame];
    glView.translatesAutoresizingMaskIntoConstraints = YES;
    glView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.view addSubview:glView];
}

@end
