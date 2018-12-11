package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.AppodealContext;
import com.appodeal.aneplugins.utils.AdvertisingIDTask;
import com.appodeal.aneplugins.utils.AppodealANEUtils;

public class AppodealInitialize implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            String AppKey = args[0].getAsString();
            int AdType = args[1].getAsInt();
            Appodeal.setFramework("air", "3.0.0");
            Appodeal.initialize(activity, AppKey, AppodealANEUtils.getAdType(AdType), true);

            new AdvertisingIDTask(activity);
        } catch (Exception e) {
            Log.e("AppodealPlugin", e.toString());
        }
        return null;
    }


}