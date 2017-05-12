package hammer;

import hammer.recognizers.AttrRecognizer;
import hammer.recognizers.Tap;
import hammer.recognizers.Rotate;
import hammer.input.Input;
import hammer.input.TouchInput;
import hammer.input.PointerEventInput;
import hammer.input.SingleTouchInput;
import hammer.input.MouseInput;
import hammer.input.TouchMouseInput;
import hammer.touchaction.TouchAction;

import js.html.CanvasElement;
import js.html.HtmlElement;

@:native("Hammer")
extern class Hammer extends Manager {

	/**
	 * @private
	 * Simple way to create a manager with a default set of recognizers.
	 * @param {HTMLElement} element
	 * @param {Object} [options]
	 * @constructor
	 */
    @:overload(function(element:HtmlElement, ?options:HammerOptions):Void{})
    @:overload(function(element:Dynamic, ?options:HammerOptions):Void{})
    function new(element:CanvasElement, ?options:HammerOptions);

    static var DIRECTION_NONE:Int;
    static var DIRECTION_LEFT:Int;
    static var DIRECTION_RIGHT:Int;
    static var DIRECTION_UP:Int;
    static var DIRECTION_DOWN:Int;
    static var DIRECTION_HORIZONTAL:Int;
    static var DIRECTION_VERTICAL:Int;
    static var DIRECTION_ALL:Int;

    static var INPUT_START:Int;
    static var INPUT_MOVE:Int;
    static var INPUT_END:Int;
    static var INPUT_CANCEL:Int;

    static var STATE_POSSIBLE:Int;
    static var STATE_BEGAN:Int;
    static var STATE_CHANGED:Int;
    static var STATE_ENDED:Int;
    static var STATE_RECOGNIZED:Int;
    static var STATE_CANCELLED:Int;
    static var STATE_FAILED:Int;

    static var VERSION:String;

    static var defaults:HammerOptions;
}
