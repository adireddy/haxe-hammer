package hammer.recognizers;

@:native("Hammer.Pan")
extern class Pan extends AttrRecognizer {

	var pX:Float;
	var pY:Float;

	function directionTest(input:Dynamic):Bool;
}