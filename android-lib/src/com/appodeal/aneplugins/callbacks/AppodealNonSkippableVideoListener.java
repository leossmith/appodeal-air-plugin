package com.appodeal.aneplugins.callbacks;

import com.appodeal.ads.NonSkippableVideoCallbacks;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealNonSkippableVideoListener implements NonSkippableVideoCallbacks {

    protected AppodealContext _ctx = null;

    public AppodealNonSkippableVideoListener(AppodealContext ctx) {
        _ctx = ctx;
    }

    @Override
    public void onNonSkippableVideoShown() {
        _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_SHOWN", "");
    }

    @Override
    public void onNonSkippableVideoExpired() { _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_EXPIRED", ""); }

    @Override
    public void onNonSkippableVideoLoaded(boolean finished) {
        _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_LOADED", "");
    }

    @Override
    public void onNonSkippableVideoFinished() {
        _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_FINISHED", "");
    }

    @Override
    public void onNonSkippableVideoFailedToLoad() {
        _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
    }

    @Override
    public void onNonSkippableVideoClosed(boolean finished) {
        String level = "<info finished='" + finished + "' ></info>";
        _ctx.dispatchStatusEventAsync("NON_SKIPPABLE_VIDEO_CLOSED", level);
    }

}
