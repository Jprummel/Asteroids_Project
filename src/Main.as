package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Main extends Sprite 
	{
		private var player:Player;
		
		public function Main():void 
		{
			stage.addEventListener(Event.ENTER_FRAME, update);
			player = new Player;
			addChild(player);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function update(e:Event):void 
		{
			player.playerControll;
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}