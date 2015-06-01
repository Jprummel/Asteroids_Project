package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Game extends Sprite
	{
		private var _player		:Player;
		private var _attack		:FireAttack;
		private var _enemy		:Enemies;
		private var _enemies	:Array = [];
		
		private var _dragonNest	:DragonNest;
		
		private var _score		:ScoreManager;
		private var _background	:Background;
		
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
			_dragonNest = new DragonNest;
			_dragonNest.x = 320;
			_dragonNest.y = 310;
			addChild(_dragonNest);
			_player = new Player;
			addChild(_player);			
			_enemy = new Enemies;
			_enemy.x = 100;
			_enemy.y = 100;
			addChild(_enemy);
			
			_attack = new FireAttack;
			//UI Elements
			_score = new ScoreManager;
			addChild(_score);
			
			trace (_dragonNest.x + "Nest X " + _dragonNest.y + "Nest Y ");
			trace (_enemy.x +"X " + _enemy.y + "Y");
		}
		
		private function update(e:Event):void 
		{
			_enemy.EnemyFollow(_dragonNest);
			if (_enemy.hitTestObject(_dragonNest))
			{
				_enemy.x = 0;
				_enemy.y = 0;
				_player.playerLives = _player.playerLives - 1;
				trace(_player.playerLives);
			}
				
			if (_player.playerLives < 1)
			{
				if (stage.contains(_player))
				{
				removeChild(_player);
				}
			}
			
			if (_player.hitTestObject(_enemy))
			{
				_enemy.enemyLives = _enemy.enemyLives - 1;
			}
		}
	}
}