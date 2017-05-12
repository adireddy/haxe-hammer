import hammer.GestureInteractionData;
import hammer.Hammer;
import hammer.Manager;
import hammer.recognizers.Pan;
import hammer.recognizers.Pinch;
import hammer.recognizers.Rotate;
import hammer.recognizers.Tap;
import js.Browser;
import js.html.HtmlElement;

class Main {

	public function new() {
		var el:HtmlElement = cast Browser.document.getElementById("myElement");

		var mc = new Hammer(el);

		mc.on("panleft panright tap press", function(ev:GestureInteractionData) {
			el.textContent = ev.type + " gesture detected.";
		});

		var stage:HtmlElement = cast Browser.document.getElementById("stage");
		var manager:Manager = new Manager(stage);

		var pan = new Pan();
		var rotate = new Rotate();
		var pinch = new Pinch();
		var tap = new Tap({
			taps: 1
		});
		var doubleTap = new Tap({
			event: "doubletap",
			taps: 2
		});

		rotate.recognizeWith([pan]);
		pinch.recognizeWith([rotate, pan]);
		doubleTap.recognizeWith([tap]);
		tap.requireFailure([doubleTap]);

		manager.add(pan);
		manager.add(rotate);
		manager.add(pinch);
		manager.add(doubleTap);
		manager.add(tap);

		var liveScale = 1;
		var currentRotation = 0;
		manager.on("rotatemove", function(e:GestureInteractionData) {
			var rotation = currentRotation + Math.round(liveScale * e.rotation);
			stage.style.transform = "rotate(" + rotation + "deg)";
		});
		manager.on("rotateend", function(e:GestureInteractionData) {
			currentRotation += Math.round(e.rotation);
		});

		var colors = [
			[20, 187, 95],
			[20, 95, 187],
			[187, 95, 20],
			[187, 20, 95],
			[95, 20, 187],
			[95, 187, 20]
		];

		var currentColorIndex = 0;
		manager.on("tap", function(e) {
			currentColorIndex++;
			if (currentColorIndex >= colors.length) {
				currentColorIndex = 0;
			}
			stage.style.backgroundColor = makeColor(colors[currentColorIndex]);
			stage.style.borderColor = makeColor(colors[currentColorIndex], 0.85);
		});
	}

	function mult(a:Float, b:Float):Float {
		return Math.round(a * b);
	}

	function makeColor(rgb:Array<Int>, ?adj:Float = 1):String {
		return "rgb(" + mult(rgb[0], adj) + "," + mult(rgb[1], adj) + "," + mult(rgb[2], adj) + ")";
	}

	static function main() {
		new Main();
	}
}