An OpenFL Game
==============

Uses [SWF assets][1], here is [another nice read][2] about runtime SWF asset loading.

#### Loading SWF assets

Update `project.xml` with

```
<library path="Assets/swf/khaadya_1.swf" id="id_khaadya_1" preload="true" generate="true" />
```

Load the `SWF` programmatically as

```
	var future = Assets.loadLibrary("id_khaadya_1");
	future.onComplete(function(_){ trace('Main : Loaded! : SWF'); this.construct(); });
	future.onError(function(_){ trace('Main : Error: Loading Asset : SWF'); });
```







[1]: http://www.openfl.org/learn/tutorials/using-swf-assets/
[2]: http://www.openfl.org/blog/2017/03/15/runtime-swf-support-in-openfl-4.9/