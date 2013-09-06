//
//  GameFeatSampleAppController.h
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/04.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <GameFeatKit/GFPopupView.h>
#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>
#import <GameFeatKit/GFIconController.h>
#import <GameFeatKit/GFIconView.h>

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate, UITextFieldDelegate,UIApplicationDelegate> {
    UIWindow *window;
    RootViewController    *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;
@property (nonatomic, retain) GFPopupView *popupView;
@property (nonatomic, retain) GFIconController *gfIconController;
@property (nonatomic, retain) GFIconView *iconView;

- (void)showGameFeat;
- (void)hideGameFeat;
- (void)showIconGameFeat;
- (void)hideIconGameFeat;

@end

