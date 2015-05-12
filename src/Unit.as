package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Unit extends Sprite 
	{
		public var lives:int;
		public var maxLives:int;
		public var up: Boolean =  false;
		public var down: Boolean =  false;
		public var right: Boolean =  false;
		public var left: Boolean =  false;
		public var speed:int = 5;
		
		public function Unit():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function playerLiveStart():void
		{
			maxLives = 3
			lives = 3;
			lives = maxLives;
			if (lives > maxLives)
			{
				lives = maxLives;
			}
		}
		
		public function enemyLiveStart():void
		{
			maxLives = 1;
			lives = 1;
			lives = maxLives;
		}
		
		public function death():void
		{
			if (this.lives < 1)
			{
				removeChild(this);
			}
		}
		
		private function update(e:Event):void 
		{
			if (up)
			{
				this.y -= speed;
			}
			
			if (down)
			{
				this.y += speed;
			}
			
			if (left)
			{
				this.x -= speed;
			}
			
			if (right)
			{
				this.x += speed;
			}
		
			
		}
	}
	
}