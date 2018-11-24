
//
//  MyGLView.m
//  Inberdar
//
//  Created by hw17a036 on 2018/11/17.
//  Copyright © 2018年 Taiju Okuda. All rights reserved.
//
//
//#import "MyGLView.h"
//
//@implementation MyGLView
//
//- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
//
//    // Drawing code here.
//}
//
//@end

#import "MyGLView.h"

#import <OpenGL/OpenGL.h>
#import <OpenGL/gl3.h>

//ふめーなえらーです？
//エル・プサイ＿コングルー
//シュタインズゲート
//α世界線へと！！

@implementation MyGLView {
    NSOpenGLContext     *glContext;
    CVDisplayLinkRef    displayLink;
    float               value;
}

static CVReturn DisplayLinkCallback(CVDisplayLinkRef displayLink,
                                    const CVTimeStamp* now,
                                    const CVTimeStamp* outputTime,
                                    CVOptionFlags flagsIn,
                                    CVOptionFlags *flagsOut,
                                    void *displayLinkContext)
{
    @autoreleasepool {
        MyGLView *glView = (__bridge MyGLView *)displayLinkContext;
        [glView render];
        return kCVReturnSuccess;
    }
}

- (instancetype)initWithFrame:(NSRect)frame
{
    NSOpenGLPixelFormatAttribute attrs[] =
    {
        NSOpenGLPFAAllowOfflineRenderers,
        NSOpenGLPFAAccelerated,
        NSOpenGLPFADoubleBuffer,
        NSOpenGLPFAColorSize, 32,
        NSOpenGLPFADepthSize, 32,
        NSOpenGLPFAMultisample,
        NSOpenGLPFASampleBuffers, 1,
        NSOpenGLPFASamples, 4,
        NSOpenGLPFANoRecovery,
        NSOpenGLPFAOpenGLProfile, NSOpenGLProfileVersion3_2Core,
        0
    };
    
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attrs];
    
    self = [super initWithFrame:frame pixelFormat:pixelFormat];
    if (self) {
        [self setWantsBestResolutionOpenGLSurface:YES];
    }
    return self;
}

- (void)prepareOpenGL
{
    [super prepareOpenGL];
    
    glContext = [self openGLContext];
    
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    [glContext flushBuffer];
    
    value = 0.0f;
    
    CGLContextObj cglContext = [[self openGLContext] CGLContextObj];
    CGLPixelFormatObj cglPixelFormat = [[self pixelFormat] CGLPixelFormatObj];
    CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
    CVDisplayLinkSetOutputCallback(displayLink, &DisplayLinkCallback, (__bridge void*)(self));
    CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(displayLink, cglContext, cglPixelFormat);
    CVDisplayLinkStart(displayLink);
}

float PingPong(float t)
{
    t -= floorf(t / 2.0f) * 2.0f;
    return 1.0f - fabsf(t - 1.0f);
}

- (void)render
{
    [glContext lock];
    [glContext makeCurrentContext];
    
    glClearColor(1.0f - PingPong(value), PingPong(value), 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    
    value += 0.01f;
    
    [glContext flushBuffer];
    [glContext unlock];
}

@end
