package com.plume.standard
{
	import flash.display.InteractiveObject;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public interface ILabel
	{
		function get self():InteractiveObject;
		function get text():String;
		function set text(value:String):void;
	}
}