package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jordi Prummel, Robbert Leenen, Donovan Nguyen
	 */
	public class Game extends Sprite
	{
		private var _player:Player;
		private var _enemy:Enemy;
		private var _enemies:Array = [];
		private var _score:ScoreManager;
		
		public function Game():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			addEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_player = new Player;
			addChild(_player);
			_enemy = new Enemy;
			addChild(_enemy);
			
			//UI Elements
			_score = new ScoreManager;
			addChild(_score);
		}
		
		private function update(e:Event):void 
		{
			
		}
		
	}

}