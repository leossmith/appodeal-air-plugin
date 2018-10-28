package com.appodeal.aneplugins.callbacks;

import com.appodeal.ads.InterstitialCallbacks;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealInterstitialListener implements InterstitialCallbacks {

    protected AppodealContext _ctx = null;

    public AppodealInterstitialListener(AppodealContext ctx) {
        _ctx = ctx;
    }

    @Override
    public void onInterstitialClicked() {
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_CLICKED", "");
    }

    @Override
    public void onInterstitialClosed() {
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_CLOSED", "");
    }

    @Override
    public void onInterstitialFailedToLoad() {
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_FAILED_TO_LOAD", "");
    }

    @Override
    public void onInterstitialExpired() {
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_EXPIRED", "");
    }

    @Override
    public void onInterstitialLoaded(boolean isPrecache) {
        String level = "<info precache='" + isPrecache + "' ></info>";
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_LOADED", level);
    }

    @Override
    public void onInterstitialShown() {
        _ctx.dispatchStatusEventAsync("INTERSTITIAL_SHOWN", "");
    }

}
