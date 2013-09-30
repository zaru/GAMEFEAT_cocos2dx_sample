//
//  NativeBridge.cpp
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/04.
//
//

#include "NativeBridge.h"
#include <android/log.h>
#include <jni.h>
#include "cocoa/CCString.h"
#include "platform/android/jni/JniHelper.h"

#define CLASS_NAME "jp/shinji/GameFeatSample/GameFeatSample"

using namespace std;
using namespace cocos2d;

/**
 * オファーウォール型GameFeat表示
 */
void NativeBridge::showGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

/**
 * 全画面型GameFeat表示
 */
void NativeBridge::showAllGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showAllGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

/**
 * 全画面型GameFeat非表示
 */
void NativeBridge::hideAllGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "hideAllGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

/**
 * アイコン型GameFeat表示
 */
void NativeBridge::showIconGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showIconGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

/**
 * アイコン型GameFeat非表示
 */
void NativeBridge::hideIconGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "hideIconGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}