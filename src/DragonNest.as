package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class DragonNest extends Sprite 
	{
		private var dragonNest:Shape;
		
		public function DragonNest():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			dragonNest = new Shape;
			dragonNest.graphics.beginFill(0x000000);
			dragonNest.graphics.drawRect(45, 45, 60,60);
			dragonNest.graphics.endFill()
			dragonNest.x = stage.stageWidth / 2;
			dragonNest.y = stage.stageHeight / 2;
			addChild(dragonNest);
		}
	}
	
}