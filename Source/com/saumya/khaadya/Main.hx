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

import com.saumya.khaadya.ScreenOne;
import com.saumya.khaadya.ScreenUserAction;


class Main extends Sprite {

	private var screen1:ScreenOne;
	private var screen2:ScreenUserAction;
	
	
	public function new () {

		trace('Main: new : constructor ');
		
		super ();
		/*
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		*/
		stage.addEventListener (Event.RESIZE, stage_onResize);
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	private function initialize():Void{
		trace('Main: initialize : ');
		//Loading SWF
		//Assets.loadLibrary("id_khaadya_1");
		var future = Assets.loadLibrary("id_khaadya_1");
		future.onComplete(function(_){ trace('Main : Loaded! : SWF'); this.construct(); });
		future.onError(function(_){ trace('Main : Error: Loading Asset : SWF'); });
		//future.onProgress(function(_){ trace('Progress: Loading Asset : SWF'); });
		
	}
	private function construct():Void{
		trace('Main: construct : ');
		screen1 = new ScreenOne(stage.stageWidth, stage.stageHeight);
		screen2 = new ScreenUserAction(stage.stageWidth, stage.stageHeight);
		//
		screen1.addEventListener(ScreenOne.TO_SCREEN_2_EVENT,onToScreenTwo);
		//
		addChild(screen1);
	}

	private function resize(newWidth:Int, newHeight:Int):Void{
		trace('Main: resize : ');
	}
	private function stage_onResize(event:Event):Void{
		trace('Main: stage_onResize : ');
		resize (stage.stageWidth, stage.stageHeight);
	}

	private function onAddedToStage(e:Event):Void{
		trace('Main: onAddedToStage : ');
		initialize ();
	}
	//
	private function onToScreenTwo(event:Event):Void{
		trace('Main : onToScreenTwo : ');
		removeChild(screen1);
		addChild(screen2);

	}
	
	
}