package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.soul.ButtonSoul;
	import com.xmas.doer.FadeDoer;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class SimpFadeButton extends Plume
	{
		private var disabledState:DisplayObject;
		private var downState:DisplayObject;
		private var overState:DisplayObject;
		private var upState:DisplayObject;
		private var buttonSoul:ButtonSoul;
		public var overFrame:int = 4;
		public var outFrame:int = 20;
		
		public function SimpFadeButton(upState:DisplayObject, overState:DisplayObject = null, downState:DisplayObject = null, disabledState:DisplayObject = null)
		{
			this.upState = upState;
			this.overState = overState || upState;
			this.downState = downState || overState || upState;
			this.disabledState = disabledState || upState;
			this.overState.alpha = 0;
			this.downState.alpha = 0;
			this.disabledState.alpha = 0;
			this.upState.alpha = 1;
			buttonSoul = new ButtonSoul()
			buttonSoul.addEventListener(PlumeEvent.CHANGE, buttonSoul_change);
			this.addEventListener(PlumeEvent.ENABLED, this_enabled);
			addSoul(buttonSoul);
		}
		
		protected function this_enabled(e:PlumeEvent):void
		{
			if (enabled)
			{
				FadeDoer.hide(disabledState, 1 / overFrame)
				buttonSoul_change(null)
			}
			else
			{
				FadeDoer.hide(upState, 1 / overFrame)
				FadeDoer.hide(downState, 1 / overFrame)
				FadeDoer.hide(overState, 1 / overFrame)
				FadeDoer.show(disabledState, 1 / overFrame, this)
			}
		}
		
		protected function buttonSoul_change(e:PlumeEvent):void
		{
			switch (buttonSoul.state)
			{
				case ButtonSoul.DOWN: 
					FadeDoer.hide(upState, 1 / overFrame)
					FadeDoer.hide(overState, 1 / overFrame)
					FadeDoer.show(downState, 1 / overFrame, this)
					break;
				case ButtonSoul.OVER: 
					FadeDoer.hide(upState, 1 / overFrame)
					FadeDoer.hide(downState, 1 / overFrame)
					FadeDoer.show(overState, 1 / overFrame, this)
					break;
				default: 
				case ButtonSoul.NORMAL: 
					FadeDoer.hide(downState, 1 / outFrame)
					FadeDoer.hide(overState, 1 / outFrame)
					FadeDoer.show(upState, 1 / outFrame, this)
					break;
			}
		}
	}
}