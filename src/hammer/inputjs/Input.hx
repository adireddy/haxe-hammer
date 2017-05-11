package hammer.inputjs;

import js.html.HtmlElement;

@:native("Hammer.Input")
extern class Input {

	function new(manager:Manager, callback:Dynamic);

	var manager:Manager;
	var callback:Dynamic;
	var element:HtmlElement;
	var target:Dynamic;
	var domHandler:Dynamic;

	function destroy():Void;
}