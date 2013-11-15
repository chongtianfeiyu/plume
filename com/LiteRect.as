package com.plume
{
	import flash.display.Shape;
	
	public class LiteRect extends Shape
	{
		public function LiteRect(width:int = 120, height:int = 30, color:uint = 0xFF000000)
		{
			reDraw(width, height, color);
		}
		
		public function reDraw(width:int, height:int, color:uint):void
		{
			graphics.beginFill(color & 0xFFFFFF, (color >>> 24) / 0xFF);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
	}
}