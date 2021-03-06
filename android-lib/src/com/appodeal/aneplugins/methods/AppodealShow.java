package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.utils.AppodealANEUtils;

public class AppodealShow implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            Activity activity = context.getActivity();
            int AdType = args[0].getAsInt();
            boolean ready = Appodeal.show(activity, AppodealANEUtils.getAdType(AdType));
            return FREObject.newObject(ready);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}
