package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.soul.OnoffSoul;
	import com.plume.standard.IOnoff;
	import com.xmas.standard.IEasy;
	import com.xmas.utils.removeFromParent;
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class SimpOnoff extends Plume implements IOnoff
	{
		private var normalState:DisplayObject;
		private var selectedState:DisplayObject;
		private var onoffSoul:OnoffSoul;
		
		public function SimpOnoff(normalState:DisplayObject, selectedState:DisplayObject = null)
		{
			this.addEventListener(PlumeEvent.ENABLED, this_enabled);
			this.selectedState = selectedState;
			this.normalState = normalState;
			onoffSoul = new OnoffSoul()
			onoffSoul.addEventListener(PlumeEvent.CHANGE, onoffSoul_change);
			addSoul(onoffSoul)
			autoSelect = true;
		}
		
		/* INTERFACE com.plume.standard.IOnoff */
		public function get isSelected():Boolean
		{
			return onoffSoul.isSelected;
		}
		
		public function set isSelected(value:Boolean):void
		{
			onoffSoul.isSelected = value;
		}
		
		public function select():void
		{
			onoffSoul.select();
		}
		
		/* INTERFACE com.plume.standard.IOnoff */
		public function get self():InteractiveObject
		{
			return this;
		}
		
		public function get autoSelect():Boolean
		{
			return onoffSoul.autoSelect;
		}
		
		public function set autoSelect(value:Boolean):void
		{
			onoffSoul.autoSelect = value;
		}
		
		protected function this_enabled(e:PlumeEvent):void
		{
			if (selectedState is Plume)
			{
				(selectedState as Plume).enabled = enabled;
			}
			if (normalState is Plume)
			{
				(normalState as Plume).enabled = enabled;
			}
		}
		
		protected function onoffSoul_change(e:PlumeEvent):void
		{
			if (isSelected)
			{
				addChild(selectedState);
				removeFromParent(normalState)
			}
			else
			{
				addChild(normalState);
				removeFromParent(selectedState)
			}
		}
		override public function get width():Number 
		{
			return contentWidth;
		}
		override public function get height():Number 
		{
			return contentHeight;
		}
	}
}