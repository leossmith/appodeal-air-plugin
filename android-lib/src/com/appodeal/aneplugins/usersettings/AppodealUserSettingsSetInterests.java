package com.appodeal.aneplugins.usersettings;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealUserSettingsSetInterests implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            String interests = args[0].getAsString();
            Appodeal.getUserSettings(activity).setInterests(interests);
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}