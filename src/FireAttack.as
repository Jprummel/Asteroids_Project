package  
{
	import flash.display.MovieClip;
	import flash.display.Shape;
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
			addChild(attack);
		}
		
	}

}