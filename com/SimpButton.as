package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.soul.ButtonSoul;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class SimpButton extends Plume
	{
		private var disabledState:DisplayObject;
		private var downState:DisplayObject;
		private var overState:DisplayObject;
		private var upState:DisplayObject;
		private var buttonSoul:ButtonSoul;
		
		public function SimpButton(upState:DisplayObject, overState:DisplayObject = null, downState:DisplayObject = null, disabledState:DisplayObject = null)
		{
			this.upState = upState;
			this.overState = overState || upState;
			this.downState = downState || overState || upState;
			this.disabledState = disabledState || upState;
			buttonSoul = new ButtonSoul()
			buttonSoul.addEventListener(PlumeEvent.CHANGE, buttonSoul_change);
			this.addEventListener(PlumeEvent.ENABLED, this_enabled);
			addSoul(buttonSoul);
		}
		
		private function buttonSoul_change(e:PlumeEvent):void
		{
			removeChildren();
			switch (buttonSoul.state)
			{
				case ButtonSoul.DOWN: 
					addChild(downState);
					break;
				case ButtonSoul.OVER: 
					addChild(overState);
					break;
				default: 
				case ButtonSoul.NORMAL: 
					addChild(upState);
					break;
			}
		}
		
		private function this_enabled(e:PlumeEvent):void
		{
			if (enabled)
			{
				buttonSoul_change(null)
			}
			else
			{
				removeChildren();
				addChild(disabledState);
			}
		}
		override public function get width():Number 
		{
			return contentWidth;
		}
		override public function get height():Number 
		{
			return contentheight;
		}
		
		
	}
}