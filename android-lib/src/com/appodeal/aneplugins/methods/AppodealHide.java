package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.AppodealContext;
import com.appodeal.aneplugins.utils.AppodealANEUtils;

public class AppodealHide implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            int AdType = args[0].getAsInt();
            Appodeal.hide(activity, AppodealANEUtils.getAdType(AdType));
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}
