package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.xmas.standard.IAlign;
	import com.xmas.standard.ICanDestroy;
	import com.xmas.standard.IOffset;
	import com.xmas.utils.bound;
	import com.xmas.utils.getOriginalRect;
	import com.xmas.utils.getScrollRect;
	import com.xmas.utils.removeFromParent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class LitePanel extends Plume implements IAlign, IOffset, ICanDestroy
	{
		protected var _scrollContainer:Sprite;
		protected var _offsetY:int;
		protected var _offsetX:int;
		protected var _alignY:Number;
		protected var _alignX:Number;
		
		public function LitePanel(width:int, height:int)
		{
			super();
			_scrollContainer = new Sprite()
			addChild(_scrollContainer)
			_width = width;
			_height = height;
			_alignX = 0;
			_alignY = 0;
			addEventListener(PlumeEvent.RESIZE, resize);
			_scrollContainer.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function resize(e:PlumeEvent):void
		{
			scrollUpdata()
		}
		
		private function addedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			scrollUpdata()
		}
		
		public function scrollUpdata():void
		{
			if (_scrollContainer.stage)
			{
				_scrollContainer.scrollRect = getScrollRect(getOriginalRect(_scrollContainer), new Rectangle(_offsetX, _offsetY, width, height), _alignX, _alignY);
			}
		}
		
		/* INTERFACE com.xmas.standard.ICanDestroy */
		override public function destroy():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			removeEventListener(PlumeEvent.RESIZE, resize);
			removeFromParent(_scrollContainer);
			super.destroy();
		}
		
		/* INTERFACE com.xmas.standard.IAlign */
		public function set alignY(value:Number):void
		{
			_alignY = bound(value, 0, 1);
			scrollUpdata()
		}
		
		public function set alignX(value:Number):void
		{
			_alignX = bound(value, 0, 1);
			scrollUpdata()
		}
		
		public function get alignY():Number
		{
			return _alignY;
		}
		
		public function get alignX():Number
		{
			return _alignX;
		}
		
		public function align(alignX:Number, alignY:Number):void
		{
			_alignX = bound(alignX, 0, 1);
			_alignY = bound(alignY, 0, 1);
			scrollUpdata()
		}
		
		public function set offsetY(value:int):void
		{
			_offsetY = value;
		}
		
		public function get offsetY():int
		{
			return _offsetY;
		}
		
		public function set offsetX(value:int):void
		{
			_offsetX = value;
		}
		
		public function get offsetX():int
		{
			return _offsetX;
		}
		
		public function get scrollContainer():Sprite
		{
			return _scrollContainer;
		}
		
		public function offset(offsetX:int, offsetY:int):void
		{
			_offsetX = offsetX;
			_offsetY = offsetY;
			scrollUpdata()
		}
		
		public function reset(alignX:Number = 0, alignY:Number = 0, offsetX:int = 0, offsetY:int = 0):void
		{
			_alignX = bound(alignX, 0, 1);
			_alignY = bound(alignY, 0, 1);
			_offsetX = offsetX;
			_offsetY = offsetY;
			scrollUpdata()
		}
	}
}