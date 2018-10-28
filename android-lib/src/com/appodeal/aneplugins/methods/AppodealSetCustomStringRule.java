package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetCustomStringRule implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String name = args[0].getAsString();
            String rule = args[1].getAsString();
            //Appodeal.setCustomRule(name, rule);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}