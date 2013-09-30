//
//  SubScene.cpp
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/06.
//
//

#include "SubScene.h"
#include "MainScene.h"
#include "NativeBridge.h"

using namespace cocos2d;
using namespace std;

CCScene* SubScene::scene()
{
    CCScene* scene = CCScene::create();
    SubScene* layer = SubScene::create();
    scene->addChild(layer);
    
    return scene;
}

bool SubScene::init()
{
    if (!CCLayer::init())
    {
        return false;
    }
    
    CCSize size = CCDirector::sharedDirector()->getWinSize();
    
    //backボタン
    CCMenuItemImage* backButton = CCMenuItemImage::create("backButton1.png", "backButton2.png", this, menu_selector(SubScene::backMain));
    backButton->setPosition(ccp(size.width/2, size.height/9));
    backButton->setTag(tag_back);
    
    CCMenu* menu = CCMenu::create(backButton, NULL);
    menu->setPosition(CCPointZero);
    this->addChild(menu);
    
    NativeBridge::showAllGameFeat();
    
    return true;
}

//メイン画面へ戻る
void SubScene::backMain(CCObject* pSender)
{
    int tag = ((CCMenuItem *)(pSender))->getTag();
    
    if (tag == tag_back)
    {
        //全画面型GameFeat削除
        NativeBridge::hideAllGameFeat();
        
        CCScene* scene = MainScene::scene();
        CCDirector::sharedDirector()->replaceScene(scene);
    }
}