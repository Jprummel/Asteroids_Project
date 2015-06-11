package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.text.TextField;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Game extends Sprite
	{
		//Game Elements
		private var _player			:Player;
		public var _enemy			:Enemy;
		public var _enemies			:Array = [];
		private var _enemySpawn		:EnemySpawning;
		private var _dragonNest		:DragonNest;
		//EndGame Related
		private var removePlayer	:Boolean = false;
		private var _endTimer		:uint;
		private var _dieTimer		:uint;
		//Events
		public static const END		:String = "endScreen";
		private var _endScreen		:EndScreen;
		//Audio
		private var _soundManager	:SoundManager;
		//UI & BG
		private var _score			:ScoreManager;
		private var _liveText		:TextField;
		private var _background		:Background;
		
		public function Game():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			create();
			_background = new Background;
			addChild(_background);		
			
			_dragonNest = new DragonNest;
			_dragonNest.x =stage.stageWidth /2;
			_dragonNest.y = stage.stageWidth / 2;
			addChild(_dragonNest);						
			
			_enemy = new Enemy;
			_enemySpawn = new EnemySpawning(this);
			
			addChild(_enemySpawn);
			_player = new Player;
			
			addChild(_player);
			_soundManager = new SoundManager();
			//UI Elements
			_score = new ScoreManager;
			addChild(_score);
			
			_liveText = new TextField();
			_liveText.scaleX = 1.5;
			_liveText.scaleY = 1.5;
			_liveText.x = stage.stageWidth - 100;
			_liveText.y = 40;
			_liveText.textColor = 0xFFFFFF;
			
			addChild(_liveText);
			
			
			trace (_dragonNest.x + "Nest X " + _dragonNest.y + "Nest Y ");
			trace (_enemy.x +"X " + _enemy.y + "Y");
		}
				
		private function update(e:Event):void 
		{
			_liveText.text = "Lives: " + _player.playerLives.toString();
			
			var enemyYellGenerator:Number = Math.random() * 1;
			for (var i:int = _enemies.length - 1; i >= 0; i--)
			{	
				var enemy:Enemy = _enemies[i] as Enemy;
				enemy.EnemyFollow(_dragonNest);
				
				//ENEMY HITTEST
				if (_enemies[i].hitTestObject(_dragonNest))
				{
					trace("Player got hit");
					_soundManager.NestHit();
					removeChild(_enemies[i]);
					
					_enemies.splice(i, 1);
					_player.playerLives = _player.playerLives - 1;
					if (_player.playerLives < 1)
					{
						_player.playerFaint();
						//_soundManager.PlayerFaint();
						removePlayer = true;
						_endTimer = setTimeout(endGame ,1 * 950);
					}
						if (removePlayer)
						{
							_dieTimer = setTimeout(deletePlayer, 1 * 600);
						}
				}
				//PLAYER HITTEST
				else if (stage.contains(_player))
				{
					if (_player._attack.hitTestObject(_enemies[i]))
					{	
						trace("Enemy died");
						removeChild(_enemies[i]);
						_enemies.splice(i, 1);
						_score.score = _score.score + 25;
						if (enemyYellGenerator <= 0.3)
						{
							_soundManager.EnemyDies();
						}
					}
				}
			}			
		}
		
		public function endGame():void 
		{			
			dispatchEvent(new Event(END));
		}
		
		private function deletePlayer():void
		{
			if (stage.contains(_player))
			{	
				_player.destroy();
			}
		}
		
		public function create():void
		{
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
	}
}