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
import openfl.events.EventDispatcher;

//import haxe.format.JsonParser;
import haxe.Json;

import com.saumya.configs.APIConfigs;



class Utils {
	
	public static var WEATHER_DATA_EVENT:String = "gotWeatherDataEvent";
	public static var weatherData:Dynamic = {};
	//
	public static var eDispatcher:EventDispatcher = new EventDispatcher();

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
		var urlWeather:String = APIConfigs.WEATHER_API_URI;
		var uVar:URLVariables = new URLVariables();
		uVar.appid = APIConfigs.WEATHER_APP_ID;
		uVar.q = 'Bhubaneshwar';
		uVar.units = 'metric';
		
		var uRequest:URLRequest = new URLRequest(urlWeather);
		uRequest.method = URLRequestMethod.GET;
		uRequest.data = uVar;
		
		var uLoader:URLLoader = new URLLoader();
		uLoader.dataFormat = URLLoaderDataFormat.VARIABLES;

		uLoader.addEventListener(Event.COMPLETE, Utils.onCompleteWeather);
		uLoader.addEventListener(ErrorEvent.ERROR, Utils.onErrorWeather);
		uLoader.addEventListener(IOErrorEvent.IO_ERROR,onIOErrorWeather);
		
		uLoader.load(uRequest);
	}
	private static function onCompleteWeather(e:Event):Void{
		trace('Utils : onCompleteWeather : ');
		
		var uLoader:URLLoader = cast(e.target,URLLoader);
		var result = uLoader.data;
		var rJson = Json.parse(result);
		//trace(rJson);
		//trace('============');
		//trace('Temparature='+rJson.main.temp);
		Utils.weatherData = rJson;
		var evt:Event = new Event(Utils.WEATHER_DATA_EVENT,false);
		Utils.eDispatcher.dispatchEvent(evt);
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