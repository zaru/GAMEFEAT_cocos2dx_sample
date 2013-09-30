package jp.shinji.GameFeatSample;

import jp.basicinc.gamefeat.android.sdk.controller.GameFeatIconAdLoader;
import jp.basicinc.gamefeat.android.sdk.view.GameFeatIconView;
import android.content.Context;
import android.graphics.Color;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import android.widget.LinearLayout;

public class GFIcons extends LinearLayout {
	private Context mContext;
	
	GameFeatIconAdLoader myIconAdLoader;
	private GameFeatIconView icon1;
	private GameFeatIconView icon2;
	private GameFeatIconView icon3;
	private GameFeatIconView icon4;
	private GameFeatIconView icon5;

	public GFIcons(Context context) {
		super(context);
		// TODO 自動生成されたコンストラクター・スタブ
		mContext = context;
		init();
	}
	
	protected void init() {
		// this.setBackgroundColor(Color.WHITE);
	 
		WindowManager wm = (WindowManager)mContext.getSystemService(Context.WINDOW_SERVICE);
		Display display = wm.getDefaultDisplay();
		
		int width = display.getWidth();
		int height = display.getHeight();
		
		int size_base = width;
		if (width > height) {
			size_base = height;
		}
		Log.d("GFICONS", width + "/" + height + ":::" + size_base);
		int per = size_base / 6;

		
	 	myIconAdLoader = new GameFeatIconAdLoader();
	 	myIconAdLoader.setIconTextColor(Color.WHITE);
		
		
	    // LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
	    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, per + 2 * (per / 7	));
		this.setLayoutParams(params);
		this.setOrientation(HORIZONTAL);
		
		LinearLayout.LayoutParams icon_param = new LinearLayout.LayoutParams(per, per);
		icon_param.leftMargin = per / 10;
		icon_param.rightMargin = per / 10;
		
		icon1 = new GameFeatIconView(mContext);
		icon1.setLayoutParams(icon_param);
		icon1.addLoader(myIconAdLoader);
		this.addView(icon1);
		
		icon2 = new GameFeatIconView(mContext);
		icon2.setLayoutParams(icon_param);
		icon2.addLoader(myIconAdLoader);
		this.addView(icon2);
		
		icon3 = new GameFeatIconView(mContext);
		icon3.setLayoutParams(icon_param);
		icon3.addLoader(myIconAdLoader);
		this.addView(icon3);

		icon4 = new GameFeatIconView(mContext);
		icon4.setLayoutParams(icon_param);
		icon4.addLoader(myIconAdLoader);
		this.addView(icon4);
		
		icon5 = new GameFeatIconView(mContext);
		icon5.setLayoutParams(icon_param);
		icon5.addLoader(myIconAdLoader);
		this.addView(icon5);

	}
	
	public void resume() {
		myIconAdLoader.loadAd(mContext);
	}
	
	public void stop() {
		myIconAdLoader.stopAd();
	}

}
