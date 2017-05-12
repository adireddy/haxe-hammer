package hammer.touchaction;

@:native("Hammer.TouchAction")
extern class TouchAction {

	/**
	* Touch Action
	* sets the touchAction property or uses the js alternative
	* @param {Manager} manager
	* @param {String} value
	* @constructor
	*/
	function new(manager:Manager, value:String);

	/**
	* set the touchAction value on the element or enable the polyfill
	* @param {String} value
	*/
	function set(value:String):Void;

	/**
	* just re-set the touchAction value
	*/
	function update():Void;

	/**
	* @private
	* compute the value for the touchAction property based on the recognizer's settings
	* @returns {String} value
	*/
	function compute():String;

	/**
	* this method is called on each input cycle and provides the preventing of the browser behavior
	* @param {Object} input
	*/
	function preventDefaults(input:Dynamic):Void;

	/**
	* call preventDefault to prevent the browser's default behavior (scrolling in most cases)
	* @param {Object} srcEvent
	*/
	function preventSrc(srcEvent:Dynamic):Void;
}