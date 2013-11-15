package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.soul.GroupSoul;
	import com.plume.standard.IGroupItem;
	import com.plume.standard.ILabel;
	import com.plume.vo.TabData;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class SimpCombo extends Plume
	{
		private var groupSoul:GroupSoul;
		private var groupItemBox:Sprite
		private var label:ILabel;
		private var downButton:InteractiveObject;
		private var itemContainer:DisplayObjectContainer;
		private var itemY:Number = 0;
		
		public function SimpCombo(data:Vector.<TabData>, template:IGroupItem, label:ILabel, downButton:InteractiveObject, itemContainer:DisplayObjectContainer, defaultIndex:int = 0)
		{
			this.itemContainer = itemContainer;
			this.downButton = downButton;
			this.label = label;
			groupItemBox = new Sprite()
			groupSoul = new GroupSoul();
			groupSoul.template = template;
			groupSoul.dataList = data;
			groupSoul.defaultIndex = defaultIndex;
			groupSoul.addEventListener(PlumeEvent.RESIZE, groupSoul_resize);
			groupSoul.addEventListener(PlumeEvent.CHANGE, groupSoul_change);
			downButton.addEventListener(MouseEvent.MOUSE_DOWN, downButton_mouseDown);
			downButton.addEventListener(MouseEvent.CLICK, downButton_click);
			addChild(label.self);
			addChild(downButton);
			addSoul(groupSoul)
		}
		
		private function downButton_click(e:MouseEvent):void
		{
			e.stopPropagation()
			downButton.removeEventListener(MouseEvent.CLICK, downButton_click);
			itemContainer.stage.addEventListener(MouseEvent.CLICK, stage_click);
		}
		
		private function stage_click(e:MouseEvent):void
		{
			if (itemContainer.parent)
			{
				itemContainer.stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
				removeChild(itemContainer);
				e.stopImmediatePropagation()
				downButton.addEventListener(MouseEvent.MOUSE_DOWN, downButton_mouseDown);
				downButton.addEventListener(MouseEvent.CLICK, downButton_click);
			}
		}
		
		private function downButton_mouseDown(e:MouseEvent):void
		{
			addChild(itemContainer);
			downButton.removeEventListener(MouseEvent.MOUSE_DOWN, downButton_mouseDown);
		}
		
		private function stage_mouseUp(e:MouseEvent):void
		{
		}
		
		private function groupSoul_change(e:PlumeEvent):void
		{
			label.text = groupSoul.selectedItem.data.label;
		}
		
		private function groupSoul_resize(e:PlumeEvent):void
		{
			groupItemBox.removeChildren();
			itemY = 0;
			for (var i:int = 0; i < groupSoul.itemList.length; i++)
			{
				var item:IGroupItem = groupSoul.itemList[i]
				item.self.y = itemY;
				itemY += item.self.height;
				groupItemBox.addChild(item.self)
			}
			itemContainer.addChild(groupItemBox)
		}
	}
}