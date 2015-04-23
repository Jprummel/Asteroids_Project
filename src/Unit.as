package 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Unit extends Sprite 
	{
		public var lives:int;
		public var maxLives:int;
		
		public function Unit():void
		{
			
		}
		
		public function playerLiveStart():void
		{
			maxLives = 5
			lives = 5;
			lives = maxLives;
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
				
			}
		}
	}
	
}