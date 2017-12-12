//
package com.saumya.khaadya.ui;

import openfl.display.Sprite;
import openfl.display.Graphics;


class PopupYay extends Sprite {

	public function new() {
		super();
		initialize();
	}
	private function initialize():Void{
		construct();
	}
	private function construct():Void{
		// transparent BG
		var bg: Graphics = this.graphics;
		bg.beginFill(0xFF0000,0.6);
		bg.drawRect(-200,-200,400,400);
		bg.endFill();
		//
		var yayClip:Sprite = new ImgYay();// from SWF library
		this.addChild(yayClip);
	}
}