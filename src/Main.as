package 
{
	import flash.accessibility.AccessibilityProperties;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.*;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Main extends Sprite 
	{
		private var _game			:Game;
		private var _helpPage		:HelpPage;
		private var _credits		:CreditsPage;
		private var _startScreen	:StartScreen;
		private var _endScreen		:EndScreen;
		private var _soundManager	:SoundManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point	
			_startScreen = new StartScreen();
			_game = new Game();
			_credits = new CreditsPage();
			_helpPage = new HelpPage();
			_endScreen = new EndScreen();
			_soundManager = new SoundManager();
			addChild(_startScreen);
			_startScreen.addEventListener(StartScreen.START_GAME, startGame);
			_startScreen.addEventListener(StartScreen.HELP, helpPage);
			_startScreen.addEventListener(StartScreen.CREDITS, creditsPage);
			_game.addEventListener(Game.END, endScreen);
			_endScreen.addEventListener(EndScreen.RETRY, restartGame);
			_endScreen.addEventListener(EndScreen.RETURN, backToMenuFromEnd);
			_credits.addEventListener(CreditsPage.RETURN, backToMenuFromCredits);
			_helpPage.addEventListener(HelpPage.RETURN, backToMenuFromHelp);
		}

		private function restartGame(e:Event):void 
		{
			
			init();
			//_game = new Game;
			//addChild(_game);
			//_soundManager.ButtonClick();
			//removeChild(_endScreen);
			//_endScreen.destroy();
		}
	
		private function endScreen(e:Event):void 
		{
			addChild(_endScreen);
			_soundManager.StopMusic();
			_soundManager.GameOver();
			removeChild(_game);
			_game.destroy();
		}

		private function creditsPage(e:Event):void 
		{
			_soundManager.ButtonClick();
			addChild(_credits);
		}

		private function helpPage(e:Event):void 
		{
			_soundManager.ButtonClick();
			addChild(_helpPage);
		}

		private function startGame(e:Event):void
		{	
			init();	
			addChild(_game);
			_soundManager.ButtonClick();
			_soundManager.AmbientSound();
		}
		
		//Back to menu buttons
		
		private function backToMenuFromEnd(e:Event):void 
		{
			addChild(_startScreen);
			_soundManager.ButtonClick();
			_soundManager.MenuMusic();
			removeChild(_endScreen);
			_endScreen.destroy();
		}
		
		private function backToMenuFromHelp(e:Event):void 
		{
			_soundManager.ButtonClick();
			removeChild(_helpPage);
		}
		
		private function backToMenuFromCredits(e:Event):void 
		{
			_soundManager.ButtonClick();
			removeChild(_credits);
		}
	}
}