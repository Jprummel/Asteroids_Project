package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Unit extends Sprite 
	{
		public var lives:int;
		public var maxLives:int;
		public var movementEnabled:Boolean;
		
		public function Unit():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, playerMovement);
			
			movementEnabled = false;
			
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
		
		public function playerMovement(e:KeyboardEvent):void
		{
			if (movementEnabled == true)
			{
				if (e.keyCode == 87)
				{
					this.y -= 10;
				}
			
				if (e.keyCode == 65)
				{
					this.x -= 10 ;
				}
			
				if (e.keyCode == 83)
				{
					this.y += 10;
				}
			
				if (e.keyCode == 68)
				{
					this.x += 10;
				}
			}
		}
	}
	
}