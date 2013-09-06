//
//  ViewController.m
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/06.
//
//

#import "ViewController.h"
#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // 全画面広告を初期化
        GFPopupView *popupView = [[GFPopupView alloc] init];
        
        // n回に1回表示するタイミング設定（1にすると毎回表示されます）
        [popupView setSchedule:2];
        
        // 全画面広告の表示アニメーションを無効にします（デフォルトはアニメーション有効 = YES）
        //[popupView setAnimation:NO];
        
        // 全画面広告の表示
        if ([popupView loadAd:@"100"]) {
            [self.view addSubview:popupView];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UIDevice *device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
        backgroundSupported = device.multitaskingSupported;
    }
    if (backgroundSupported) {
        [GFController backgroundTask];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [GFController conversionCheckStop];
}

+ (void)showGameFeat
{
    NSLog(@"showGameFeat");
}

@end
