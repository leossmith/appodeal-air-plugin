package com.appodeal.aneplugins.methods;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.utils.AppodealANEUtils;

public class AppodealIsLoaded implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            int AdType = args[0].getAsInt();
            boolean isLoaded = Appodeal.isLoaded(AppodealANEUtils.getAdType(AdType));
            return FREObject.newObject(isLoaded);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}
