//
//  GameFeat.h
//  GameFeat
//
//  Created by n-watanabe on 13/02/13.
//  Copyright (c) 2013年 Basicinc.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <StoreKit/StoreKit.h>
#import "GFCommon.h"

@protocol GFViewDelegate <NSObject>
- (void)didShowGameFeat;    // GameFeatの画面が開かれたタイミングで呼び出されるメソッド
- (void)didCloseGameFeat;   // GameFeatの画面が閉じられたタイミングで呼び出されるメソッド
- (void)didGetGfAds:(NSArray *)lists;   // GameFeatの広告一覧データが取得できたタイミングで呼び出されるメソッド(カスタム広告用)
- (void)failGetGfAds;       // GameFeatの広告一覧データが取得できなかったタイミングで呼び出されるメソッド(カスタム広告用)
@end

@interface GFView : UIViewController <UIWebViewDelegate,SKStoreProductViewControllerDelegate> {
    //UIWebView *_webView;
    UIViewController *gfDelegate;
    NSURLConnection *httpConnection;
    NSMutableData *httpData;
    NSString *uuid;
    int requestType;
}

@property (nonatomic, retain) UIViewController *gfDelegate;
@property (nonatomic, retain) NSString *gfSiteId;
@property (nonatomic, retain) NSMutableArray *gfInstalledAdList;
@property (assign) id<GFViewDelegate> delegate;
@property (nonatomic, retain) NSDictionary *gfEntry;

- (void)start:(UIViewController *)parent site_id:(NSString *)site_id;
- (void)start:(UIViewController *)parent site_id:(NSString *)site_id delegate:(id<GFViewDelegate>)del;
- (BOOL)conversionCheck;
- (void)activateGF:(NSString *)site_id;
- (void)activateGF:(NSString *)site_id custom:(BOOL)custom;
- (BOOL)getGFAds:(id<GFViewDelegate>)delegate;

- (void)showGFEntry:(UIViewController *)parent ad:(NSDictionary *)ad;
- (void)showGFEntry:(UIViewController *)parent ad:(NSDictionary *)ad delegate:(id<GFViewDelegate>)del;
- (void)showGFDL:(UIViewController *)parent ad:(NSDictionary *)ad;

@end