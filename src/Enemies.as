package 
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Enemies extends Unit 
	{
		//private var _enemy1	:Shape;
		private var _enemy1	:Shape;
		private var _enemy2	:Shape;
		private var enemies	:Array = [];
		private var _speed	:int = 10;
		
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
			addChild(_enemy1);
			
			trace(_enemy1.x + "X " + _enemy1.y + "Y " + "Enemy Pos");
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			enemyLiveStart();
			trace(enemyLives + " Enemy");
			
		}
		
		public function EnemyFollow(target:DragonNest):void
		{	
			if (this.x >= target.x)
			{
				this.x -= 1;
			}
			else if (this.x <= target.x)
			{
				this.x += 1;
			}

			if (this.y <= target.y)
			{
				this.y += 1;
			}
			else if (this.y >= target.y)
			{
				this.y -= 1;
			}
		}
	}
}