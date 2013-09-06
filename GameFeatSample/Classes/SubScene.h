//
//  SubScene.h
//  GameFeatSample
//
//  Created by 中村 慎司 on 2013/09/06.
//
//

#ifndef __GameFeatSample__SubScene__
#define __GameFeatSample__SubScene__

#include "cocos2d.h"

class SubScene : public cocos2d::CCLayer
{
protected:
    void backMain(CCObject* pSender);
    
    enum {
        tag_back = 1
    };
    
public:
    virtual bool init();
    static cocos2d::CCScene* scene();
    CREATE_FUNC(SubScene);
};

#endif /* defined(__GameFeatSample__SubScene__) */
