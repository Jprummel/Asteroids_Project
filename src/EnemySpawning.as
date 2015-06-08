package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class EnemySpawning extends Sprite
	{
		private var _timer			:Timer = new Timer(2000);
		private var _game			:Game;
		private var _enemyPerWave	:int = 1;
		private var _spawnPos		:Number;
		private var _spawnSwitch	:Number;
		private var _soundmanager	:SoundManager;
		
		public function EnemySpawning(game:Game) 
		{	
			_game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_timer.addEventListener(TimerEvent.TIMER, spawnWaves);
			_timer.start();
			_soundmanager = new SoundManager();
		}
		
		private function spawnWaves(e:TimerEvent):void 
		{	
			_spawnPos = Math.random() * 1;
			_spawnSwitch = Math.random() * 1; 
			
			var enemy:Enemy = new Enemy();
			for (var i :int = 0; i < _enemyPerWave; i++ )
			{
				if (_spawnSwitch <= 0.5) 
				{
					if (_spawnPos <= 0.5) 
					{
						enemy.x = Math.random() * 800; //top
						enemy.y = Math.random() * 10 - 250;
					}
					else 
					{
						enemy.x = Math.random() * 800; //Bot
						enemy.y = Math.random() * 10 + 900;
						enemy.rotation = 180;
					}
				}
				else
				{
					if (_spawnPos <= 0.5)
					{
						this.x = Math.random() * 1 - 250;//left
						this.y = Math.random() * 800;
						this.rotation = 270;
					}
					
					else {
						enemy.x = Math.random() * 10 + 950;//right
						enemy.y = Math.random() * 800;
						enemy.rotation = 90;
					}
				}
				_game._enemies.push(enemy);
				//_soundmanager.EnemyWalking();
				Game(parent).addChild(enemy);
			}
		}
	}
}