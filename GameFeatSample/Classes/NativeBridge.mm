//
//  NativeBridge.m
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/04.
//
//

#import "NativeBridge.h"
#include "cocoa/CCString.h"
using namespace cocos2d;
#include "AppController.h"

#import <GameFeatKit/GFView.h>
#import <GameFeatKit/GFController.h>
#define GF_SITE_ID @"1580"

const char* NativeBridge::getAppVersion()
{
    return "iPhone";
}

void NativeBridge::showGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [GFController showGF:(UIViewController *)appController.viewController site_id:GF_SITE_ID];
}