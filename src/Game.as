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
		private var _player		:Player;
		public var _enemy		:Enemy;
		public var _enemies		:Array = [];
		private var _enemySpawn	:EnemySpawning;
		
		private var removePlayer	:Boolean = false;
		private var _endTimer	:uint;
		private var _dieTimer	:uint;
		
		
		private var _dragonNest	:DragonNest;
		
		public static const END	:String = "endScreen";
		private var _endScreen	:EndScreen;
		
		//Audio
		//private var bgmReq	:URLRequest = new URLRequest("AmbientBG.mp3");//Background music
		//private var bgSound	:Sound;
		//private var nestReq	:URLRequest = new URLRequest("Nesthit.mp3");//Nest hit / Egg Crack sound
		//private var nestSound	:Sound;
		//private var enemyReq	:URLRequest = new URLRequest("EnemyDies.mp3");//Enemy dies sound
		//private var enemySound	:Sound;
		//private var playerReq	:URLRequest = new URLRequest("PlayerDies.mp3");//Player dies sound
		//private var playerSound	:Sound;
		//private var sc		:SoundChannel;
		private var _soundManager:SoundManager;
		
		private var _score		:ScoreManager;
		private var _background	:Background;
		
		public function Game():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
			
			//Audio
			//bgSound = new Sound(bgmReq);
			//sc = bgSound.play(0, 9999);
			
			_background = new Background;
			addChild(_background);		
			_dragonNest = new DragonNest;
			_dragonNest.x = 320;
			_dragonNest.y = 310;
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
			
			trace (_dragonNest.x + "Nest X " + _dragonNest.y + "Nest Y ");
			trace (_enemy.x +"X " + _enemy.y + "Y");
		}
				
		private function update(e:Event):void 
		{
			var enemyYellGenerator:Number = Math.random() * 1;
			for (var i:int = _enemies.length - 1; i >= 0; i--)
			{	
				var enemy:Enemy = _enemies[i] as Enemy;
				enemy.EnemyFollow(_dragonNest);
				
				if (_enemies[i].hitTestObject(_dragonNest))
				{
					//nestSound = new Sound(nestReq);
					//nestSound.play();
					trace("Player got hit");
					removeChild(_enemies[i]);
					
					_enemies.splice(i, 1);
					_player.playerLives = _player.playerLives - 1;
					if (_player.playerLives < 1)
					{
						_player.playerFaint();
						removePlayer = true;
						//playerSound = new playerReq();
						//playerSound.play();
						//sc.stop();
						
						_endTimer = setTimeout(endGame ,1 * 950);
					}
						if (removePlayer)
						{
							_dieTimer = setTimeout(deletePlayer, 1 * 600);
						}
				}
				else if (stage.contains(_player))
				{
					if (_player.hitTestObject(_enemies[i]))
					{	
						trace("Enemy died");
						_enemy.enemyLives = _enemy.enemyLives - 1;
						trace(_enemy.enemyLives);						
						
						if (_enemy.enemyLives <= 0)
						{
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
		
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
	}
}