package hammer.recognizers;

@:native("Hammer.AttrRecognizer")
extern class AttrRecognizer extends Recognizer {

	/**
	* Used to check if it the recognizer receives valid input, like input.distance > 10.
	* @memberof AttrRecognizer
	* @param {Object} input
	* @returns {Bool} recognized
	*/
	function attrTest(input:Dynamic):Bool;
}