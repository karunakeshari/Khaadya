//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.events.MouseEvent;

import com.saumya.khaadya.Utils;
import com.saumya.khaadya.ui.SWFClip;
import com.saumya.khaadya.ui.PopupYay;


class ScreenUserAction extends Sprite {
	
	private var screenWidth:Float;
	private var screenHeight:Float;
	private var screenCenter:Point;
	//
	private var btnToggleBreakfast:SWFClip;
	private var btnToggleLunch:SWFClip;
	private var btnToggleSnacks:SWFClip;
	private var btnToggleDinner:SWFClip;
	//
	private var popupClipYay:PopupYay;


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
		popupClipYay = new PopupYay();
		//
		this.btnToggleBreakfast = new SWFClip( new BtnToggleOne() );
		//btnToggleBreakfast.stop();
		this.btnToggleLunch =  new SWFClip( new BtnToggleOne() );
		//btnToggleLunch.stop();
		this.btnToggleSnacks = new SWFClip( new BtnToggleOne() );
		//btnToggleSnacks.stop();
		this.btnToggleDinner = new SWFClip( new BtnToggleOne() );
		//btnToggleDinner.stop();
		//
		addChild(btnBreakfast);
		addChild(btnLunch);
		addChild(btnSnacks);
		addChild(btnDinner);

		//addChild(popupClipYay);
		//
		addChild(btnToggleBreakfast);
		addChild(btnToggleLunch);
		addChild(btnToggleSnacks);
		addChild(btnToggleDinner);
		//
		//addChild(popupClipYay); // since popup will be over everything else
		//
		var yGap:Int = 60;
		
		Utils.moveToPosition(btnBreakfast,screenCenter.x,screenCenter.y - 200);
		Utils.moveToPosition(btnToggleBreakfast, btnBreakfast.x - (30 + btnBreakfast.width/2) , btnBreakfast.y);
		
		Utils.moveToPosition(btnLunch,(btnBreakfast.x),(btnBreakfast.y + btnBreakfast.height + yGap));
		Utils.moveToPosition(btnToggleLunch, btnLunch.x - (30 + btnLunch.width/2) , btnLunch.y);

		Utils.moveToPosition(btnSnacks,(btnLunch.x),(btnLunch.y + btnLunch.height + yGap));
		Utils.moveToPosition(btnToggleSnacks, btnSnacks.x - (30 + btnSnacks.width/2) , btnSnacks.y);

		Utils.moveToPosition(btnDinner,(btnSnacks.x),(btnSnacks.y + btnSnacks.height + yGap));
		Utils.moveToPosition(btnToggleDinner, btnDinner.x - (30 + btnDinner.width/2) , btnDinner.y);
		
		Utils.moveToPosition(popupClipYay, screenCenter.x, screenCenter.y - 50);
		//
		btnBreakfast.addEventListener(MouseEvent.CLICK,onBreakfast);
		btnLunch.addEventListener(MouseEvent.CLICK,onLaunch);
		btnSnacks.addEventListener(MouseEvent.CLICK,onSnacks);
		btnDinner.addEventListener(MouseEvent.CLICK,onDinner);
		popupClipYay.addEventListener(MouseEvent.CLICK, onYayClick);
		//
		this.addEventListener(MouseEvent.CLICK, onClickAnywhere);
	}
	private function onClickAnywhere(e:MouseEvent):Void{
		//removeChild(popupClipYay);
	}
	private function onBreakfast(e:MouseEvent):Void{
		trace('onBreakfast');
		//Utils.toggleClipWithFrames(btnToggleBreakfast,1,2);
		btnToggleBreakfast.toggleState();
		addChild(popupClipYay);
	}
	private function onLaunch(e:MouseEvent):Void{
		trace('onLaunch');
		//Utils.toggleClipWithFrames(btnToggleLunch,1,2);
		btnToggleLunch.toggleState();
		addChild(popupClipYay);
	}
	private function onSnacks(e:MouseEvent):Void{
		trace('onSnacks');
		//Utils.toggleClipWithFrames(btnToggleSnacks,1,2);
		btnToggleSnacks.toggleState();
		addChild(popupClipYay);
	}
	private function onDinner(e:MouseEvent):Void{
		trace('onDinner');
		//Utils.toggleClipWithFrames(btnToggleDinner,1,2);
		btnToggleDinner.toggleState();
		addChild(popupClipYay);
	}
	private function onYayClick(e:MouseEvent):Void{
		removeChild(popupClipYay);
	}


}