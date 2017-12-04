//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.geom.Point;

import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.net.URLVariables;
import openfl.net.URLRequestMethod;
import openfl.net.URLLoaderDataFormat;

import openfl.events.Event;
import openfl.events.ErrorEvent;
import openfl.errors.IOError;
import openfl.events.IOErrorEvent;



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

	public static function getWeather():Void{
		trace('Utils : getWeather : ');
		var urlWeather:String = "http://api.openweathermap.org/data/2.5/weather";
		var uVar:URLVariables = new URLVariables();
		uVar.appid = 'myAppid';
		uVar.q = 'Bhubaneshwar';
		uVar.units = 'metric';
		
		var uRequest:URLRequest = new URLRequest(urlWeather);
		uRequest.method = URLRequestMethod.GET;
		uRequest.data = uVar;
		
		var uLoader:URLLoader = new URLLoader();
		//urlLoader.dataFormat = URLLoaderDataFormat.VARIABLES;

		uLoader.addEventListener(Event.COMPLETE, Utils.onCompleteWeather);
		uLoader.addEventListener(ErrorEvent.ERROR, Utils.onErrorWeather);
		uLoader.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorWeather);
		
		uLoader.load(uRequest);
	}
	private static function onCompleteWeather(e:Event):Void{
		trace('Utils : onCompleteWeather : ');
		//trace(e.target);
		var uLoader:URLLoader = cast(e.target,URLLoader);
		trace(uLoader.data);
	}
	private static function onErrorWeather(e:ErrorEvent):Void{
		trace('Utils : onErrorWeather :');
		trace(e.toString());
	}
	private static function onIOErrorWeather(e:IOErrorEvent):Void{
		trace('Utils : onIOErrorWeather :');
		trace(e.toString());
	}
}