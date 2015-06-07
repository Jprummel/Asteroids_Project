package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.utils.*;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Player extends Unit
	{
		private var _playerAnim	:MovieClip;
		public var 	_playerDies	:MovieClip;
		private var _speed		:int;
		public var _attack		:FireAttack;
		
		private var timeoutID	:uint;
		
		private var dx			:Number;
		private var dy			:Number;
		
		public var _attacking	:Boolean = false;
		
		private var _livesText	:TextField;
		
		private var _soundManager:SoundManager;
		
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
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);

			_soundManager = new SoundManager();
			//PlayerAnimation
			_playerAnim = new PlayerModel();
			_playerAnim.x = stage.stageWidth / 2;
			_playerAnim.y = stage.stageHeight / 2;
			_playerAnim.scaleX = 0.25;
			_playerAnim.scaleY = 0.25;
			addChild(_playerAnim);
			
			//Lives related
			
			//Starting lives
			playerLiveStart();
			//playerMovement(KeyboardEvent);
			trace(playerLives + " Player");
			
			
		}

		private function onClick(e:MouseEvent):void 
		{
			
			if (_attack != null) 
			{
				if (!contains(_attack))
				{
					_attacking = true; 
				} 
			}
			else 
			{
				
				_attacking = true; 
			}
		}

		private function aimMouse(e:Event):void 
		{
			dx = mouseX - _playerAnim.x;
			dy = mouseY - _playerAnim.y;
			_playerAnim.rotation = (Math.atan2(dy, dx) * 180 / Math.PI);
		}
		
		public function update(e:Event):void
		{
			if (_attacking == true)
			{
				
				shoot();
				_attacking = false;
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
		
		public function shoot():void
		{
			_soundManager.FireSound();
			
			_attack = new FireAttack;
			_attack.rotation = _playerAnim.rotation;
			_attack.x = _playerAnim.x;
			_attack.y = _playerAnim.y;
			addChild(_attack);
			timeoutID = setTimeout(removeAttack, 1 * 500);
		}
		
		private function removeAttack():void
		{
			removeChild(_attack);
			clearTimeout(timeoutID);
		}
		
		public function playerFaint():void
		{
			_playerDies = new PlayerDies();
			_playerDies.x = _playerAnim.x;
			_playerDies.y = _playerAnim.y;
			_playerDies.scaleX = 0.25;
			_playerDies.scaleY = 0.25;
			_playerDies.rotation = _playerAnim.rotation;
			removeChild(_playerAnim);
			addChild(_playerDies);
		}
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
			stage.removeEventListener(Event.ENTER_FRAME, aimMouse);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, playerControll);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);

		}
	}
}