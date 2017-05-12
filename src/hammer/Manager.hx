package hammer;

import haxe.macro.Expr;
import js.html.HtmlElement;

@:native("Hammer.Manager")
extern class Manager {

    /**
     * Manager
     * @param {HTMLElement} element
     * @param {Object} [HammerOptions]
     * @constructor
     */
    function new(element:HtmlElement, ?options:HammerOptions);

	var handlers:Dynamic;
	var session:Dynamic;
	var recognizers:Dynamic;
	var oldCssProps:Dynamic;
	var element:HtmlElement;
	var input:Dynamic;
	var touchAction:Dynamic;

    /**
     * set options
     * @param {Object} options
     * @returns {Manager}
     */
    function set(options:Dynamic):Manager;

    /**
     * stop recognizing for this session.
     * This session will be discarded, when a new [input]start event is fired.
     * When forced, the recognizer cycle is stopped immediately.
     * @param {Bool} [force]
     */
    function stop(force:Bool):Void;

    /**
     * run the recognizers!
     * called by the inputHandler function on every movement of the pointers (touches)
     * it walks through all the recognizers and tries to detect the gesture that is being made
     * @param {Object} inputData
     */
    function recognize(inputData:Dynamic):Void;

    /**
     * get a recognizer by its event name.
     * @param {Recognizer|String} recognizer
     * @returns {Recognizer|Null}
     */
    function get(recognizer:Dynamic):Dynamic;

    /**
     * add a recognizer to the manager
     * existing recognizers with the same event name will be removed
     * @param {Recognizer} recognizer
     * @returns {Recognizer|Manager}
     */
    function add(recognizer:Dynamic):Dynamic;

    /**
     * remove a recognizer by name or instance
     * @param {Recognizer|String} recognizer
     * @returns {Manager}
     */
    function remove(recognizer:Dynamic):Manager;

    /**
     * bind event
     * @param {String} events
     * @param {Function} handler
     * @returns {EventEmitter} this
     */
	function addEventListeners(event:String, handler:Dynamic):Manager;
    function on(event:String, handler:Dynamic):Manager;

    /**
     * unbind event, leave emit blank to remove all handlers
     * @param {String} events
     * @param {Function} [handler]
     * @returns {EventEmitter} this
     */
	function removeEventListeners(event:String, handler:Dynamic):Manager;
    function off(event:String, handler:Dynamic):Manager;

    /**
     * emit event to the listeners
     * @param {String} event
     * @param {Object} data
     */
    function emit(event:String, handler:Dynamic):Void;

    /**
     * destroy the manager and unbinds all events
     * it doesn't unbind dom events, that is the user own responsibility
     */
    function destroy():Void;

	/**
	* walk objects and arrays
	* @param {Object} obj
	* @param {Function} iterator
	* @param {Object} context
	*/
	function each(obj:Dynamic, iterator:Dynamic, context:Dynamic):Void;

	/**
	* merge the values from src in the dest.
	* means that properties that exist in dest will not be overwritten by src
	* @param {Object} dest
	* @param {Object} src
	* @returns {Object} dest
	*/
	function merge(dest:Dynamic, src:Dynamic):Dynamic;

	/**
	* extend object.
	* means that properties in dest will be overwritten by the ones in src.
	* @param {Object} dest
	* @param {Object} src
	* @param {Bool} [merge=false]
	* @returns {Object} dest
	*/
	function extend(dest:Dynamic, src:Dynamic, ?merge:Bool):Dynamic;

	/**
	* extend object.
	* means that properties in dest will be overwritten by the ones in src.
	* @param {Object} target
	* @param {...Object} objects_to_assign
	* @returns {Object} target
	*/
	function assign(target:Dynamic, extra:Array<Expr>):Dynamic;

	/**
	* simple class inheritance
	* @param {Function} child
	* @param {Function} base
	* @param {Object} [properties]
	*/
	function inherit(child:Dynamic, base:Dynamic, ?properties:Dynamic):Void;

	/**
	* simple function bind
	* @param {Function} fn
	* @param {Object} context
	* @returns {Function}
	*/
	function bindFn(fn:Dynamic, context:Dynamic):Dynamic;

	/**
	* get the prefixed property
	* @param {Object} obj
	* @param {String} property
	* @returns {String|Undefined} prefixed
	*/
	function prefixed(obj:Dynamic, property:String):String;

	/**
	* convert array-like objects to real arrays
	* @param {Object} obj
	* @returns {Array}
	*/
	function toArray(obj:Dynamic):Array<Dynamic>;

	/**
	* find if a array contains the object using indexOf or a simple polyFill
	* @param {Array} src
	* @param {String} find
	* @param {String} [findByKey]
	* @return {Bool|Number} false when not found, or the index
	*/
	function inArray(src:Array<Dynamic>, find:String, ?findByKey:String):Dynamic;

	/**
	* unique array with objects based on a key (like 'id') or just by the array's value
	* @param {Array} src [{id:1},{id:2},{id:1}]
	* @param {String} [key]
	* @param {Bool} [sort=False]
	* @returns {Array} [{id:1},{id:2}]
	*/
	function uniqueArray(src:Array<Dynamic>, ?key:String, ?sort:Bool):Array<Dynamic>;

	/**
	* split string on whitespace
	* @param {String} str
	* @returns {Array} words
	*/
	function splitStr(str:String):Array<String>;

	/**
	* let a boolean value also be a function that must return a boolean
	* this first item in args will be used as the context
	* @param {Bool|Function} val
	* @param {Array} [args]
	* @returns {Bool}
	*/
	function boolOrFn(val:Dynamic, ?args:Array<Dynamic>):Bool;

	/**
	* find if a node is in the given parent
	* @method hasParent
	* @param {HTMLElement} node
	* @param {HTMLElement} parent
	* @return {Bool} found
	*/
	function hasParent(node:HtmlElement, parent:HtmlElement):Bool;
}