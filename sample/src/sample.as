package
{
	import com.appodeal.aneplugin.Appodeal;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class sample extends Sprite
	{
		private var a:Appodeal = new Appodeal();
		private var textButton2:Sprite = getTextButton('Show!');
		
		public function sample()
		{
			super();
			
			addChild(textButton2);
			
			a.initAppodeal("2a3991d69072ae1719e94292ca03b34e3e59bc5a7b07cb12");
			
			textButton2.addEventListener(MouseEvent.CLICK, function(event:MouseEvent){a.showBanner()});
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
		public function getTextButton(label:String):Sprite{
			var txt:TextField = new TextField();
			txt.defaultTextFormat = new TextFormat('Verdana',22,0x000000);
			txt.text = label;
			txt.background = txt.border = true;
			txt.selectable = false;
			var btn:Sprite = new Sprite();
			btn.mouseChildren = false;
			btn.addChild(txt);
			btn.buttonMode = true;
			return btn;
		}
	}
}