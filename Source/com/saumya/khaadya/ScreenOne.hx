//
package com.saumya.khaadya;

import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import openfl.Assets;

import com.saumya.khaadya.ui.HUDWeather;
import com.saumya.khaadya.Utils;


class ScreenOne extends Sprite {

	public static var TO_SCREEN_2_EVENT:String = "toScreen2Event";
	
	private var screenWidth:Float;
	private var screenHeight:Float;
	private var screenCenter:Point;
	//
	//private var tTemperature:TextField;
	private var hudWeather:HUDWeather;

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
		Utils.eDispatcher.addEventListener(Utils.WEATHER_DATA_EVENT,onGotWeatherData);
		//
		/*
		var font = Assets.getFont ("fonts/Komika_Parch.ttf");
		var defaultFormat = new TextFormat (font.fontName, 20, 0x000000);
		defaultFormat.align = TextFormatAlign.LEFT;

		tTemperature = new TextField();
		
		tTemperature.x = 2;
		tTemperature.y = 2;
		tTemperature.width = 320;
		tTemperature.selectable = false;
		//tTemperature.defaultTextFormat = defaultFormat;
		
		//tTemperature.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		
		tTemperature.embedFonts = true;
		addChild (tTemperature);
		tTemperature.text = "!";
		*/
		this.hudWeather = new HUDWeather();
		addChild(hudWeather);
		//
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
		//trace('onMoveNext');
		/*
		var evt:Event = new Event(ScreenOne.TO_SCREEN_2_EVENT);
		this.dispatchEvent(evt);
		*/
		getWeather();
	}

	private function getWeather():Void{
		Utils.getWeather();
	}

	private function onGotWeatherData(e:Event):Void
	{
		trace('ScreenOne : onGotWeatherData : ');
		var weatherData = Utils.weatherData;
		trace(Utils.weatherData);
		//
		var temp = Utils.weatherData.main.temp;
		var temp_min = Utils.weatherData.main.temp_min;
		var temp_max = Utils.weatherData.main.temp_max;
		//
		hudWeather.setTemparature(temp,temp_min,temp_max);
		hudWeather.setSunTime( Utils.weatherData.sys.sunrise * 1000, Utils.weatherData.sys.sunset * 1000 );
		hudWeather.setPressure( Utils.weatherData.main.pressure, Utils.weatherData.main.humidity );
		
		var weather = Utils.weatherData.weather[0];
		hudWeather.setDescription(weather.main, weather.description);

		//var country = Utils.weatherData.sys.country
		hudWeather.setCity( Utils.weatherData.name, Utils.weatherData.sys.country );

		//
		//var time_sunrise = Utils.weatherData.sys.sunrise * 1000;
		//var time_sunset = Utils.weatherData.sys.sunset * 1000;

		//tTemperature.text = 'temperature-'+temp+'ºC'+' | Min-'+temp_min+'ºC | Max-'+temp_max+'ºC';


		//trace(temp_min+' : '+temp+' : '+temp_max);
	}


}