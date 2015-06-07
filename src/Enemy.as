package 
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Enemy extends Unit 
	{
		private var _enemy	:MovieClip;
		
		public function Enemy():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			//Add enemy animation
			_enemy = new EnemyModel;
			_enemy.scaleX = 0.25;
			_enemy.scaleY = 0.25;
			addChild(_enemy);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
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