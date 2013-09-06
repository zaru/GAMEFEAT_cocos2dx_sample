//
//  GFPopupView.h
//  GameFeatKit
//
//  Created by zaru on 2013/07/08.
//  Copyright (c) 2013年 Basicinc.jp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GFCommon.h"

@interface GFPopupView : UIView {
    int requestType;
}
- (void)setImageUrl:(NSString *)imageUrl;
- (void)setClickUrl:(NSString *)clickUrl;

- (BOOL)loadAd:(NSString *)site_id;
- (void)loadAdApi;
- (void)setPopupViewData;
- (void)setSchedule:(int)count;
- (void)setAnimation:(BOOL)flag;
- (void)saveClick:(NSString *)ad_id scheme:(NSString *)scheme click_time:(NSNumber *)click_time;
- (void)setPopupData:(NSString *)imageUrl clickUrl:(NSString *)clickUrl adId:(NSString *)adId packageName:(NSString *)packageName;
- (int)unixtimestamp;
- (void)show;
- (void)animation1;
- (void)animation2;

@property (nonatomic) int currentCount;
@property (nonatomic) int scheduleCount;
@property (nonatomic) BOOL isPortrait;
@property (nonatomic) BOOL isAnimation;
@property (nonatomic, retain) UIImageView *popupImageView;
@property (nonatomic, retain) UIImageView *closeImageView;
@property (nonatomic, retain) NSString *adId;
@property (nonatomic, retain) NSString *packageName;
@property (nonatomic, retain) NSString *url;

@property (nonatomic, retain) NSString *uuid;
@property (nonatomic, retain) NSString *gfSiteId;
@property (nonatomic, retain) NSDictionary *popupAdLists;

@property (nonatomic, retain) NSURLConnection *httpConnection;
@property (nonatomic, retain) NSMutableData *httpData;
@end
