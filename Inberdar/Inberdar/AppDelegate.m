//
//  AppDelegate.m
//  Inberdar
//
//  Created by hw17a042 on 2018/11/17.
//  Copyright © 2018年 Taiju Okuda. All rights reserved.
//

#import "AppDelegate.h"
<<<<<<< HEAD
=======
#import "MyGLView.h"
>>>>>>> 7138e851451c06a31b3157bbc6d5147370acfcf2

@interface AppDelegate ()

@end

@implementation AppDelegate

<<<<<<< HEAD
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


=======
///windowが閉じられた時ディスプレイ・リンク（unityのupdate的なの）が消される。
- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication*)sender
{
    [[MyGLView sharedInstance] stopDisplayLink];
    return NSTerminateNow;
}

>>>>>>> 7138e851451c06a31b3157bbc6d5147370acfcf2
@end
