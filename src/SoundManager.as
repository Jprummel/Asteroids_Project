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
		private var bgmReq			:URLRequest = new URLRequest("MenuBG.mp3");//Menu
		private var bgSound			:Sound;
		private var gameBGReq		:URLRequest = new URLRequest("AmbientBG.mp3");//Game
		private var gameBGSound		:Sound;
		private var bgChannel		:SoundChannel;
		
		private var clickReq			:URLRequest = new URLRequest("ButtonClick.mp3");//Menu button click
		private var clickSound			:Sound;
		
		//private var nestReq		:URLRequest = new URLRequest("Nesthit.mp3");//Nest hit / Egg Crack sound
		//private var nestSound		:Sound;
		private var enemyDiesReq	:URLRequest = new URLRequest("EnemyDies.mp3");//Enemy dies sound
		private var enemyDiesSound	:Sound;
		//private var playerReq		:URLRequest = new URLRequest("PlayerDies.mp3");//Player dies sound
		//private var playerSound	:Sound;
		private var fireReq			:URLRequest = new URLRequest("Fireball.wav");//Attack Sound
		private var fireSound		:Sound;
		
		
		public function SoundManager() 
		{
			gameBGSound = new Sound(gameBGReq);
			bgSound = new Sound(bgmReq);
			enemyDiesSound = new Sound(enemyDiesReq);
			fireSound = new Sound(fireReq);
			clickSound = new Sound(clickReq);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function AmbientSound():void
		{
			bgChannel = gameBGSound.play(0, 9999);
		}
		
		public function StopMusic():void
		{
			bgChannel.stop();
		}
		
		public function MenuMusic():void
		{
			bgChannel = bgSound.play(0, 9999);
		}
		
		public function EnemyWalking():void
		{
			
		}
		
		public function FireSound():void
		{
			fireSound.play();
		}
		
		public function EnemyDies():void
		{
			enemyDiesSound.play();
		}
		
		public function NestHit():void
		{
			
		}
		
		public function ButtonClick():void
		{
			clickSound.play();
		}
	}

}