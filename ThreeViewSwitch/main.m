//
//  main.m
//  ThreeViewSwitch
//
//  Created by qingyun on 8/30/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

typedef int (*PYStdWriter)(void *, const char *, int);
static PYStdWriter _oldStdWrite;


int __pyStderrWrite(void *inFD, const char *buffer, int size)
{
    if ( strncmp(buffer, "AssertMacros:", 13) == 0 ) {
        return 0;
    }
    return _oldStdWrite(inFD, buffer, size);
}


int main(int argc, char * argv[])
{
    _oldStdWrite = stderr->_write;
    stderr->_write = __pyStderrWrite;
    /***************/
    //以上去掉多打印日志 /SourceCache/IOKitUser/IOKitUser-920.1.11/hid.subproj/IOHIDEventQueue.c, line: 512
    /***************/
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
