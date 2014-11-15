package hammer;

import js.html.CanvasElement;
import js.html.HtmlElement;

@:native("Hammer")
extern class Hammer extends Manager {

    /**
     * Simple way to create an manager with a default set of recognizers.
     * @param {HTMLElement} element
     * @param {Object} [options]
     * @constructor
     */
    @:overload(function(element:HtmlElement, ?options:Dynamic):Void{})
    @:overload(function(element:Dynamic, ?options:Dynamic):Void{})
    function new(element:CanvasElement, ?options:Dynamic);

    static var DIRECTION_NONE:Int;
    static var DIRECTION_LEFT:Int;
    static var DIRECTION_RIGHT:Int;
    static var DIRECTION_UP:Int;
    static var DIRECTION_DOWN:Int;
    static var DIRECTION_HORIZONTAL:Int;
    static var DIRECTION_VERTICAL:Int;
    static var DIRECTION_ALL:Int;
}