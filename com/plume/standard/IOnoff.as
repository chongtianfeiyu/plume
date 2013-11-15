package com.plume.standard
{
	import flash.display.InteractiveObject;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public interface IOnoff
	{
		function get isSelected():Boolean;
		function set isSelected(value:Boolean):void;
		function select():void;
		function get self():InteractiveObject;
	}
}