package com.appodeal.aneplugins;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class AppodealContext extends FREContext {

	@Override
	public void dispose() {	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		map.put("initialize", new AppodealInitialize());
		map.put("setBannerCallbacks", new AppodealSetBannerCallbacks());
		map.put("setInterstitialCallbacks", new AppodealSetInterstitialCallbacks());
		map.put("setVideoCallbacks", new AppodealSetVideoCallbacks());
		map.put("setRewardedVideoCallbacks", new AppodealSetRewardedVideoCallbacks());
		map.put("show", new AppodealShow());
		map.put("isLoaded", new AppodealIsLoaded());
		map.put("isPrecache", new AppodealIsPrecache());
		map.put("isLoadedWithPriceFloor", new AppodealIsLoadedWithPriceFloor());
		map.put("cache", new AppodealCache());
		map.put("setAutoCache", new AppodealSetAutoCache());
		map.put("setOnLoadedTriggerBoth", new AppodealSetOnLoadedTriggerBoth());
		map.put("showWithPriceFloor", new AppodealShowWithPriceFloor());
		map.put("disableNetwork", new AppodealDisableNetwork());
		map.put("disableNetworkForAdType", new AppodealDisableForAdType());
		map.put("hide", new AppodealHide());
		map.put("disableLocationPermissionCheck", new AppodealDisableLocationPermissionCheck());
		map.put("setTesting", new AppodealSetTesting());
		map.put("setLogging", new AppodealSetLogging());
		map.put("getVersion", new AppodealGetVersion());
		return map;
	}

}