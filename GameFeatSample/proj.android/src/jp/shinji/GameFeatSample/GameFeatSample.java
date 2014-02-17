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

import android.os.Bundle;
import android.util.Log;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;


public class GameFeatSample extends Cocos2dxActivity{
	
	private static LinearLayout container;
	private static GameFeatSample me = null;
	static GameFeatAppController gfAppController;
	
	/////////////////////////////////
	// GAMEFEAT ICON
	/////////////////////////////////
	GFIcons gfIcons = null;
	
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		me = this;
		container = new LinearLayout(me);
		me.addContentView(container, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT));
		
		gfAppController = new GameFeatAppController();
	}
	
    static {
         System.loadLibrary("game");
    }
    
    @Override
    public void onStart() {
    	super.onStart();
    	// 広告設定初期化
    	gfAppController.activateGF(me, true, true, true);
    }
    
    //================================================================================
  	// GAMEFEAT オファーウォール表示・非表示
  	//================================================================================
    public static void showGameFeatJNI()
    {
        gfAppController.show(me);
    }
    
    //================================================================================
  	// GAMEFEAT 全画面表示・非表示
  	//================================================================================
    public static void showAllGameFeatJNI()
    {
		me.runOnUiThread(new Runnable(){
			@Override
			public void run() {
				gfAppController.showPopupAdDialog(me);
			}
		});
    }
    
    public static void hideAllGameFeatJNI()
    {
    }
        
    //================================================================================
  	// GAMEFEAT アイコン表示・非表示
  	//================================================================================
	public static void showIconGameFeatJNI() {
		Log.d("GFTEST", "SHOW_GAMEFEAT_ICONS...............................");
		if (me.gfIcons != null) {
			me.runOnUiThread(new Runnable(){
				@Override
				public void run() {
					me.gfIcons.setVisibility(View.VISIBLE);
	    			me.gfIcons.resume();
				}
			});
		}
		else {
			Log.d("GFTEST", "SHOW_GAMEFEAT_ICONS_INIT...............................");
			me.runOnUiThread(new Runnable(){
				@Override
	    		public void run()
	    		{			
	    			me.gfIcons = new GFIcons(me.getApplicationContext());
	    			container.setGravity(Gravity.BOTTOM);
	    			container.addView(me.gfIcons);
	    			me.gfIcons.resume();
	    		}
			});
		}

		
	}
	
	public static void hideIconGameFeatJNI() {
		Log.d("GFTEST", "HIDE_GAMEFEAT_ICONS...............................");
		if (me.gfIcons != null) {
			me.runOnUiThread(new Runnable() {
				@Override
				public void run() {
					me.gfIcons.stop();
					me.gfIcons.setVisibility(View.INVISIBLE);
				}			
			});
		}
	}
    
    public void onStop() {
        super.onStop();
    }
}
