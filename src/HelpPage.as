package  
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class HelpPage extends Sprite
	{
		[Embed(source="../lib/Help.jpg")]
		public var helpBG			:Class;
		private var helpBGImage		:Bitmap;
		
		public var returnToMenu		:MovieClip;
		
		public static const RETURN	:String = "backToMenuFromHelp";
		
		public function HelpPage() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			helpBGImage = new helpBG();
			addChild(helpBGImage);
			
			returnToMenu = new Return();
			returnToMenu.x = stage.stageWidth -575;
			returnToMenu.y = stage.stageHeight - 30;
			addChild(returnToMenu);
			returnToMenu.addEventListener(MouseEvent.MOUSE_DOWN, returnToMenuButton);
			
		}
		
		private function returnToMenuButton(e:MouseEvent):void 
		{
			dispatchEvent(new Event(RETURN));
		}
		
		public function destroy():void
		{
			returnToMenu.removeEventListener(MouseEvent.MOUSE_DOWN, returnToMenuButton);
		}
	}

}