package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Game extends Sprite
	{
		private var _player:Player;
		
		public function Game() 
		{
			_player = new Player;
			addChild(_player);
		}
		
	}

}