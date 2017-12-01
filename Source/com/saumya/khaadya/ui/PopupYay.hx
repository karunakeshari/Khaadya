//
package com.saumya.khaadya.ui;

import openfl.display.Sprite;


class PopupYay extends Sprite {

	public function new() {
		super();
		initialize();
	}
	private function initialize():Void{
		construct();
	}
	private function construct():Void{
		var yayClip:Sprite = new ImgYay();// from SWF library
		this.addChild(yayClip);
	}
}