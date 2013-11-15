package com.plume
{
	import com.plume.core.Plume;
	import com.plume.events.PlumeEvent;
	import com.plume.standard.ILabel;
	import com.xmas.standard.IMargin;
	import com.xmas.utils.UtilsTextFotmat;
	import flash.display.InteractiveObject;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class LiteLabel extends Plume implements IMargin, ILabel
	{
		private var _windowRectangle:Rectangle;
		private var _textField:TextField;
		private var litePanel:LitePanel;
		private var _marginLeft:Number;
		private var _marginRight:Number;
		private var _marginTop:Number;
		private var _marginBottom:Number;
		
		public function LiteLabel(text:String = null, width:int = 150, height:int = 30)
		{
			super()
			_marginLeft = 2
			_marginRight = 2
			_marginTop = 2
			_marginBottom = 2
			_width = width;
			_height = height;
			_textField = new TextField();
			_textField.defaultTextFormat = UtilsTextFotmat.autoTextFormat;
			litePanel = new LitePanel(width - _marginLeft - _marginRight, height - _marginTop - _marginBottom);
			litePanel.x = _marginLeft;
			litePanel.y = _marginTop;
			litePanel.align(0.5, 0.5)
			addChild(litePanel);
			_textField.selectable = false;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			litePanel.scrollContainer.addChild(_textField);
			_textField.text = text || "";
			addEventListener(PlumeEvent.RESIZE, resize);
		}
		
		private function resize(e:PlumeEvent):void
		{
			litePanel.setSize(width - _marginLeft - _marginRight, height - _marginTop - _marginBottom);
		}
		
		///* DELEGATE flash.text.TextField */
		public function get defaultTextFormat():TextFormat
		{
			return _textField.defaultTextFormat;
		}
		
		public function set defaultTextFormat(value:TextFormat):void
		{
			_textField.defaultTextFormat = value;
			litePanel.scrollUpdata()
		}
		
		public function getTextFormat(beginIndex:int = -1, endIndex:int = -1):TextFormat
		{
			return _textField.getTextFormat(beginIndex, endIndex);
		}
		
		public function get htmlText():String
		{
			return _textField.htmlText;
		}
		
		public function set htmlText(value:String):void
		{
			_textField.htmlText = value;
			litePanel.scrollUpdata()
		}
		
		public function setTextFormat(format:TextFormat, beginIndex:int = -1, endIndex:int = -1):void
		{
			_textField.setTextFormat(format, beginIndex, endIndex);
			litePanel.scrollUpdata()
		}
		
		/* DELEGATE flash.text.TextField */
		public function appendText(newText:String):void
		{
			_textField.appendText(newText);
			litePanel.scrollUpdata()
		}
		
		/* INTERFACE com.plume.standard.ILabel */
		public function get self():InteractiveObject
		{
			return this;
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			_textField.text = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		//---------------------------------------
		public function get marginLeft():Number
		{
			return _marginLeft;
		}
		
		public function set marginLeft(value:Number):void
		{
			_marginLeft = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		public function get marginRight():Number
		{
			return _marginRight;
		}
		
		public function set marginRight(value:Number):void
		{
			_marginRight = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		public function get marginTop():Number
		{
			return _marginTop;
		}
		
		public function set marginTop(value:Number):void
		{
			_marginTop = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		public function get marginBottom():Number
		{
			return _marginBottom;
		}
		
		public function set marginBottom(value:Number):void
		{
			_marginBottom = value;
			dispatchEvent(new PlumeEvent(PlumeEvent.RESIZE))
		}
		
		public function get textField():TextField
		{
			return _textField;
		}
	}
}