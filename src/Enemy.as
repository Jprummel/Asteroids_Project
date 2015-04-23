package 
{
	import flash.display.Shape;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Enemy extends Unit 
	{
		public var enemy:Shape
		public var enemies:Array = [];
		private var _speed:int;
		
		public function Enemy():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			//Add enemy animation
			enemy = new Shape;
			enemy.graphics.beginFill(0x000000);
			enemy.graphics.drawRect(45, 45, 60,60);
			enemy.graphics.endFill();
			enemy.graphics.beginFill(0xFF0000);
			enemy.graphics.drawRect(50, 50, 50, 50);
			enemy.graphics.endFill();
			enemy.x = 100;
			enemy.y = 100;
			addChild(enemy);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			enemyLiveStart();
			trace(lives + " Enemy");
			
		}
		
		private function enemyMovement():void
		{
			_speed = 10;
			
			enemy.x -= _speed;
			enemy.y += _speed;
		}
	}
	
}