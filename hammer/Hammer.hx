package hammer;

import js.html.Point;
import hammer.recognizers.Press;
import hammer.recognizers.Tap;
import hammer.recognizers.Pan;
import hammer.recognizers.Swipe;
import hammer.recognizers.Pinch;
import hammer.recognizers.Rotate;
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

    static var defaults:HammerDefaults;
}

class HammerDefaults {

    // magical touchAction value
    static inline var TOUCH_ACTION_COMPUTE = "compute";
    static inline var TOUCH_ACTION_AUTO = "auto";
    static inline var TOUCH_ACTION_MANIPULATION = "manipulation"; // not implemented
    static inline var TOUCH_ACTION_NONE = "none";
    static inline var TOUCH_ACTION_PAN_X = "pan-x";
    static inline var TOUCH_ACTION_PAN_Y = "pan-y";

    /**
     * set if DOM events are being triggered.
     * But this is slower and unused by simple implementations, so disabled by default.
     * @type {Boolean}
     * @default false
     */
    static var domEvents:Bool = false;

    /**
     * The value for the touchAction property/fallback.
     * When set to `compute` it will magically set the correct value based on the added recognizers.
     * @type {String}
     * @default compute
     */
    static var touchAction:String = TOUCH_ACTION_COMPUTE;

    /**
     * @type {Boolean}
     * @default true
     */
    static var enable:Bool = true;

    /**
     * EXPERIMENTAL FEATURE -- can be removed/changed
     * Change the parent input target element.
     * If Null, then it is being set the to main element.
     * @type {Null|EventTarget}
     * @default null
     */
    static var inputTarget:Dynamic = null;

    /**
     * force an input class
     * @type {Null|Function}
     * @default null
     */
    static var inputClass:Dynamic = null;

    /**
     * Default recognizer setup when calling `Hammer()`
     * When creating a new Manager these will be skipped.
     * @type {Array}
     */
    static var preset:Array<Dynamic> = [
        // RecognizerClass, options, [recognizeWith, ...], [requireFailure, ...]
        [Rotate, {enable: false}],
        [Pinch, {enable: false}, ["rotate"]],
        [Swipe, {direction: Hammer.DIRECTION_HORIZONTAL}],
        [Pan, {direction: Hammer.DIRECTION_HORIZONTAL}, ["swipe"]],
        [Tap],
        [Tap, {event: "doubletap", taps: 2}, ["tap"]],
        [Press]
    ];

    /**
     * Some CSS properties can be used to improve the working of Hammer.
     * Add them to this method and they will be set when creating a new Manager.
     * @namespace
     */
    static var cssProps:Dynamic = {
        /**
         * Disables text selection to improve the dragging gesture. Mainly for desktop browsers.
         * @type {String}
         * @default 'none'
         */
        userSelect: 'none',

        /**
         * Disable the Windows Phone grippers when pressing an element.
         * @type {String}
         * @default 'none'
         */
        touchSelect: 'none',

        /**
         * Disables the default callout shown when you touch and hold a touch target.
         * On iOS, when you touch and hold a touch target such as a link, Safari displays
         * a callout containing information about the link. This property allows you to disable that callout.
         * @type {String}
         * @default 'none'
         */
        touchCallout: 'none',

        /**
         * Specifies whether zooming is enabled. Used by IE10>
         * @type {String}
         * @default 'none'
         */
        contentZooming: 'none',

        /**
         * Specifies that an entire element should be draggable instead of its contents. Mainly for desktop browsers.
         * @type {String}
         * @default 'none'
         */
        userDrag: 'none',

        /**
         * Overrides the highlight color shown when the user taps a link or a JavaScript
         * clickable element in iOS. This property obeys the alpha value, if specified.
         * @type {String}
         * @default 'rgba(0,0,0,0)'
         */
        tapHighlightColor: 'rgba(0,0,0,0)'
    };
}

typedef GestureInteractionData = {
	var type:String;					//Name of the event. Like panstart.
	var deltaX:Float;					//Movement of the X axis.
	var deltaY:Float;					//Movement of the Y axis.
	var deltaTime:Float;				//Total time in ms since the first input.
	var distance:Float;					//Distance moved.
	var angle:Float;					//Angle moved.
	var velocityX:Float;				//Velocity on the X axis, in px/ms.
	var velocityY:Float;				//Velocity on the Y axis, in px/ms
	var velocity:Float;					//Highest velocityX/Y value.
	var direction:Int;					//Direction moved. Matches the DIRECTION constants.
	var offsetDirection:Int;			//Direction moved from it's starting point. Matches the DIRECTION constants.
	var scale:Float;					//Scaling that has been done when multi-touch. 1 on a single touch.
	var rotation:Float;					//Rotation that has been done when multi-touch. 0 on a single touch.
	var center:Point;					//Center position for multi-touch, or just the single pointer.
	var srcEvent:Dynamic;				//Source event object, type TouchEvent, MouseEvent or PointerEvent.
	var target:Dynamic;					//Target that received the event.
	var pointerType:String;					//Primary pointer type, could be touch, mouse, pen or kinect.
	var eventType:Int;					//Event type, matches the INPUT constants.
	var isFirst:Bool; 					//when the first input.
	var isFinal:Bool; 					//when the final (last) input.
	var pointers:Dynamic;				//Array with all pointers, including the ended pointers (touchend, mouseup).
	var changedPointers:Dynamic;		//Array with all new/moved/lost pointers.
	var preventDefault:Void -> Void;	//Reference to the srcEvent.preventDefault() method. Only for experts!
}