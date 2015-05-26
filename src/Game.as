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
		private var _enemy:Enemies;
		private var _enemies:Array = [];
		private var _score:ScoreManager;
		private var _background:Background;
		
		public function Game():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			addEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_background = new Background;
			addChild(_background);			
			_player = new Player;
			addChild(_player);
			_enemy = new Enemies;
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