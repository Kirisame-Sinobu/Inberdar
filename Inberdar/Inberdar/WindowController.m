//
//  WindowController.m
//  Inberdar
//

//  Created by hw17a042 on 2018/11/18.
//  Copyright © 2018年 Taiju Okuda. All rights reserved.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController


- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.window.delegate = self;
    self.window.frameAutosaveName = @"Main Window";
    [self.window setContentSize:NSMakeSize(640, 480)];
}


///windowが閉じられた時アプリケーションを終了するためのもの。
- (void)windowWillLoadClose:(NSNotification *)notification{
    [NSApp terminate:self];
}

///windowをリサイズした時に呼び出され。フルスクリーンなら何もせず違うなら元の大きさに戻し大きさを変更させないようにしている。
- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    if([self.window styleMask] & NSWindowStyleMaskFullScreen){
        return frameSize;
    }else{
        NSRect rect = NSMakeRect(0,0,640,480);
        rect = [self.window frameRectForContentRect:rect];
        return  rect.size;
//        return frameSize;
    }
}

@end
