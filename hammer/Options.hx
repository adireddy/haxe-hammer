package hammer;

import hammer.recognizers.Press;
import hammer.recognizers.Tap;
import hammer.recognizers.Pan;
import hammer.recognizers.Swipe;
import hammer.recognizers.Pinch;
import hammer.recognizers.Rotate;

@:publicFields
class Options {

	// magical touchAction value
	public var TOUCH_ACTION_COMPUTE:String = "compute";
	public var TOUCH_ACTION_AUTO:String = "auto";
	public var TOUCH_ACTION_MANIPULATION:String = "manipulation"; // not implemented
	public var TOUCH_ACTION_NONE:String = "none";
	public var TOUCH_ACTION_PAN_X:String = "pan-x";
	public var TOUCH_ACTION_PAN_Y:String = "pan-y";

	/**
	 * set if DOM events are being triggered.
	 * But this is slower and unused by simple implementations, so disabled by default.
	 * @type {Boolean}
	 * @default false
	 */
	public var domEvents:Bool = false;

	/**
	 * The value for the touchAction property/fallback.
	 * When set to `compute` it will magically set the correct value based on the added recognizers.
	 * @type {String}
	 * @default compute
	 */
	public var touchAction:String;

	/**
	 * @type {Boolean}
	 * @default true
	 */
	public var enable:Bool = true;

	/**
	 * EXPERIMENTAL FEATURE -- can be removed/changed
	 * Change the parent input target element.
	 * If Null, then it is being set the to main element.
	 * @type {Null|EventTarget}
	 * @default null
	 */
	public var inputTarget:Dynamic = null;

	/**
	 * force an input class
	 * @type {Null|Function}
	 * @default null
	 */
	public var inputClass:Dynamic = null;

	/**
	 * Default recognizer setup when calling `Hammer()`
	 * When creating a new Manager these will be skipped.
	 * @type {Array}
	 */
	public var preset:Array<Dynamic> = [
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
	public var cssProps:Dynamic = {
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

	function new() {
		touchAction = TOUCH_ACTION_COMPUTE;
	}

}