package com.saumya.khaadya;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.system.Capabilities;
import openfl.Assets;
import openfl.Lib;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		
	}

	private function initialize():Void{}
	private function construct():Void{}

	private function resize(newWidth:Int, newHeight:Int):Void{}
	private function stage_onResize(event:Event):Void{
		resize (stage.stageWidth, stage.stageHeight);
	}
	
	
}