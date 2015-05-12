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
			
			input = new Point();
			movementEnabled = true;
			
			//PlayerAnimation
			_playerAnim = new dragonAnim();
			_playerAnim.x = stage.stageWidth / 2;
			_playerAnim.y = stage.stageHeight / 2;
			_playerAnim.scaleX = 0.7;
			_playerAnim.scaleY = 0.7;
			addChild(_playerAnim);
			
			//Starting lives
			playerLiveStart();
			//playerMovement(KeyboardEvent);
			trace(lives + " Player");
		}
		
		private function aimMouse(e:Event):void 
		{
			dx = stage.mouseX - _playerAnim.x;
			dy = stage.mouseY - _playerAnim.y;
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
			_playerAnim.y += yMove * -_speed;*/
			
			addEventListener(KeyboardEvent.KEY_DOWN, shoot)
									
			death();
			if (_playerAnim .x < -100)
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
		
		/*public function playerControll():void 
		{			
			playerMovement;
		}*/
		
		private function shoot(e:KeyboardEvent):void
		{
			if (e.keyCode == 32)
			{
				_attack = new FireAttack;
			}
		}
	}
}