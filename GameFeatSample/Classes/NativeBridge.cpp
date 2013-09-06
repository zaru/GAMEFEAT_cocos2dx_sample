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

const char* NativeBridge::getAppVersion()
{
    JniMethodInfo t;
    const char* ret = NULL;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "getAppVersionInJava", "()Ljava/lang/String;"))
    {
        jstring jstr = (jstring)t.env->CallStaticObjectMethod(t.classID,t.methodID);
        std::string sstr = JniHelper::jstring2string(jstr);
        t.env->DeleteLocalRef(t.classID);
        t.env->DeleteLocalRef(jstr);
        
        CCString* cstr = CCString::create(sstr.c_str());
        ret = cstr->getCString();
    }
    return ret;
}

void NativeBridge::showGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

void NativeBridge::showAllGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showAllGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

void NativeBridge::hideAllGameFeat()
{
}

void NativeBridge::showIconGameFeat()
{
    JniMethodInfo t;
    
    if (JniHelper::getStaticMethodInfo(t, CLASS_NAME, "showIconGameFeatJNI", "()V"))
    {
        t.env->CallStaticVoidMethod(t.classID, t.methodID);
    }
}

void NativeBridge::hideIconGameFeat()
{
}