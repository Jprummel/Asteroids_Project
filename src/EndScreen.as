package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class EndScreen extends Sprite
	{
		//BG
		[Embed(source="../lib/EndScreenBG.jpg")]
		public var endBG			:Class;
		private var endBGImage		:Bitmap;
		//Buttons
		public var backToMenu		:MovieClip;
		//Events
		public static const RETRY	:String = "restartGame";
		//Highscore
		private var _highscore		:ScoreManager;
		
		public function EndScreen() 
		{
			backToMenu = new BackToMenu;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			backToMenu.addEventListener(MouseEvent.MOUSE_DOWN, backToMenuButton);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			endBGImage = new endBG();
			addChild(endBGImage);
			
			backToMenu.x = 400;
			backToMenu.y = 500;
			addChild(backToMenu);
		}
		
		private function backToMenuButton(e:MouseEvent):void 
		{
			trace("Clicked menu");
			dispatchEvent(new Event(RETRY));
		}
		
		public function destroy():void
		{
			backToMenu.removeEventListener(MouseEvent.MOUSE_DOWN, backToMenuButton);
		}
	}
}