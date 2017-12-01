package com.saumya.khaadya;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.system.Capabilities;
import openfl.Assets;
import openfl.Lib;

import lime.app.Future;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		
	}

	private function initialize():Void{
		//Loading SWF
		//Assets.loadLibrary("id_khaadya_1");
		var future = Assets.loadLibrary("id_khaadya_1");
		future.onComplete(function(_){ trace('Loaded! : SWF'); this.construct(); });
		future.onError(function(_){ trace('Error: Loading Asset : SWF'); });
		//future.onProgress(function(_){ trace('Progress: Loading Asset : SWF'); });
		
	}
	private function construct():Void{
		trace('construct');
	}

	private function resize(newWidth:Int, newHeight:Int):Void{}
	private function stage_onResize(event:Event):Void{
		resize (stage.stageWidth, stage.stageHeight);
	}
	
	
}