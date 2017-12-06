//
package com.saumya.khaadya.ui;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import openfl.Assets;


class HUDWeather extends Sprite {

	private var tfDefault:TextFormat; // DefaultTextFormat
	
	private var tTemperature:TextField;
	private var tSun:TextField;
	private var tPressure:TextField;
	private var tDescription:TextField;
	private var tCity:TextField;

	public function new() {
		super();
		initialize();
	}
	private function initialize():Void
	{
		construct();
	}
	private function construct():Void
	{
		var font = Assets.getFont ("fonts/Komika_Parch.ttf");
		
		tfDefault = new TextFormat (font.fontName, 20, 0x000000);
		tfDefault.align = TextFormatAlign.LEFT;
		//
		tTemperature = getTextField();
		tSun = getTextField();
		tPressure = getTextField();
		tDescription = getTextField();
		tCity = getTextField();


		this.moveTo(tTemperature,0,30);
		this.moveTo(tSun,0,15);
		this.moveTo(tPressure,0,45);
		this.moveTo(tDescription,0,60);
		moveTo(tCity,0,0);

		this.addChild(tTemperature);
		this.addChild(tSun);
		this.addChild(tPressure);
		this.addChild(tDescription);
		addChild(tCity);
	}
	//pulic API
	public function setTemparature ( tempNow:Float, minTemp:Float, maxTemp:Float ) : Void
	{
		tTemperature.text = 'temperature-'+tempNow+'ºC'+' | Min-'+minTemp+'ºC | Max-'+maxTemp+'ºC';
	}
	public function setSunTime( sunRise:Float, sunSet:Float ):Void
	{
		var dRise:Date = Date.fromTime(sunRise);
		var dSet:Date = Date.fromTime(sunSet);
		var sRise = dRise.getHours()+':'+dRise.getMinutes()+':'+dRise.getSeconds()+' AM';
		var sSet = (dSet.getHours() - 12)+':'+dSet.getMinutes()+':'+dSet.getSeconds()+' PM';
		tSun.text = 'Sunrise - '+sRise+' | Sunset - '+sSet;
	}
	public function setPressure( iPressure:Int, iHumidity:Int ):Void
	{
		tPressure.text = 'Pressure - '+iPressure+'hPa | Humidity - '+iHumidity+'%';
	}
	public function setDescription(sMessageMain:String, sMessageDescription:String):Void
	{
		tDescription.text = 'Weather type - '+sMessageMain+' | '+sMessageDescription;
	}
	public function setCity(cityName:String, countryName:String):Void
	{
		tCity.text = 'City - '+cityName+', '+countryName;
	}
	// Utility methods
	private function moveTo(dObj:DisplayObject, newX:Float, newY:Float):Void
	{
		dObj.x = newX;
		dObj.y = newY;
	}
	private function getTextField():TextField
	{
		var t:TextField = new TextField();
		t.width = 320;
		t.selectable = false;
		//t.defaultTextFormat = tfDefault;
		//t.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		t.embedFonts = true;
		//
		return t;
	}
}