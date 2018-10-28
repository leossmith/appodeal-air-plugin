package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetCustomDoubleRule implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String name = args[0].getAsString();
            double rule = args[1].getAsDouble();
            //Appodeal.setcussetCustomRule(name, rule);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}