package hammer;

typedef HammerOptions = {
	/**
	 * set if DOM events are being triggered.
	 * But this is slower and unused by simple implementations, so disabled by default.
	 * @type {Boolean}
	 * @default false
	 */
	@:optional var domEvents:Bool;

	/**
	 * The value for the touchAction property/fallback.
	 * When set to `compute` it will magically set the correct value based on the added recognizers.
	 * @type {String}
	 * @default compute
	 */
	@:optional var touchAction:String;

	/**
	 * @type {Boolean}
	 * @default true
	 */
	@:optional var enable:Bool;

	/**
	 * EXPERIMENTAL FEATURE -- can be removed/changed
	 * Change the parent input target element.
	 * If Null, then it is being set the to main element.
	 * @type {Null|EventTarget}
	 * @default null
	 */
	@:optional var inputTarget:Dynamic;

	/**
	 * force an input class
	 * @type {Null|Function}
	 * @default null
	 */
	@:optional var inputClass:Dynamic;

	/**
	 * Default recognizer setup when calling `Hammer()`
	 * When creating a new Manager these will be skipped.
	 * @type {Array}
	 */
	@:optional var preset:Array<Dynamic>;

	/**
	 * Some CSS properties can be used to improve the working of Hammer.
	 * Add them to this method and they will be set when creating a new Manager.
	 * @namespace
	 */
	@:optional var cssProps:HammerCSSProps;
}