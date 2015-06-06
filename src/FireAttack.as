package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class FireAttack extends MovieClip
	{
		public function FireAttack():void
		{
			//Add bullet animation
			var attack:MovieClip = new FireBreath();
			attack.scaleX = 0.3;
			attack.scaleY = 0.3;
			addChild(attack);
		}
		
	}

}