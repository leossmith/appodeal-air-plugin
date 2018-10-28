package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetCustomIntegerRule implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String name = args[0].getAsString();
            int rule = args[1].getAsInt();
            //Appodeal.setCustomRule(name, rule);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}