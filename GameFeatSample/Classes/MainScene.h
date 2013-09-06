//
//  MainScene.h
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/04.
//
//

#ifndef __GameFeatSample__MainScene__
#define __GameFeatSample__MainScene__

#include "cocos2d.h"

class MainScene : public cocos2d::CCLayer
{
protected:
    void openGameFeat(CCObject* pSender);
    
    enum {
        tag_gamefeat = 1,
        tag_next
    };
    
public:
    virtual bool init();
    static cocos2d::CCScene* scene();
    CREATE_FUNC(MainScene);
};

#endif /* defined(__GameFeatSample__MainScene__) */
