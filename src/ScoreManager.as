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
		public var score		:int;
		private var scoreText	:TextField;
		
		public function ScoreManager() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
			
			score = 0;
			
			scoreText = new TextField();
			scoreText.scaleX = 1.5;
			scoreText.scaleY = 1.5;
			scoreText.x = stage.stageWidth - 100;
			scoreText.y = 20;
			scoreText.textColor = 0xFFFFFF;
			addChild(scoreText);
		}
		
		private function update(e:Event):void 
		{
			scoreText.text = "Score: " + score.toString(); 
		}
	}
}