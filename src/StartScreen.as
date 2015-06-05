package  
{
	import flash.display.*;
	import flash.events.*;
	import flash.display.Bitmap;
	import flash.net.URLRequest;
	import flash.media.*;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class StartScreen extends Sprite
	{
		//BG
		[Embed(source="../lib/StartScreenBG.jpg")]
		public var startBG		:Class;
		private var startBGImage:Bitmap	
		
		//Audio
		private var bgmReq	:URLRequest = new URLRequest("MenuBG.mp3");
		private var bgSound	:Sound;
		private var sc		:SoundChannel;
		private var	playing	:Boolean = false;
		
		//Nest
		[Embed(source="../lib/NestBG.jpg")]
		public var nest:Class;
		private var nestImage:Bitmap		
		
		public var startGame	:MovieClip;
		public var help			:MovieClip;
		public var exitGame		:MovieClip;
		public var credits		:MovieClip;
		
		public static const	START_GAME	:String = "startGame";
		public static const CREDITS		:String = "creditsPage";
		public static const HELP		:String = "helpPage";
		
		public function StartScreen() 
		{
			startGame = new StartGame();
			help = new Help();
			exitGame = new ExitGame();
			credits = new Credits();
			
			startBGImage = new startBG();
			nestImage = new nest();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			startGame.addEventListener(MouseEvent.MOUSE_DOWN, startGameButton);
			help.addEventListener(MouseEvent.MOUSE_DOWN, helpButton);
			exitGame.addEventListener(MouseEvent.MOUSE_DOWN, exitGameButton);
			credits.addEventListener(MouseEvent.MOUSE_DOWN, creditsButton);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//Audio
			bgSound = new Sound(bgmReq);
			if (!playing)
			{
			sc = bgSound.play(0, 9999);
			playing = true;
			}
			
			//BG
			addChild(startBGImage);
			
			//Credits Page
			credits.x = stage.stageWidth - 150;
			credits.y = stage.stageHeight - 30;
			addChild(credits);
			//Exit Button
			exitGame.x = stage.stageWidth / 2 + 90;
			exitGame.y = stage.stageHeight / 2;
			addChild(exitGame);
			//Options Button
			help.x = stage.stageWidth / 2 -80;
			help.y = stage.stageHeight / 2;
			addChild(help);
			//Start Button
			startGame.x = stage.stageWidth / 2;
			startGame.y = stage.stageHeight / 2;
			addChild(startGame);
			//Nest
			addChild(nestImage);			
		}
		
		private function startGameButton(e:MouseEvent):void 
		{
			trace("Clicked Start");
			dispatchEvent(new Event(START_GAME));
			sc.stop();
		}
		
		private function helpButton(e:MouseEvent):void 
		{
			trace("Clicked Help");
			dispatchEvent(new Event(HELP));
			
		}
		
		private function exitGameButton(e:MouseEvent):void 
		{
			trace("Clicked Exit");
		}
		
		private function creditsButton(e:MouseEvent):void 
		{
			trace("Clicked Credits");
			dispatchEvent(new Event(CREDITS));
		}
		
		public function destroy():void
		{
			startGame.removeEventListener(MouseEvent.MOUSE_DOWN, startGameButton);
			help.removeEventListener(MouseEvent.MOUSE_DOWN, helpButton);
			exitGame.removeEventListener(MouseEvent.MOUSE_DOWN, exitGameButton);
			credits.removeEventListener(MouseEvent.MOUSE_DOWN, creditsButton);
		}
	}
}