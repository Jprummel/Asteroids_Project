package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.*;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class SoundManager extends Sprite
	{
		//Background music
		private var bgmReq				:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/MenuBG.mp3");//Menu
		private var bgSound				:Sound;
		private var gameBGReq			:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/AmbientBG.mp3");//Game
		private var gameBGSound			:Sound;
		private var gameOverBGReq		:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/GameOver.mp3");//Game over
		private var gameOverBGSound		:Sound;
		private var bgChannel			:SoundChannel;
		//Menu
		private var clickReq			:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/ButtonClick.mp3");//Menu button click
		private var clickSound			:Sound;
		//Game Sound Effects
		private var nestReq				:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/NestHit.mp3");//Nest hit / Egg Crack sound
		private var nestSound			:Sound;
		private var enemyDiesReq		:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/EnemyDies.mp3");//Enemy dies sound
		private var enemyDiesSound		:Sound;
		private var enemyWalkingReq		:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/EnemyWalking.mp3");//Enemy dies sound
		private var enemyWalkingSound	:Sound;
		private var efxChannel			:SoundChannel;
		private var fireReq				:URLRequest = new URLRequest("http://17722.hosts.ma-cloud.nl/gameMusic/Fireball.mp3");//Attack Sound
		private var fireSound			:Sound;
		
		
		public function SoundManager() 
		{
			gameBGSound 		= new Sound(gameBGReq);
			bgSound 			= new Sound(bgmReq);
			gameOverBGSound		= new Sound(gameOverBGReq);
			enemyWalkingSound 	= new Sound(enemyWalkingReq);
			enemyDiesSound 		= new Sound(enemyDiesReq);
			nestSound			= new Sound(nestReq);
			fireSound 			= new Sound(fireReq);
			clickSound 			= new Sound(clickReq);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//MUSIC
		public function AmbientSound():void
		{
			bgChannel = gameBGSound.play(0, 9999);
		}
		public function MenuMusic():void
		{
			bgChannel = bgSound.play(0, 9999);
		}
		public function GameOver():void
		{
			bgChannel = gameOverBGSound.play();
		}		
		public function StopMusic():void
		{
			bgChannel.stop();
		}
		
		
		//SOUND EFFECTS
		//Enemy
		public function EnemyWalking():void
		{
			efxChannel = enemyWalkingSound.play(0,9999);
		}
		
		public function EnemyDies():void
		{
			enemyDiesSound.play();
		}
		
		public function StopEFX():void
		{
			efxChannel.stop();
		}
		
		//Player&Ambient
		public function FireSound():void
		{
			fireSound.play();
		}		
		
		public function NestHit():void
		{
			nestSound.play();
		}

		//Menu
		public function ButtonClick():void
		{
			clickSound.play();
		}
	}

}