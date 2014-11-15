package hammer;

import js.html.HtmlElement;

@:native("Manager")
extern class Manager {

    /**
     * Manager
     * @param {HTMLElement} element
     * @param {Object} [options]
     * @constructor
     */
    function new(element:HtmlElement, ?options:Dynamic);

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
     * @param {Boolean} [force]
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
    function on(event:String, handler:Dynamic):Dynamic;

    /**
     * unbind event, leave emit blank to remove all handlers
     * @param {String} events
     * @param {Function} [handler]
     * @returns {EventEmitter} this
     */
    function off(event:String, handler:Dynamic):Dynamic;

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
}