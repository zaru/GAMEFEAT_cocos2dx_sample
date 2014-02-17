//
//  GameFeatSampleAppController.mm
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/04.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppController.h"
#import "cocos2d.h"
#import "EAGLView.h"
#import "AppDelegate.h"

#import "RootViewController.h"

@implementation AppController

@synthesize window;
@synthesize viewController;

// GAMEFEAT MediaID
#define GF_SITE_ID @"1580"

#pragma mark -
#pragma mark Application lifecycle

// cocos2d application instance
static AppDelegate s_sharedApplication;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    EAGLView *__glView = [EAGLView viewWithFrame: [window bounds]
                                     pixelFormat: kEAGLColorFormatRGBA8
                                     depthFormat: GL_DEPTH_COMPONENT16
                              preserveBackbuffer: NO
                                      sharegroup: nil
                                   multiSampling: NO
                                 numberOfSamples:0 ];

    // Use RootViewController manage EAGLView
    viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    viewController.wantsFullScreenLayout = YES;
    viewController.view = __glView;
    
    // Set RootViewController to window
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    {
        // warning: addSubView doesn't work on iOS6
        [window addSubview: viewController.view];
    }
    else
    {
        // use this method on ios6
        [window setRootViewController:viewController];
    }
    
    [window makeKeyAndVisible];

    [[UIApplication sharedApplication] setStatusBarHidden: YES];

    cocos2d::CCApplication::sharedApplication()->run();
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    cocos2d::CCDirector::sharedDirector()->pause();
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    // GF Activate
    [GFController activateGF:GF_SITE_ID useCustom:YES useIcon:YES usePopup:YES];
    
    cocos2d::CCDirector::sharedDirector()->resume();
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    UIDevice *device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
        backgroundSupported = device.multitaskingSupported;
    }
    if (backgroundSupported) {
        [GFController backgroundTask];
    }
    
    cocos2d::CCApplication::sharedApplication()->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    [GFController conversionCheckStop];
    
    cocos2d::CCApplication::sharedApplication()->applicationWillEnterForeground();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
     cocos2d::CCDirector::sharedDirector()->purgeCachedData();
}

- (void)viewDidAppear:(BOOL)animated
{
    // アイコン広告の表示
    [self.gfIconController loadAd:GF_SITE_ID];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // アイコン広告の自動更新を停止
    [self.gfIconController stopAd];
}

- (void)dealloc {
    [super dealloc];
}

/**
 * 全画面GameFeat追加
 */
- (void)addGameFeat {

    // 全画面広告を初期化（デリゲート版）
    self.popupView = [[GFPopupView alloc] init:self];
    
    // 毎回表示
    [self.popupView setSchedule:1];
    
    // 全画面広告の表示
    if ([self.popupView loadAd:GF_SITE_ID]) {
        [viewController.view addSubview:self.popupView];
    }
    
}

/**
 * アイコン型GameFeat追加
 */
- (void)addIconGameFeat {
    
    // GFIconControllerの初期化
    self.gfIconController = [[GFIconController alloc] init];
    
    // アイコンの自動更新間隔を指定
    [self.gfIconController setRefreshTiming:30];
    
    // アイコンの配置位置を設定
    {
        GFIconView *iconView = [[[GFIconView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)] autorelease];
        [self.gfIconController addIconView:iconView];
        [viewController.view addSubview:iconView];
    }
    {
        GFIconView *iconView = [[[GFIconView alloc] initWithFrame:CGRectMake(80, 10, 60, 60)] autorelease];
        [self.gfIconController addIconView:iconView];
        [viewController.view addSubview:iconView];
    }
    
    [self.gfIconController loadAd:GF_SITE_ID];
}

/**
 * 全画面型GameFeat表示
 */
- (void)showGameFeat {
    if (self.popupView) {
        [self hideGameFeat];
    }
    [self addGameFeat];
}

/**
 * 全画面型GameFeat削除
 */
- (void)hideGameFeat {
    if (self.popupView) {
        [self.popupView removeFromSuperview];
    }
}

/**
 * アイコン型GameFeat削除
 */
- (void)showIconGameFeat {
    if (self.iconView) {
        [self hideIconGameFeat];
    }
    [self addIconGameFeat];
}

/**
 * アイコン型GameFeat削除
 */
- (void)hideIconGameFeat {
    if (self.iconView) {
        [self.iconView removeFromSuperview];
    }
}

// 全画面広告が表示された際に実行される
- (void)didShowGameFeatPopup{
    NSLog(@"didShowGameFeatPopup");
}

// 全画面広告が閉じられた際に実行される
- (void)didCloseGameFeatPopup{
    NSLog(@"didCloseGameFeatPopup");
}

// 全画面広告が表示できなかった際に実行される
- (void)failGameFeatPopupData{
    NSLog(@"failGameFeatPopupData");
}

@end

