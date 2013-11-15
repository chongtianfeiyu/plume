package com.plume.vo
{
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public dynamic class TabData
	{
		public var data:Object;
		public var label:String;
		
		public function TabData(label:String = null, data:Object = null)
		{
			this.data = data;
			this.label = label;
		}
	}
}