//
//  GFCommon.h
//  GameFeatKit
//
//  Created by zaru on 2013/07/09.
//  Copyright (c) 2013年 Basicinc.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SDK_VERSION     @"2.0.0"

#define URL_GF_BASE         @"https://www.gamefeat.net/"
#define URL_GF_UUID         @"https://www.gamefeat.net/api/ios/v1/requestUUID.json"
#define URL_GF_SCHEME       @"https://www.gamefeat.net/api/ios/v1/requestAppList.json"
#define URL_GF_ADLIST       @"https://www.gamefeat.net/api/ios/v1/requestAds/"
#define URL_GF_CLICK        @"https://www.gamefeat.net/api/ios/v1/reportClick/"
#define URL_GF_CONV         @"https://www.gamefeat.net/api/ios/v1/reportCV/"
#define URL_GF_ADJSON       @"https://www.gamefeat.net/api/ios/v1/requestAdsLists/"
#define URL_GF_ADENTRY      @"https://www.gamefeat.net/api/ios/v1/requestAdDetail/"
#define URL_GF_IMP          @"https://www.gamefeat.net/api/v1/countUpAds/"
#define URL_GF_ICON_ADLIST  @"https://www.gamefeat.net/api/ios/v1/requestIconAds.json"
#define URL_GF_POPUP_ADLIST @"https://www.gamefeat.net/api/ios/v1/requestPopupAds.json"
#define URL_GF_ICON_CONV    @"https://www.gamefeat.net/api/ios/v1/reportIconCV/"
#define URL_GF_POPUP_CONV   @"https://www.gamefeat.net/api/ios/v1/reportPopupCV/"
#define URL_ITUNES          @"itms-apps://itunes.apple.com/jp/app/id"

#define REQUEST_NONE            0
#define REQUEST_UUID            1
#define REQUEST_SCHEME          2
#define REQUEST_ADLIST          3
#define REQUEST_CLICK           4
#define REQUEST_CONV            5
#define REQUEST_ADJSON          6
#define REQUEST_ADENTRY         7
#define REQUEST_IMP             8
#define REQUEST_ICON_ADLIST     9
#define REQUEST_POPUP_ADLIST    9

#define ALERT_MODE_WAIT         0

#define TAG_DISPLAY_VIEW        999
#define TAG_WEBVIEW_ERROR       101
#define TAG_WEBVIEW_ENTRY       102

#define ICON_REFRESH_TIMING     20

@interface GFCommon : NSObject

@end
