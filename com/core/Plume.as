package com.plume.core
{
	import com.plume.events.PlumeEvent;
	import com.plume.standard.ISoul;
	import com.xmas.standard.ICanDestroy;
	import com.xmas.standard.IEnabled;
	import com.xmas.utils.removeFromParent;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	[Event(name="destroy",type="com.plume.events.PlumeEvent")]
	[Event(name="change",type="com.plume.events.PlumeEvent")]
	[Event(name="enabled",type="com.plume.events.PlumeEvent")]
	[Event(name="resize",type="com.plume.events.PlumeEvent")]
	
	public class Plume extends Sprite implements ICanDestroy, IEnabled
	{
		protected var _width:int;
		protected var _height:int;
		protected var _enabled:Boolean = true;
		
		public function Plume()
		{
		}
		
		public function addSoul(soul:ISoul):void
		{
			soul.sprite = this;
			soul.activate();
		}
		
		/* INTERFACE com.xmas.standard.ICanDestroy */
		public function destroy():void
		{
			dispatchEvent(new PlumeEvent(PlumeEvent.DESTROY))
			removeFromParent(this);
		}
		
		public function change():void
		{
			dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE))
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled = value;
			mouseChildren = mouseEnabled = value;
			for (var i:int = 0; i < numChildren; i++)
			{
				if (getChildAt(i) is IEnabled)
				{
					(getChildAt(i) as IEnabled).enabled = value;
				}
			}
			dispatchEvent(new PlumeEvent(PlumeEvent.ENABLED))
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function setSize(width:int, height:int):void
		{
			_width = width;
			_height = height;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		override public function get height():Number
		{
			return _height;
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		public function get contentHeight():int
		{
			return super.height;
		}
		
		public function get contentWidth():int
		{
			return super.width;
		}
	}
}