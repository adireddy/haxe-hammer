package hammer;

typedef HammerCSSProps = {
	/**
	 * Disables text selection to improve the dragging gesture. Mainly for desktop browsers.
	 * @type {String}
	 * @default 'none'
	 */
	@:optional var userSelect:String;

	/**
	 * Disable the Windows Phone grippers when pressing an element.
	 * @type {String}
	 * @default 'none'
	 */
	@:optional var touchSelect:String;

	/**
	 * Disables the default callout shown when you touch and hold a touch target.
	 * On iOS, when you touch and hold a touch target such as a link, Safari displays
	 * a callout containing information about the link. This property allows you to disable that callout.
	 * @type {String}
	 * @default 'none'
	 */
	@:optional var touchCallout:String;

	/**
	 * Specifies whether zooming is enabled. Used by IE10>
	 * @type {String}
	 * @default 'none'
	 */
	@:optional var contentZooming:String;

	/**
	 * Specifies that an entire element should be draggable instead of its contents. Mainly for desktop browsers.
	 * @type {String}
	 * @default 'none'
	 */
	@:optional var userDrag:String;

	/**
	 * Overrides the highlight color shown when the user taps a link or a JavaScript
	 * clickable element in iOS. This property obeys the alpha value, if specified.
	 * @type {String}
	 * @default 'rgba(0,0,0,0)'
	 */
	@:optional var tapHighlightColor:String;
}