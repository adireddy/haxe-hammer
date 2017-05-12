[![Build Status](https://travis-ci.org/adireddy/haxe-hammer.svg?branch=master)](https://travis-ci.org/adireddy/haxe-hammer)

haxe-hammer
===========

Externs of HAMMER.JS for Haxe - Javascript touch gestures library.

### Installation ###

```haxe
haxelib install hammerjs
```

### Demo ###

[http://adireddy.github.io/demos/haxe-hammer](http://adireddy.github.io/demos/haxe-hammer/)

### Usage ###

```haxe
import hammer.Hammer;
import hammer.Manager;
import hammer.recognizers.Rotate;
import hammer.GestureInteractionData;
import js.Browser;
import js.html.HtmlElement;

class Main {

	public function new() {
		// get a reference to an element
		var stage:HtmlElement = cast Browser.document.getElementById("stage");

		// create a manager for that element
		var mc:Manager = new Manager(stage);

		// create a recognizer
		var rotate = new Rotate();

		// add the recognizer
		mc.add(rotate);

		// subscribe to events
		mc.on("rotate", function(e:GestureInteractionData) {
		    // do something cool
		    var rotation = Math.round(e.rotation);
		    stage.style.transform = "rotate(" + rotation + "deg)";
		});
	}
}
```

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.

[hammer.js](http://hammerjs.github.io) is written by [Jorik Tangelder (Eight Media)](http://www.eight.nl) and licensed under the [MIT](http://opensource.org/licenses/MIT) License.
