package hammer.input;

import js.html.HtmlElement;

@:native("Hammer.Input")
extern class Input {

	function new(manager:Manager, callback:Dynamic);

	var manager:Manager;
	var callback:Dynamic;
	var element:HtmlElement;
	var target:Dynamic;
	var domHandler:Dynamic;

	/**
	* handle mouse events
	* @param {Object} ev
	*/
	@:overload(function(manager:Dynamic, inputEvent:Dynamic, inputData:Dynamic):Void {})
	function handler(ev:Dynamic):Void;

	function destroy():Void;
}