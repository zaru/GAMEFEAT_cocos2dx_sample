/****************************************************************************
Copyright (c) 2010-2012 cocos2d-x.org

http://www.cocos2d-x.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
package jp.shinji.GameFeatSample;


import org.cocos2dx.lib.Cocos2dxActivity;
import jp.basicinc.gamefeat.android.sdk.controller.GameFeatAppController;
import jp.basicinc.gamefeat.android.sdk.view.GameFeatIconView;

import android.os.Bundle;

public class GameFeatSample extends Cocos2dxActivity{
	private static GameFeatSample me = null;
	//private static GameFeatIconAdLoader myIconAdLoader;

	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		me = this;
	}
	
    static {
         System.loadLibrary("game");
    }
    
    public static String getAppVersionInJava()
    {
    	return "Android Device!!";
    }
    
    public static void showGameFeatJNI()
    {
        GameFeatAppController.show(me);
    	//System.out.println("Android Device!!");
    }
    
    public static void showAllGameFeatJNI()
    {
    	GameFeatAppController.setPopupProbability(1);
      	GameFeatAppController.showPopupAd(me);
    	//System.out.println("Android Device!!");
    }
    
    public static void showIconGameFeatJNI()
    {
    	//myIconAdLoader = new GameFeatIconAdLoader();
    	//myIconAdLoader.setRefreshInterval(10);
    	//myIconAdLoader.setIconTextColor(Color.rgb(255, 240, 240));
    	//((GameFeatIconView)findViewById(R.id.gf_icon1)).addLoader(myIconAdLoader);
    	System.out.println("show IconGameFeat!!");
    }
}
