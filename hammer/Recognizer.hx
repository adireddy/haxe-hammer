package hammer;

@:native("Recognizer")
extern class Recognizer {

    /**
     * @virtual
     * @type {Object}
     */
    var defaults:Dynamic;

    /**
     * Recognizer
     * Every recognizer needs to extend from this class.
     * @constructor
     * @param {Object} options
     */
    function new(?options:Dynamic);


    /**
     * set options
     * @param {Object} options
     * @return {Recognizer}
     */
    function set(options:Dynamic):Recognizer;

    /**
     * recognize simultaneous with an other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    function recognizeWith(otherRecognizer:Recognizer):Recognizer;

    /**
     * drop the simultaneous link. it doesnt remove the link on the other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    function dropRecognizeWith(otherRecognizer:Recognizer):Recognizer;

    /**
     * recognizer can only run when an other is failing
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    function requireFailure(otherRecognizer:Recognizer):Recognizer;

    /**
     * drop the requireFailure link. it does not remove the link on the other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    function dropRequireFailure(otherRecognizer:Recognizer):Recognizer;

    /**
     * has require failures boolean
     * @returns {boolean}
     */
    function hasRequireFailures():Bool;

    /**
     * if the recognizer can recognize simultaneous with an other recognizer
     * @param {Recognizer} otherRecognizer
     * @returns {Boolean}
     */
    function canRecognizeWith(otherRecognizer:Recognizer):Bool;

    /**
     * You should use `tryEmit` instead of `emit` directly to check
     * that all the needed recognizers has failed before emitting.
     * @param {Object} input
     */
    function emit(input:Dynamic):Void;

    /**
     * Check that all the require failure recognizers has failed,
     * if true, it emits a gesture event,
     * otherwise, setup the state to FAILED.
     * @param {Object} input
     */
    function tryEmit(input:Dynamic):Void;

    /**
     * can we emit?
     * @returns {boolean}
     */
    function canEmit():Bool;

    /**
     * update the recognizer
     * @param {Object} inputData
     */
    function recognize(inputData:Dynamic):Void;

    /**
     * return the state of the recognizer
     * the actual recognizing happens in this method
     * @virtual
     * @param {Object} inputData
     * @returns {Const} STATE
     */
    function process(inputData:Dynamic):Int;

    /**
     * return the preferred touch-action
     * @virtual
     * @returns {Array}
     */
    function getTouchAction():Array<Dynamic>;

    /**
     * called when the gesture isn't allowed to recognize
     * like when another is being recognized or it is disabled
     * @virtual
     */
    function reset():Void;
}
