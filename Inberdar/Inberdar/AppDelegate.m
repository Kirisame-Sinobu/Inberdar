//
//  AppDelegate.m
//  Inberdar
//
//  Created by hw17a042 on 2018/11/17.
//  Copyright © 2018年 Taiju Okuda. All rights reserved.
//

#import "AppDelegate.h"
#import "MyGLView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

///windowが閉じられた時ディスプレイ・リンク（unityのupdate的なの）が消される。
- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication*)sender
{
    [[MyGLView sharedInstance] stopDisplayLink];
    return NSTerminateNow;
}

@end
