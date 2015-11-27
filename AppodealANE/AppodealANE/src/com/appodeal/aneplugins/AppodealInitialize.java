package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealInitialize implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		AppodealContext ctx = (AppodealContext)context;
		Activity activity = ctx.getActivity();
		
		try {
			String AppKey = args[0].getAsString();
			int AdType = args[1].getAsInt();
			Appodeal.initialize(activity, AppKey, AdType);
	    } catch (Exception e) {
	    	Log.e("AppodealPlugin", e.toString());
	    }
		return null;
	}


}