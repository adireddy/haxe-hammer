package hammer.recognizers;

@:native("Hammer.Tap")
extern class Tap extends AttrRecognizer {
    function failTimeout():Int;
}