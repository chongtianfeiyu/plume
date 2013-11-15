package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.xmas.display.ScrollSprite;
	import com.xmas.standard.IAlign;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class LiteBox extends LitePanel
	{
		public function LiteBox(width:int, height:int)
		{
			super(width, height)
		}
		
		/* DELEGATE flash.display.Sprite */
		public function addContent(content:DisplayObject):DisplayObject
		{
			_scrollContainer.addChild(content);
			scrollUpdata()
			return content;
		}
		
		public function addContentAt(content:DisplayObject, index:int):DisplayObject
		{
			_scrollContainer.addChildAt(content, index);
			scrollUpdata()
			return content
		}
		
		public function getContentAt(index:int):DisplayObject
		{
			return _scrollContainer.getChildAt(index);
		}
		
		public function getContentByName(name:String):DisplayObject
		{
			return _scrollContainer.getChildByName(name);
		}
		
		public function getContentIndex(content:DisplayObject):int
		{
			return _scrollContainer.getChildIndex(content);
		}
		
		public function removeContent(content:DisplayObject):DisplayObject
		{
			_scrollContainer.removeChild(content);
			scrollUpdata()
			return content
		}
		
		public function removeContentAt(index:int):DisplayObject
		{
			var displayObject:DisplayObject = _scrollContainer.removeChildAt(index);
			scrollUpdata()
			return displayObject
		}
		
		public function removeContentren(beginIndex:int = 0, endIndex:int = 2147483647):void
		{
			_scrollContainer.removeChildren(beginIndex, endIndex);
			scrollUpdata()
		}
		
		public function setContentIndex(content:DisplayObject, index:int):void
		{
			_scrollContainer.setChildIndex(content, index);
		}
		
		public function swapContentren(content1:DisplayObject, content2:DisplayObject):void
		{
			_scrollContainer.swapChildren(content1, content2);
		}
		
		public function swapContentrenAt(index1:int, index2:int):void
		{
			_scrollContainer.swapChildrenAt(index1, index2);
		}
	}
}