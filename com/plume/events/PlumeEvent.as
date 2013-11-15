package com.plume.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class PlumeEvent extends Event
	{
		static public const ENABLED:String = "enabled";
		static public const CHANGE:String = "change";
		static public const RESIZE:String = "resize";
		static public const DESTROY:String = "destroy";
		
		public function PlumeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new PlumeEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("PlumeEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	}
}