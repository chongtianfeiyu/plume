package com.plume.soul
{
	import com.plume.events.PlumeEvent;
	import com.plume.standard.ISoul;
	import com.xmas.core.Doer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class OnoffSoul extends Doer implements ISoul
	{
		private var _autoSelect:Boolean;
		private var _isSelected:Boolean;
		private var _sprite:Sprite;
		
		public function OnoffSoul()
		{
		}
		
		public function activate():void
		{
			_sprite.buttonMode = true;
			dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE));
		}
		
		private function base_click(e:MouseEvent):void
		{
			select()
		}
		
		public function select():void
		{
			isSelected = !isSelected;
		}
		
		public function deactivate():void
		{
			autoSelect = false;
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
		
		public function destroy():void
		{
		}
		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(value:Boolean):void
		{
			if (_isSelected != value)
			{
				_isSelected = value;
				dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE));
			}
		}
		
		public function get autoSelect():Boolean
		{
			return _autoSelect;
		}
		
		public function set autoSelect(value:Boolean):void
		{
			_autoSelect = value;
			if (_autoSelect)
			{
				_sprite.addEventListener(MouseEvent.CLICK, base_click);
			}
			else
			{
				_sprite.removeEventListener(MouseEvent.CLICK, base_click);
			}
		}
	}
}