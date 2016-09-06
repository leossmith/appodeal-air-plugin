package {
import com.appodeal.aneplugin.AdEvent;
import com.appodeal.aneplugin.AdType;
import com.appodeal.aneplugin.Appodeal;

    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    public class Main extends Sprite {

        private var label:String = "Initialize";
        private var label1:String = "Interstitial";
        private var label2:String = "Video";
        private var label3:String = "Rewarded Video";
        private var labelInit:TextField = new TextField();
        private var labelVideo:TextField = new TextField();
        private var labelRewardedVideo:TextField = new TextField();
        private var labelInterstitial:TextField = new TextField();
        private var labelHide:TextField = new TextField();


        private var appodeal:Appodeal;
        private var bannedShown:Boolean;
        private var videoShown:Boolean = true;

        public function Main() {

            this.stage.scaleMode = StageScaleMode.EXACT_FIT;
            this.stage.align = StageAlign.TOP;

            appodeal = new Appodeal();

            appodeal.log("MYNEWAPP", appodeal.getVersion());
            appodeal.toast("Initialized");

            trace(appodeal.getIDFA());

            labelInit.defaultTextFormat = new TextFormat('Verdana', 12, 0x000000);
            labelInit.text = label;
            labelInit.width = 400;
            labelInit.height = 80;
            labelInit.background = labelInit.border = true;
            labelInit.selectable = false;
            var initButton:Sprite = new Sprite();
            initButton.mouseChildren = false;
            initButton.addChild(labelInit);
            initButton.buttonMode = true;
            initButton.x = 50;
            initButton.y = 10;
            addChild(initButton);


            labelInterstitial.defaultTextFormat = new TextFormat('Verdana', 12, 0x000000);
            labelInterstitial.text = label1;
            labelInterstitial.width = 400;
            labelInterstitial.height = 80;
            labelInterstitial.background = labelInterstitial.border = true;
            labelInterstitial.selectable = false;
            var InterstitialButton:Sprite = new Sprite();
            InterstitialButton.mouseChildren = false;
            InterstitialButton.addChild(labelInterstitial);
            InterstitialButton.buttonMode = true;
            InterstitialButton.x = 50;
            InterstitialButton.y = 70;
            addChild(InterstitialButton);


            labelVideo.defaultTextFormat = new TextFormat('Verdana', 12, 0x000000);
            labelVideo.text = label2;
            labelVideo.width = 400;
            labelVideo.height = 80;
            labelVideo.background = labelVideo.border = true;
            labelVideo.selectable = false;
            var VideoButton:Sprite = new Sprite();
            VideoButton.mouseChildren = false;
            VideoButton.addChild(labelVideo);
            VideoButton.buttonMode = true;
            VideoButton.x = 50;
            VideoButton.y = 120;
            addChild(VideoButton);

            labelHide.defaultTextFormat = new TextFormat('Verdana', 12, 0x000000);
            labelHide.text = "Banner";
            labelHide.width = 400;
            labelHide.height = 80;
            labelHide.background = labelHide.border = true;
            labelHide.selectable = false;
            var HideButton:Sprite = new Sprite();
            HideButton.mouseChildren = false;
            HideButton.addChild(labelHide);
            HideButton.buttonMode = true;
            HideButton.x = 50;
            HideButton.y = 170;
            addChild(HideButton);

            labelRewardedVideo.defaultTextFormat = new TextFormat('Verdana', 12, 0x000000);
            labelRewardedVideo.text = label3;
            labelRewardedVideo.width = 400;
            labelRewardedVideo.height = 80;
            labelRewardedVideo.background = labelRewardedVideo.border = true;
            labelRewardedVideo.selectable = false;
            var RewardedVideoButton:Sprite = new Sprite();
            RewardedVideoButton.mouseChildren = false;
            RewardedVideoButton.addChild(labelRewardedVideo);
            RewardedVideoButton.buttonMode = true;
            RewardedVideoButton.x = 50;
            RewardedVideoButton.y = 220;
            addChild(RewardedVideoButton);

            initButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                init();
            });

            InterstitialButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.INTERSTITIAL)) {
                    appodeal.show(Appodeal.INTERSTITIAL);
                }
            });

            VideoButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO)) {
                    appodeal.show(Appodeal.SKIPPABLE_VIDEO);
                }
            });

            RewardedVideoButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.REWARDED_VIDEO)) {
                    appodeal.show(Appodeal.REWARDED_VIDEO);
                }
            });

            HideButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                appodeal.show(Appodeal.BANNER_BOTTOM);
            });

        }

        private function init():void
        {
            appodeal = new Appodeal();

            var appKey:String = "fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f";
            //var appKey:String = "722fb56678445f72fe2ec58b2fa436688b920835405d3ca6";

            labelInit.text = "Initialized v." + appodeal.getVersion();

            appodeal.initialize(appKey, Appodeal.INTERSTITIAL | Appodeal.REWARDED_VIDEO | Appodeal.SKIPPABLE_VIDEO | Appodeal.BANNER);

            appodeal.disableLocationPermissionCheck();

            appodeal.addEventListener(AdEvent.INTERSTITIAL_LOADED, onInterstitial);
            appodeal.addEventListener(AdEvent.INTERSTITIAL_FAILED_TO_LOAD, onInterstitial);
            appodeal.addEventListener(AdEvent.INTERSTITIAL_SHOWN, onInterstitial);
            appodeal.addEventListener(AdEvent.INTERSTITIAL_CLICKED, onInterstitial);
            appodeal.addEventListener(AdEvent.INTERSTITIAL_CLOSED, onInterstitial);
            appodeal.addEventListener(AdEvent.REWARDED_VIDEO_LOADED, onRewardedVideo);
            appodeal.addEventListener(AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD, onRewardedVideo);
            appodeal.addEventListener(AdEvent.REWARDED_VIDEO_SHOWN, onRewardedVideo);
            appodeal.addEventListener(AdEvent.REWARDED_VIDEO_FINISHED, onRewardedVideo);
            appodeal.addEventListener(AdEvent.REWARDED_VIDEO_CLOSED, onRewardedVideo);
            appodeal.addEventListener(AdEvent.SKIPPABLE_VIDEO_LOADED, onSkippableVideo);
            appodeal.addEventListener(AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD, onSkippableVideo);
            appodeal.addEventListener(AdEvent.SKIPPABLE_VIDEO_SHOWN, onSkippableVideo);
            appodeal.addEventListener(AdEvent.SKIPPABLE_VIDEO_CLOSED, onSkippableVideo);
            appodeal.addEventListener(AdEvent.SKIPPABLE_VIDEO_FINISHED, onSkippableVideo);
            appodeal.addEventListener(AdEvent.BANNER_LOADED, onBanner);
            appodeal.addEventListener(AdEvent.BANNER_FAILED_TO_LOAD, onBanner);
            appodeal.addEventListener(AdEvent.BANNER_SHOWN, onBanner);
            appodeal.addEventListener(AdEvent.BANNER_CLICKED, onBanner);
        }


        private function onNonSkippableVideo(event:AdEvent):void
        {
            switch (event.type) {
                case AdEvent.NON_SKIPPABLE_VIDEO_LOADED:
                    trace('onNonSkippableVideo: ad loaded');
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD:
                    trace('onNonSkippableVideo: failed to load ad');
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_SHOWN:
                    trace('onNonSkippableVideo: ad shown');
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_FINISHED:
                    trace('onNonSkippableVideo: ad clicked, your reward:', event.amount, event.name);
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_CLOSED:
                    trace('onNonSkippableVideo: ad closed');
                    break;
            }
        }
        private function onSkippableVideo(event:AdEvent):void
        {
            switch (event.type) {
                case AdEvent.SKIPPABLE_VIDEO_LOADED:
                    trace('onSkippableVideo: ad loaded');
                    break;
                case AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD:
                    trace('onSkippableVideo: failed to load ad');
                    break;
                case AdEvent.SKIPPABLE_VIDEO_SHOWN:
                    trace('onSkippableVideo: ad shown');
                    break;
                case AdEvent.SKIPPABLE_VIDEO_FINISHED:
                    trace('onSkippableVideo: ad clicked, your reward:', event.amount, event.name);
                    break;
                case AdEvent.SKIPPABLE_VIDEO_CLOSED:
                    trace('onSkippableVideo: ad closed');
                    break;
            }
        }
        private function onBanner(event:AdEvent):void
        {
            switch (event.type) {
                case AdEvent.BANNER_LOADED:
                    trace('onBanner:ad loaded');
                    break;
                case AdEvent.BANNER_FAILED_TO_LOAD:
                    trace('onBanner: failed to load ad');
                    break;
                case AdEvent.BANNER_SHOWN:
                    trace('onBanner: ad shown');
                    break;
                case AdEvent.BANNER_CLICKED:
                    trace('onBanner: ad clicked');
                    break;
            }
        }
        private function onRewardedVideo(event:AdEvent):void
        {
            switch (event.type) {
                case AdEvent.REWARDED_VIDEO_LOADED:
                    trace('onRewardedVideo: ad loaded');
                    break;
                case AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD:
                    trace('onRewardedVideo: failed to load ad');
                    break;
                case AdEvent.REWARDED_VIDEO_SHOWN:
                    trace('onRewardedVideo: ad shown');
                    break;
                case AdEvent.REWARDED_VIDEO_FINISHED:
                    videoShown = false;
                    trace('onRewardedVideo: ad clicked, your reward:', event.amount, event.name);
                    break;
                case AdEvent.REWARDED_VIDEO_CLOSED:
                    trace('onRewardedVideo: ad closed');
                    break;
            }
        }
        private function onInterstitial(event:AdEvent):void
        {
            switch (event.type) {
                case AdEvent.INTERSTITIAL_LOADED:
                    trace('onInterstitial: ad loaded');
                    break;
                case AdEvent.INTERSTITIAL_FAILED_TO_LOAD:
                    trace('onInterstitial: failed to load ad');
                    break;
                case AdEvent.INTERSTITIAL_SHOWN:
                    trace('onInterstitial: ad shown');
                    break;
                case AdEvent.INTERSTITIAL_CLICKED:
                    trace('onInterstitial: ad has clicked');
                    break;
                case AdEvent.INTERSTITIAL_CLOSED:
                    trace('onInterstitial: ad closed');
                    break;
            }
        }
        public function showInterstitial():void
        {
            appodeal.show(AdType.INTERSTITIAL);
        }
        public function showRewarded():void
        {
            if (appodeal.isLoaded(AdType.REWARDED_VIDEO))
            {
                appodeal.show(AdType.REWARDED_VIDEO);
            }
        }
        public function showBanner(show:Boolean = true):void
        {
            show ? appodeal.show(AdType.BANNER_BOTTOM) : appodeal.hide(AdType.BANNER_BOTTOM);
        }

    }
}