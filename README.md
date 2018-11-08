# Appodeal AIR Native Extension

[![](https://img.shields.io/badge/latest-android-green.svg)](https://s3-eu-west-1.amazonaws.com/appodeal-adobe-air/Appodeal-ANE-3.0.7-200418-android.zip)
[![](https://img.shields.io/badge/latest-ios-grey.svg)](https://s3-eu-west-1.amazonaws.com/appodeal-adobe-air/Appodeal-ANE-3.0.7-200418-all.zip)

## Notive

+ This is a work in progress to update to the latest Appodeal SDK. 

## How to Build

### Plugin Build Requirements:

+ Adobe AIR SDK
+ Apache Ant
+ Flex SDK + AIR SDK
+ IntelliJ Idea
+ Android SDK
+ iOS SDK and XCode

### How to build plugin:

+ Clone this repostory. 
+ Open project with IntelliJ Idea.
+ Right click on actionscript-lib in project three and choose Build module 'actionscript-lib' to build main as3 library.
+ Right click on actionscript-def in project three and choose Build module 'actionscript-def' to build dummy as3 library.
+ Go to build→AIR Native Extension Build Scripts and run clean, then prepare, then package for packing Cross-platform extension or package_anrd for Android only extension.

### Updating android part:

+ Download and unzip newest Appodeal Android SDK here.
+ Place Appodeal jar into libs folder inside android-lib folder.
+ Update java code in android-lib module if needed.
+ Build android artifact if something was changed in android-lib with Build→Build Artifacts...->AppodealANE:jar
+ Place new appodeal-x.jar and all other appodeal depending libs into android/dependency folder.
+ Update /build/platformoptions-and.xml if android libraries were updated.
+ Android ready for ane packaging.

### Updating iOS Part:

+ Download and unzip newest Appodeal iOS SDK here.
+ Place new fat iOS Appodeal SDK into ios/sdk folder.
+ Update obj-c code in XCode project by opening Appodeal.xcodeproj inside ios folder.
+ Choose Appodeal.ANE as target and Generic iOS Device as device target top build static library for iOS part if code was changed.
+ Update /build/platformoptions-ios.xml if new frameworks or libraries was added/removed (change name inside dependency tag).
+ iOS ready for ane packaging.

## ANE Integration

### App key

Obtain key for your application here: https://www.appodeal.com/apps/

### Link your Admob account

Appodeal yields optimal results in cooperation with Admob. To continue, you need to link your Admob account.
If you don't have Admob account, please sign up on Admob.com.
To link your Admob account to Appodeal, use the Chrome extension: 

[![](https://img.shields.io/badge/install-extension-red.svg)](https://chrome.google.com/webstore/detail/appodeal/cnlfcihkilpkgdlnhjonhkfjjmbpbpbj)

The extension source code is available at https://github.com/appodeal/admob-configurator.

The extension will make two changes in your Admob account. First, it will allow Appodeal to access your Admob reports over API, and second, it will create new ad units on Admob and submit them to Appodeal.

### Project Configuration

Add following extensions to your descriptor file:

```xml
<extensionID>com.appodeal.aneplugin</extensionID>
```

### Plugin Files Integration

Include this library from folder ane/:

+ Appodeal.ane

Also include files from assets folder to app build path, it should be included without "assets" folder as AIR already includes this files to assets folder in apk file.

Flash CC/Flash Pro: go to `build settings -> general ->` press `"+"` near `"Included Files"` window and add files.

IntelliJ Idea: go to app `settings -> android` and add files to `"Files and folder to package"` window.

Flash Builder: copy files to bin-debug for debug builds and to bin-release folder for release build. Check if this files are checked in Package Contents.

### iOS Integration

To avoid a major drop in revenue publishers should turn off App Transport Security until further notice.

To ensure monetization with some adnetworks in Appodeal is not impacted, publishers should add the following to their app.xml file to allow any insecure connection:

```xml
<iPhone>
    <InfoAdditions><![CDATA[
        <key>NSAppTransportSecurity</key>
        <dict>
            <key>NSAllowsArbitraryLoads</key>
            <true/>
        </dict>
    ]]></InfoAdditions>
</iPhone>
```

Add this keys ias well, if you use this function in your app:

```
<iPhone>
    <InfoAdditions><![CDATA[
        <key>NSBluetoothPeripheralUsageDescription</key>
           <string>Advertising</string>
        <key>NSCalendarsUsageDescription</key>
           <string>Advertising</string>
        <key>NSLocationWhenInUseUsageDescription</key>
           <string>Advertising</string>
        <key>NSPhotoLibraryUsageDescription</key>
           <string>Advertising</string>
    ]]></InfoAdditions>
</iPhone>
```

If you are getting build error like this:

```
ld: in /var/folders/41/c10lb6_n6dq3_6tld7vbcg5r0000gn/T/5e99c7f3-9ad4-43ba-a33c-7667fbae07c5/libcom.vungle.extensions.Vungle.a(VungleNetworkOperation.o), archive member 'VungleNetworkOperation.o' with length 75024 is not mach-o or llvm bitcode for architecture arm64
ld: in /var/folders/41/c10lb6_n6dq3_6tld7vbcg5r0000gn/T/5e99c7f3-9ad4-43ba-a33c-7667fbae07c5/libcom.vungle.extensions.Vungle.a(VungleNetworkOperation.o), archive member 'VungleNetworkOperation.o' with length 73152 is not mach-o or llvm bitcode for architecture armv7
Compilation failed while executing : ld64
```

you can fix it by installing XCode and replacing $FLEX_HOME/lib/aot/bin/ld64/ld64 with a symlink /usr/bin/ld or /Applications/Xcode.app/Contents/Developer/usr/bin/ld

```
cd "$FLEX_HOME/lib/aot/bin/ld64"
mv ld64 ld64.orig
ln -s /usr/bin/ld ld64
```

### Android Integration

Add following permissions inside the manifest tag:

```xml
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" /> <!--optional -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" /> <!--optional -->
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" /> <!--optional-->
```

Add contents of [this](AndroidManifestAdditions.xml) sample to manifestAdditions inside application android tag:

### API References

#### Ad Types

+ Appodeal.INTERSTITIAL
+ Appodeal.BANNER
+ Appodeal.REWARDED_VIDEO
+ Appodeal.NON_SKIPPABLE_VIDEO

Ad types can be combined using "|" operator. For example Appodeal.INTERSTITIAL | Appodeal.REWARDED_VIDEO

#### SDK Initialization

Import the Appodeal classes

```as3
import com.appodeal.aneplugin.*;
```

We recommend making a variable in your class to store a reference to the global Appodeal instance:

```as3
private var appodeal:Appodeal = new Appodeal();
```

To initialize SDK, call the code like this:

```as3
var appKey:String = "e7e04e54ae0a8d28cff2f7e7e7d094e78b2a09743be2cc4a";
appodeal.initialize(appKey, adType);
```

#### Display Ad

To display ad for choosen ad type you need to call this code:

```as3
appodeal.show(adType);
```

#### Check if ad is ready

Following method will return boolean value with ad ready status:

```as3
appodeal.isLoaded(adType);
```

#### Hide Ad

Following method will hide ad presented on screen, applicable to BANNER only:

```as3
appodeal.hide(adType);
```

#### Advanced Features

Enabling test mode:

```as3
appodeal.setTesting(true);
```

Checking if loaded ad is precache:

```as3
appodeal.isPrecache(adType);
```

Manual ad caching:

```as3
appodeal.cache(adType);
```

You should disable automatic caching before SDK initialization using:

```as3
appodeal.setAutoCache(adType, false)
```

Triggering onLoaded callback twice:

```as3
appodeal.setTriggerOnLoadedOnPrecache(adType, true);
```

Disabling networks:

```as3
appodeal.disableNetwork(network);
```

Available parameters: "adcolony", "admob", "amazon_ads", "applovin", "appnext", "avocarrot", "chartboost", "facebook", "flurry", "inmobi", "inner-active", "ironsource", "mailru", "mmedia", "mopub", "mobvista", "ogury", "openx", "pubnative", "smaato", "startapp", "tapjoy", "unity_ads", "vungle", "yandex".

To disable toast messages ACCESS_COARSE_LOCATION permission is missing, use the following method:

```as3
appodeal.disableLocationPermissionCheck();
```

Tracking in-app purchase:

```as3
appodeal.trackInAppPurchase(amount, currencyCode);
```

#### Setting User Data

To obtain reference to the user settings set variable:

```as3
var userSettings:UserSettings = new UserSettings();
```

Set the age of the user:

```as3
userSettings.setAge(30);
```

Specify gender of the user (Possible values: Gender.FEMALE, Gender.MALE, Gender.OTHER):

```as3
userSettings.setGender(Gender.FEMALE);
```

## Changelog

3.1.0 (08/11/2018)

+ Appodeal Android SDK Updated to 2.4.8 Beta

3.0.7 (20/04/2018)

+ Appodeal Android SDK updated to 2.1.11
+ iOS SDK updated to 2.1.10
