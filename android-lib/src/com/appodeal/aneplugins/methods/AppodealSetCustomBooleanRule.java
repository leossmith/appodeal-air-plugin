package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetCustomBooleanRule implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String name = args[0].getAsString();
            boolean rule = args[1].getAsBool();
            //Appodeal.setCustomRule(name, rule);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}
