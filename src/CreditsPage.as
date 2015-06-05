package  
{
	import flash.display.*;
	import flash.events.*;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class CreditsPage extends Sprite
	{
		[Embed(source="../lib/CreditsBG.jpg")]
		public var creditsBG		:Class;
		private var creditsBGImage	:Bitmap;
		
		public var returnToMenu		:MovieClip;
		
		public static const RETURN	:String = "backToMenuFromCredits";
		
		public function CreditsPage() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		
			
			creditsBGImage = new creditsBG();
			addChild(creditsBGImage);
			
			returnToMenu = new Credits();
			returnToMenu.x = stage.stageWidth - 575;
			returnToMenu.y = stage.stageHeight - 30;
			addChild(returnToMenu);
			
			returnToMenu.addEventListener(MouseEvent.MOUSE_DOWN, returnToMenuButton);
		}
		
		private function returnToMenuButton(e:MouseEvent):void 
		{
			trace("clicked back");
			dispatchEvent(new Event(RETURN));
		}
		
		public function destroy():void
		{
			returnToMenu.removeEventListener(MouseEvent.MOUSE_DOWN, returnToMenuButton);
		}
	}

}