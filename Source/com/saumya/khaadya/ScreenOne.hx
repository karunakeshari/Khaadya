//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.events.MouseEvent;

import com.saumya.khaadya.Utils;


class ScreenOne extends Sprite {

	public static var TO_SCREEN_2_EVENT:String = "toScreen2Event";
	
	private var screenWidth:Float;
	private var screenHeight:Float;
	private var screenCenter:Point;

	public function new(scWidth:Float, scHeight:Float) {
		trace('ScreenOne : new :');
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
		var imgProfile = new ImgProfile();
		var btnOne = new BtnOne();
		//
		addChild(imgProfile);
		addChild(btnOne);
		//
		Utils.moveToPosition(imgProfile,screenCenter.x,screenCenter.y-100);
		Utils.moveToPosition(btnOne,(imgProfile.x),(imgProfile.y + imgProfile.height));
		//
		btnOne.addEventListener(MouseEvent.CLICK,onMoveNext);
		//
	}
	private function onMoveNext(e:MouseEvent):Void{
		trace('onMoveNext');
		/*
		var evt:Event = new Event(ScreenOne.TO_SCREEN_2_EVENT);
		this.dispatchEvent(evt);
		*/
		getWeather();
	}

	//TODO: Get the weather Data
	private function getWeather():Void{
		Utils.getWeather();
	}


}