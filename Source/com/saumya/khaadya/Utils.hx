//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.geom.Point;


class Utils {
	public function new() {
		// Nothing
	}
	public static function moveToPosition(spriteToMove:Sprite,newX:Float,newY:Float):Sprite
	{
		spriteToMove.x = newX;
		spriteToMove.y = newY;
		return spriteToMove;
	}
	public static function toggleClipWithFrames(_mc:MovieClip,frameOne:Int,frameTwo:Int):Void{
		if(_mc.currentFrame==frameOne){
			_mc.gotoAndStop(frameTwo);
		}else{
			_mc.gotoAndStop(frameOne);
		}
	}
}