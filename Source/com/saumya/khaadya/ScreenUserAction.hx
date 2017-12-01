//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.events.MouseEvent;

import com.saumya.khaadya.Utils;


class ScreenUserAction extends Sprite {
	
	private var screenWidth:Float;
	private var screenHeight:Float;
	private var screenCenter:Point;
	//
	private var btnToggleBreakfast:MovieClip;

	public function new(scWidth:Float, scHeight:Float) {
		trace('ScreenUserAction : new :');
		super();
		//
		screenWidth = scWidth;
		screenHeight = scHeight;
		screenCenter = new Point(scWidth/2,scHeight/2);
		//
		initialize();
	}
	private function initialize():Void{
		construct();
	}
	private function construct():Void{
		makeFromSWF();
	}
	private function makeFromSWF():Void{
		// SWF is already loaded and ready!
		var btnBreakfast = new BtnBreakfast();
		var btnLunch = new BtnLunch();
		var btnSnacks = new BtnSnacks();
		var btnDinner = new BtnDinner();
		//
		this.btnToggleBreakfast = new BtnToggleOne();
		btnToggleBreakfast.stop();
		//
		addChild(btnBreakfast);
		addChild(btnLunch);
		addChild(btnSnacks);
		addChild(btnDinner);

		addChild(btnToggleBreakfast);
		//
		var yGap:Int = 60;
		
		Utils.moveToPosition(btnBreakfast,screenCenter.x,screenCenter.y - 200);
		Utils.moveToPosition(btnToggleBreakfast, btnBreakfast.x - (30 + btnBreakfast.width/2) , btnBreakfast.y);
		
		Utils.moveToPosition(btnLunch,(btnBreakfast.x),(btnBreakfast.y + btnBreakfast.height + yGap));
		Utils.moveToPosition(btnSnacks,(btnLunch.x),(btnLunch.y + btnLunch.height + yGap));
		Utils.moveToPosition(btnDinner,(btnSnacks.x),(btnSnacks.y + btnSnacks.height + yGap));
		//
		btnBreakfast.addEventListener(MouseEvent.CLICK,onBreakfast);
		btnLunch.addEventListener(MouseEvent.CLICK,onLaunch);
		btnSnacks.addEventListener(MouseEvent.CLICK,onSnacks);
		btnDinner.addEventListener(MouseEvent.CLICK,onDinner);
		//
	}
	private function onBreakfast(e:MouseEvent):Void{
		trace('onBreakfast');
		//this.btnToggleBreakfast.gotoAndStop(2);
		Utils.toggleClipWithFrames(btnToggleBreakfast,1,2);
	}
	private function onLaunch(e:MouseEvent):Void{
		trace('onLaunch');
	}
	private function onSnacks(e:MouseEvent):Void{
		trace('onSnacks');
	}
	private function onDinner(e:MouseEvent):Void{
		trace('onDinner');
	}


}