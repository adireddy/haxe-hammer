package hammer.input;

@:native("Hammer.TouchMouseInput")
extern class TouchMouseInput extends Input {

	var touch:TouchInput;
	var mouse:MouseInput;
	var primaryTouch:Dynamic;
	var lastTouches:Array<Dynamic>;
}