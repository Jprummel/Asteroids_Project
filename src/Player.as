package 
{
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Player extends Unit
	{
		private var _playerAnim:MovieClip;
		private var _speed:int;
		private var _attack:FireAttack;
		
		private var dx:Number;
		private var dy:Number;
		private var input:Point;
		
		public function Player():void
		{			
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(Event.ENTER_FRAME, aimMouse);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, playerControll);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			
			input = new Point();
			
			//PlayerAnimation
			_playerAnim = new PlayerModel();
			_playerAnim.x = stage.stageWidth / 2;
			_playerAnim.y = stage.stageHeight / 2;
			_playerAnim.scaleX = 0.6;
			_playerAnim.scaleY = 0.6;
			addChild(_playerAnim);
			
			//Starting lives
			playerLiveStart();
			//playerMovement(KeyboardEvent);
			trace(lives + " Player");
		}
		
		
		
		private function aimMouse(e:Event):void 
		{
			dx = mouseX - _playerAnim.x;
			dy = mouseY - _playerAnim.y;
			_playerAnim.rotation = (Math.atan2(dy, dx) * 180 / Math.PI);
		}
		
		public function update(e:Event):void
		{
			/*_speed = input.y * 5;
			
			_playerAnim.rotation += input.x * 5;
			
			var radians:Number = _playerAnim.rotation * Math.PI / 180;
			var xMove:Number =  Math.cos(radians);
			var yMove:Number = Math.sin(radians);
			
			_playerAnim.x += xMove * -_speed;
			_playerAnim.y += yMove * -_speed;
			*/
			
			death();
			if (_playerAnim .x < -stage.stageWidth)
			{
				_playerAnim.x = 0;
			}
			
			if (_playerAnim.x >1000)
			{
				_playerAnim.x = 950;
			}
			
			if (_playerAnim.y < -50)
			{
				_playerAnim.y = 600;
			}
			
			if (_playerAnim.y > 600)
			{
				_playerAnim.y = -50;
			}
		}
		
		public function playerControll(e:KeyboardEvent):void 
		{			
			if (e.keyCode == 87)
				{
					up = true;
				}
			
				if (e.keyCode == 65)
				{
					left = true;
				}
			
				if (e.keyCode == 83)
				{
					down = true;
				}
			
				if (e.keyCode == 68)
				{
					right = true;
				}
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
				if (e.keyCode == 87)
				{
					up = false;
				}
			
				if (e.keyCode == 65)
				{
					left = false;
				}
			
				if (e.keyCode == 83)
				{
					down = false;
				}
			
				if (e.keyCode == 68)
				{
					right = false;
				}
		}
		
		private function shoot():void
		{
				_attack = new FireAttack;
				addChild(_attack);
		}
	}
}