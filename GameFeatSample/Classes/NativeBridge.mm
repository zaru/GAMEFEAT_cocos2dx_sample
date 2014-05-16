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

#define GF_SITE_ID @"213"

/**
 * オファーウォール型GameFeat表示
 */
void NativeBridge::showGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [GFController showGF:(UIViewController *)appController.viewController site_id:GF_SITE_ID];
    NSLog(@"showGameFeat");
}

/**
 * 全画面型GameFeat表示
 */
void NativeBridge::showAllGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [appController showGameFeat];
    NSLog(@"showAllGameFeat");
}

/**
 * 全画面型GameFeat非表示
 */
void NativeBridge::hideAllGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [appController hideGameFeat];
    NSLog(@"hideAllGameFeat");
}

/**
 * アイコン型GameFeat表示
 */
void NativeBridge::showIconGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [appController showIconGameFeat];
    NSLog(@"showIconGameFeat");
}

/**
 * アイコン型GameFeat非表示
 */
void NativeBridge::hideIconGameFeat()
{
    AppController *appController = (AppController*)[[UIApplication sharedApplication] delegate];
    [appController hideIconGameFeat];
    NSLog(@"hideIconGameFeat");
}