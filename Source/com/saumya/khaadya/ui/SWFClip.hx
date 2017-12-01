//
package com.saumya.khaadya.ui;

import openfl.display.MovieClip;
import openfl.display.Sprite;

import com.saumya.khaadya.Utils;

class SWFClip extends Sprite  {

	private var flashClip:MovieClip;

	public function new(_flashClip:MovieClip) {
		super();
		flashClip = _flashClip;
		flashClip.stop();
		addChild(flashClip);
	}

	// TODO: take it to another class
	public function toggleState():Void{
		Utils.toggleClipWithFrames(flashClip,1,2);
	}

}