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
		private var dragonNest	:Nest;
		
		public function DragonNest():void
		{
			dragonNest = new Nest();
			addChild(dragonNest);
		}
	}
}