package com.plume.soul
{
	import com.plume.events.PlumeEvent;
	import com.plume.standard.IGroupItem;
	import com.plume.standard.ISoul;
	import com.plume.vo.TabData;
	import com.xmas.core.Doer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	[Event(name="change",type="com.plume.events.PlumeEvent")]
	
	public class GroupSoul extends Doer implements ISoul
	{
		private var _dataList:Vector.<TabData>;
		public var template:IGroupItem;
		public var selectedItem:IGroupItem;
		private var _itemList:Vector.<IGroupItem>;
		private var _index:int = 0;
		private var _sprite:Sprite;
		public var defaultIndex:int = 0;
		
		public function GroupSoul()
		{
		}
		
		public function activate():void
		{
			reData()
			_itemList[defaultIndex].isSelected = true;
			selectedItem = _itemList[defaultIndex];
			_index = defaultIndex;
			dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE));
		}
		
		public function get dataList():Vector.<TabData>
		{
			return _dataList;
		}
		
		public function set dataList(value:Vector.<TabData>):void
		{
			_dataList = value;
			reData()
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function set index(value:int):void
		{
			if (_index != value)
			{
				_itemList[value].isSelected = true;
				_itemList[_index].isSelected = false;
				selectedItem = _itemList[value];
				_index = value;
				dispatchEvent(new PlumeEvent(PlumeEvent.CHANGE));
			}
		}
		
		public function get itemList():Vector.<IGroupItem>
		{
			return _itemList;
		}
		
		private function reData():void
		{
			_itemList = new Vector.<IGroupItem>();
			var dataListLength:int = _dataList.length;
			var groupItem:IGroupItem
			for (var i:int = 0; i < dataListLength; i++)
			{
				groupItem = getNewGroupItem()
				groupItem.data = _dataList[i];
				groupItem.groupId = i;
				groupItem.self.addEventListener(MouseEvent.CLICK, self_click);
				_itemList.push(groupItem);
			}
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE));
		}
		
		private function self_click(e:MouseEvent):void
		{
			var groupItem:IGroupItem = e.currentTarget as IGroupItem;
			if (groupItem != null)
			{
				index = groupItem.groupId;
			}
			else
			{
				//TODO xmerr
				trace("GroupSoul xmerr")
			}
		}
		
		public function getNewGroupItem():IGroupItem
		{
			var templateClass:Class = template["constructor"];
			return new templateClass() as IGroupItem;
		}
		
		/* INTERFACE com.plume.standard.ISoul */
		public function get sprite():Sprite
		{
			return _sprite;
		}
		
		public function set sprite(value:Sprite):void
		{
			_sprite = value;
		}
		
		public function deactivate():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}