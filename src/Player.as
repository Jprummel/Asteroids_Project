package 
{
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Player extends Unit
	{
		private var rect:Shape;
		
		public function Player():void
		{
			this.addEventListener(Event.ENTER_FRAME, update);
			this.addEventListener(KeyboardEvent.KEY_DOWN, playerControll);
			//Import animation here
			rect = new Shape;
			rect.graphics.beginFill(0xFF0000);
			rect.graphics.drawRect(50, 50, 50, 50);
			rect.graphics.endFill();
			addChild(rect);
			
			//Starting lives
			maxLives = 5;
			liveStart();
		}
		
		public function update(e:Event):void 
		{
			playerControll;
		}
		
		public function playerControll(e:KeyboardEvent):void 
		{
			if (e.keyCode == 87)
			{
				rect.y -= 10;
			}
			
			if (e.keyCode == 65)
			{
				rect.x -= 10;
			}
			
			if (e.keyCode == 83)
			{
				rect.y += 10;
			}
			
			if (e.keyCode == 68)
			{
				rect.x += 10;
			}
		}
		
		private function shoot():void
		{
			
		}
		
		
		
	}
	
}