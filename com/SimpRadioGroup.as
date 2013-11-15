package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.soul.GroupSoul;
	import com.plume.standard.IGroupItem;
	import com.plume.vo.TabData;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class SimpRadioGroup extends Plume
	{
		private var groupSoul:GroupSoul;
		
		public function SimpRadioGroup(data:Vector.<TabData>, template:IGroupItem)
		{
			groupSoul = new GroupSoul();
			groupSoul.template = template;
			groupSoul.dataList = data;
			groupSoul.defaultIndex = 0;
			groupSoul.addEventListener(PlumeEvent.RESIZE, groupSoul_resize);
			groupSoul.addEventListener(PlumeEvent.CHANGE, groupSoul_change);
			groupSoul.activate();
		}
		
		private function groupSoul_change(e:PlumeEvent):void 
		{
			trace("ss",groupSoul.selectedItem.data.label);
		}
		
		private function groupSoul_resize(e:PlumeEvent):void
		{
			for (var i:int = 0; i < groupSoul.itemList.length; i++) 
			{
				var item:IGroupItem =groupSoul.itemList[i]
				item.self.x =i* 120;
				addChild(item.self)
			}
			
		}
	}
}