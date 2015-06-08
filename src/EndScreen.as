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
		public var tryAgain			:MovieClip;
		public var backToMenu		:MovieClip;
		//Events
		public static const RETURN	:String = "backToMenuFromEnd";
		public static const RETRY	:String = "restartGame";
		
		public function EndScreen() 
		{
			tryAgain = new TryAgain;
			backToMenu = new BackToMenu;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			tryAgain.addEventListener(MouseEvent.MOUSE_DOWN, tryAgainButton);
			backToMenu.addEventListener(MouseEvent.MOUSE_DOWN, backToMenuButton);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			endBGImage = new endBG();
			addChild(endBGImage);
			
			tryAgain.x = 400;
			tryAgain.y = 400;
			addChild(tryAgain);
			
			backToMenu.x = 400;
			backToMenu.y = 500;
			addChild(backToMenu);			
		}
		
		private function backToMenuButton(e:MouseEvent):void 
		{
			trace("Clicked menu");
			dispatchEvent(new Event(RETURN));
		}
		
		private function tryAgainButton(e:MouseEvent):void 
		{
			trace("Clicked retry");
			dispatchEvent(new Event(RETRY));
		}
		
		public function destroy():void
		{
			tryAgain.removeEventListener(MouseEvent.MOUSE_DOWN, tryAgainButton);
			backToMenu.removeEventListener(MouseEvent.MOUSE_DOWN, backToMenuButton);
		}
	}
}