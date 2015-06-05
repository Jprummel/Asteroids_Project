package 
{
	import flash.accessibility.AccessibilityProperties;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Main extends Sprite 
	{
		private var _game		:Game;
		private var _helpPage	:HelpPage;
		private var _credits	:CreditsPage;
		private var _startScreen:StartScreen;
		private var _endScreen	:EndScreen;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point	
			_startScreen = new StartScreen;
			_game = new Game;
			_credits = new CreditsPage;
			_helpPage = new HelpPage;
			_endScreen = new EndScreen;
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
			_game = new Game;
			addChild(_game);
			removeChild(_endScreen);
			_endScreen.destroy();
		}
	
		private function endScreen(e:Event):void 
		{
			addChild(_endScreen);
			removeChild(_game);
			_game.destroy();
		}

		private function creditsPage(e:Event):void 
		{
			addChild(_credits);
			destroyStart();
		}

		private function helpPage(e:Event):void 
		{
			addChild(_helpPage);
			destroyStart();
		}

		private function startGame(e:Event):void
		{
			addChild(_game);
			destroyStart();
		}
		
		//Back to menu buttons
		
		private function backToMenuFromEnd(e:Event):void 
		{
			createStart();
			removeChild(_endScreen);
			_endScreen.destroy();
		}
		
		private function backToMenuFromHelp(e:Event):void 
		{
			createStart();
			removeChild(_helpPage);
			_helpPage.destroy();
		}
		
		private function backToMenuFromCredits(e:Event):void 
		{
			createStart();
			removeChild(_credits);
			_credits.destroy();
		}

		//Menu create/destroy
		private function createStart():void
		{
			_startScreen = new StartScreen;
			addChild(_startScreen);
		}

		private function destroyStart():void
		{
			removeChild(_startScreen);
			_startScreen.destroy();
		}
	}
}