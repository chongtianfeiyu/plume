package com.plume.utils
{
	import com.plume.core.Plume;
	import com.xmas.utils.Painter;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class PlumePainter
	{
		public static function drawBackground(target:Plume, backgroundColor:uint = 0x22000000):void
		{
			target.graphics.clear();
			Painter.drawRect(target.graphics, target.width, target.height, backgroundColor & 0xFFFFFF, (backgroundColor >>> 24) / 0xFF);
		}
		
		public static function drawBorder(target:Plume, _bgColor:uint = 0x22000000, _borderColor:uint = 0x22000000, _border:int = 1):void
		{
			target.graphics.clear();
			Painter.drawRect(target.graphics, target.width, target.height, target.enabled ? (_bgColor & 0xFFFFFF) : 0xAAAAAA, (_bgColor >>> 24) / 0xFF);
			Painter.drawRectLine(target.graphics, target.width, target.height, _border, _borderColor & 0xFFFFFF, (_borderColor >>> 24) / 0xFF);
		}
	}
}