package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class EnemySpawning extends Sprite
	{
		private var timer:Timer = new Timer(2000);
		private var _game: Game;
		private var _enemyPerWave: int = 1;
		private var spawnPos:Number;
		private var spawnSwitch:Number;
		
		public function EnemySpawning(game:Game) 
		{	
			_game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			timer.addEventListener(TimerEvent.TIMER, spawnWaves);
			timer.start();
			
		}
		
		private function spawnWaves(e:TimerEvent):void 
		{	
			spawnPos = Math.random() * 1;
			spawnSwitch = Math.random() * 1; 
			
			var enemy:Enemy = new Enemy();
			for (var i :int = 0; i < _enemyPerWave; i++ )
			{
				if (spawnSwitch <= 0.5) 
				{
					if (spawnPos <= 0.5) 
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
					if (spawnPos <= 0.5)
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
				//enemy.x = Math.random() * 800;
				//enemy.y = Math.random() * 800;
				_game._enemies.push(enemy);
				Game(parent).addChild(enemy);
			}
		}
	}
}