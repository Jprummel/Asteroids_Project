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
		
		public function liveStart():void
		{
			lives = maxLives;
		}
		
		public function death():void
		{
			if (lives < 1)
			{
				
			}
		}
	}
	
}