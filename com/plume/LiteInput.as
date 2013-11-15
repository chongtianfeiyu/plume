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
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class LiteInput extends Plume implements IMargin, ILabel
	{
		protected var _windowRectangle:Rectangle;
		protected var _textField:TextField;
		protected var litePanel:LitePanel;
		protected var _marginLeft:Number;
		protected var _marginRight:Number;
		protected var _marginTop:Number;
		protected var _marginBottom:Number;
		protected var heightOffset:int = 5;
		
		public function LiteInput(width:int = 150, height:int = 30)
		{
			super()
			_marginLeft = 2
			_marginRight = 2
			_marginTop = 2
			_marginBottom = 2
			_width = width;
			_height = height;
			_textField = new TextField();
			_textField.type = TextFieldType.INPUT;
			_textField.defaultTextFormat = UtilsTextFotmat.autoTextFormat;
			_textField.width = width - _marginLeft - _marginRight;
			textHeightUpdate()
			litePanel = new LitePanel(width - _marginLeft - _marginRight, height - _marginTop - _marginBottom);
			litePanel.x = _marginLeft;
			litePanel.y = _marginTop;
			litePanel.align(0.5, 0.5)
			addChild(litePanel);
			litePanel.scrollContainer.addChild(_textField);
			addEventListener(PlumeEvent.RESIZE, resize);
		}
		
		public function textHeightUpdate():void
		{
			if (_textField.text == "" || _textField.text == null)
			{
				_textField.text = " ";
				_textField.height = _textField.textHeight + heightOffset
				_textField.text = "";
			}
			else
			{
				_textField.height = _textField.textHeight + heightOffset
			}
		}
		
		/* INTERFACE com.plume.standard.ILabel */
		public function get self():InteractiveObject
		{
			return this;
		}
		
		/* DELEGATE flash.text.TextField */
		public function get defaultTextFormat():TextFormat
		{
			return _textField.defaultTextFormat;
		}
		
		public function set defaultTextFormat(value:TextFormat):void
		{
			_textField.defaultTextFormat = value;
			litePanel.scrollUpdata()
		}
		
		public function get displayAsPassword():Boolean
		{
			return _textField.displayAsPassword;
		}
		
		public function set displayAsPassword(value:Boolean):void
		{
			_textField.displayAsPassword = value;
		}
		
		public function get maxChars():int
		{
			return _textField.maxChars;
		}
		
		public function set maxChars(value:int):void
		{
			_textField.maxChars = value;
		}
		
		public function get restrict():String
		{
			return _textField.restrict;
		}
		
		public function set restrict(value:String):void
		{
			_textField.restrict = value;
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			_textField.text = value;
		}
		
		private function resize(e:PlumeEvent):void
		{
			_textField.width = width - _marginLeft - _marginRight;
			litePanel.setSize(width - _marginLeft - _marginRight, height - _marginTop - _marginBottom);
		}
		
		public function get textField():TextField
		{
			return _textField;
		}
	}
}