package com.plume.standard
{
	import com.plume.vo.TabData;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public interface IGroupItem extends IOnoff
	{
		function get groupId():int;
		function set groupId(value:int):void;
		function set data(value:TabData):void
		function get data():TabData;
	}
}