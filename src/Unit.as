package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Unit extends Sprite 
	{
		public var playerLives	:int;
		public var enemyLives	:int;
		public var maxLives		:int;
		
		public var liveText		:TextField;
		
		public var up		:Boolean =  false;
		public var down		:Boolean =  false;
		public var right	:Boolean =  false;
		public var left		:Boolean =  false;
		public var speed	:int = 5;
		
		public function Unit():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function playerLiveStart():void
		{
			maxLives = 3;
			playerLives = 3;
			playerLives = maxLives;
			
			//For if we implement power ups
			/*if (playerLives > maxLives)
			{
				playerLives = maxLives;
			}*/
		}
		
		public function liveUI():void
		{
			liveText = new TextField();
			liveText.scaleX = 1.5;
			liveText.scaleY = 1.5;
			liveText.x = stage.stageWidth - 100;
			liveText.y = 20;
			liveText.textColor = 0xFFFFFF;
			liveText.text = "Lives: " + playerLives.toString(); 
			addChild(liveText);
		}
		
		public function enemyLiveStart():void
		{
			maxLives = 1;
			enemyLives = 1;
			enemyLives = maxLives;
		}
		

		
		private function update(e:Event):void 
		{
		if (up)
			{
				this.y -= speed;
			}
			if (down)
			{
				this.y += speed;
			}
			if (left)
			{
				this.x -= speed;
			}
			if (right)
			{
				this.x += speed;
			}
		}
	}
}