package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class ScoreManager extends Sprite
	{
		private var score:int;
		private var scoreText:TextField;
		
		public function ScoreManager() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function update(e:Event):void 
		{
			updateScore;
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			score = 0;
			
			scoreText = new TextField();
			scoreText.scaleX = 1.5;
			scoreText.scaleY = 1.5;
			scoreText.x = 40;
			scoreText.y = 20;
			scoreText.textColor = 0xFFFFFF;
			scoreText.text = "Score: " + score.toString(); 
			addChild(scoreText);
		}
		
		private function updateScore():void
		{
			
		}
	}
}