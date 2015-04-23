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
		private var player:Shape;
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
			
			//Import animation here (placeholder for now)
			player = new Shape;
			player.graphics.beginFill(0xFFFFFF);
			player.graphics.drawRect(45, 45, 60,60);
			player.graphics.endFill();
			player.graphics.beginFill(0xFF0000);
			player.graphics.drawRect(50, 50, 50, 50);
			player.graphics.endFill();
			addChild(player);
			
			//Starting lives
			playerLiveStart();
			trace(lives + " Player");
		}
		
		public function update(e:Event):void
		{
			
			death();
			if (player.x < -stage.stageWidth)
			{
				player.x = stage.stageWidth;
			}
		}
		
		public function playerControll(e:KeyboardEvent):void 
		{			
			if (e.keyCode == 87)
			{
				player.y -= speed;
			}
			
			if (e.keyCode == 65)
			{
				player.x -= speed ;
			}
			
			if (e.keyCode == 83)
			{
				player.y += speed;
			}
			
			if (e.keyCode == 68)
			{
				player.x += speed;
			}
		}
		
		private function shoot():void
		{
			
		}
	}
}