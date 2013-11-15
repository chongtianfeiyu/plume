package com.plume.soul
{
	import com.plume.events.PlumeEvent;
	import com.plume.standard.ISoul;
	import com.xmas.core.Doer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ButtonSoul extends Doer implements ISoul
	{
		private var isRool:Boolean;
		private var isDown:Boolean;
		private var stage:Stage;
		protected var _state:String;
		protected var _sprite:Sprite;
		static public const NORMAL:String = "normal";
		static public const OVER:String = "over";
		static public const DOWN:String = "down";
		
		public function ButtonSoul()
		{
		}
		
		public function activate():void
		{
			_sprite.buttonMode = true;
			_sprite.mouseEnabled = true;
			_sprite.mouseChildren = false;
			_sprite.useHandCursor = true;
			_sprite.addEventListener(MouseEvent.MOUSE_DOWN, _sprite_mouseDown);
			_sprite.addEventListener(MouseEvent.ROLL_OUT, _sprite_rollOut);
			_sprite.addEventListener(MouseEvent.ROLL_OVER, _sprite_rollOver);
			setState(NORMAL);
		}
		
		private function _sprite_rollOver(e:MouseEvent):void
		{
			isRool = true;
			if (!isDown)
			{
				setState(OVER);
			}
		}
		
		private function _sprite_rollOut(e:MouseEvent):void
		{
			isRool = false;
			if (!isDown)
			{
				setState(NORMAL);
			}
		}
		
		public function deactivate():void
		{
			_sprite.removeEventListener(MouseEvent.MOUSE_DOWN, _sprite_mouseDown);
			_sprite.removeEventListener(MouseEvent.ROLL_OUT, _sprite_rollOut);
			_sprite.removeEventListener(MouseEvent.ROLL_OVER, _sprite_rollOver);
		}
		
		public function destroy():void
		{
			_sprite = null;
		}
		
		/* INTERFACE com.plume.standard.ISoul */
		public function get sprite():Sprite
		{
			return _sprite;
		}
		
		public function set sprite(value:Sprite):void
		{
			_sprite = value;
		}
		
		private function _sprite_mouseDown(e:MouseEvent):void
		{
			isDown = true;
			setState(DOWN);
			stage = _sprite.stage
			stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
		}
		
		private function stage_mouseUp(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
			stage = null;
			isDown = false;
			if (isRool)
			{
				setState(OVER);
			}
			else
			{
				setState(NORMAL);
			}
		}
		
		public function get state():String
		{
			return _state;
		}
		
		private function setState(value:String):void
		{
			_state = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE));
		}
	}
}