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
		private var speed:int = 10;
		
		public function Player():void
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, playerControll);
			//Import animation here
			rect = new Shape;
			rect.graphics.beginFill(0x000000);
			rect.graphics.drawRect(45, 45, 60,60);
			rect.graphics.endFill();
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
			//rect.x += speed;
			playerControll;
		}
		
		public function playerControll(e:KeyboardEvent):void 
		{			
			if (e.keyCode == 87)
			{
				rect.y -= speed;
			}
			
			if (e.keyCode == 65)
			{
				rect.x -= speed ;
				//rect.rotationZ -= speed;
			}
			
			if (e.keyCode == 83)
			{
				rect.y += speed;
			}
			
			if (e.keyCode == 68)
			{
				rect.x += speed;
			}
		}
		
		private function shoot():void
		{
			
		}
		
		
		
	}
	
}