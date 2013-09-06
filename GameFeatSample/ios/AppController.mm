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

    /*********************************************************************/
    /*
     全画面GameFeat
    */
    // 全画面広告を初期化
    self.popupView = [[GFPopupView alloc] init];
    
    // n回に1回表示するタイミング設定（1にすると毎回表示されます）
    [self.popupView setSchedule:2];
    
    // 全画面広告の表示アニメーションを無効にします（デフォルトはアニメーション有効 = YES）
    [self.popupView setAnimation:NO];
    
    // 全画面広告の表示
    if ([self.popupView loadAd:GF_SITE_ID]) {
        [viewController.view addSubview:self.popupView];
    }
    
    //隠す
    [self hideGameFeat];
    /*********************************************************************/
    
    /*********************************************************************/
    /*
     アイコンGameFeat
     */
    // GFIconControllerの初期化
    self.gfIconController = [[GFIconController alloc] init];
    
    // アイコンの自動更新間隔を指定（デフォルトで30秒／最短10秒）
    [self.gfIconController setRefreshTiming:10];
    
    // アイコン下のアプリ名テキストの色をUIColorで指定出来ます（デフォルト黒）
    [self.gfIconController setAppNameColor:[UIColor redColor]];
    
    // アイコンの配置位置を設定（1個〜20個まで設置出来ます）
    {
        self.iconView = [[[GFIconView alloc] initWithFrame:CGRectMake(18, 150, 57, 57)] autorelease];
        [self.gfIconController addIconView:self.iconView];
        [viewController.view addSubview:self.iconView];
    }
    
    //隠す
    [self hideIconGameFeat];
    [self.gfIconController loadAd:GF_SITE_ID];
    /*********************************************************************/
    
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

- (void)showGameFeat {
    if (self.popupView) {
        self.popupView.hidden = NO;
    }
}

- (void)hideGameFeat {
    if (self.popupView) {
        self.popupView.hidden = YES;
    }
}

- (void)showIconGameFeat {
    if (self.iconView) {
        self.iconView.hidden = NO;
    }
}

- (void)hideIconGameFeat {
    if (self.iconView) {
        self.iconView.hidden = YES;
    }
}

@end

