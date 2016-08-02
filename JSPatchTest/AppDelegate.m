//
//  AppDelegate.m
//  JSPatchTest
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import "AppDelegate.h"
#import "HYBNetworking.h"
//#import "JSPatch.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setJPEngine:nil];
    //可以通过更改url下的脚本文件完成修改
    //该url是项目一级目录下的.js文件的路径
    NSString *url = @"file:///Users/apple/Desktop/CaryExercise/JSPatchTest/cary.js";
    NSString * path = [NSString stringWithFormat:@"%@/Documents/cary.js",NSHomeDirectory()];
    [HYBNetworking downloadWithUrl:url saveToPath:path progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id response) {
        //这里将下载的脚本文件保存 重新设置一下
        [self setJPEngine:path];
    } failure:^(NSError *error) {
        
    }];
    // Override point for customization after application launch.
    return YES;
}

- (void)setJPEngine:(NSString *)path{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"cary" ofType:@"js"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (path && [fileManager fileExistsAtPath:path]) {
        sourcePath = path;
    }
    [JPEngine startEngine];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
