package 
{
	import flash.display.Shape;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Enemies extends Unit 
	{
		private var _enemy1:Shape;
		private var _enemy2:Shape;
		private var enemies:Array = [];
		private var _speed:int;
		
		public function Enemies():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			//Add enemy animation
			_enemy1 = new Shape;
			_enemy1.graphics.beginFill(0x000000);
			_enemy1.graphics.drawRect(45, 45, 60,60);
			_enemy1.graphics.endFill();
			_enemy1.graphics.beginFill(0xFF0000);
			_enemy1.graphics.drawRect(50, 50, 50, 50);
			_enemy1.graphics.endFill();
			_enemy1.x = 100;
			_enemy1.y = 100;
			addChild(_enemy1);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			enemyLiveStart();
			trace(enemyLives + " Enemy");
			
		}
		
		private function enemyMovement():void
		{
			_speed = 10;
			
			_enemy1.x -= _speed;
			_enemy1.y += _speed;
		}
	}
	
}