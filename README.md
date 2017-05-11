haxe-hammer
===========

Externs of HAMMER.JS for Haxe - Javascript touch gestures library.

### Installation ###

```haxe
haxelib install hammerjs
```

### Usage ###

```haxe
import hammer.Hammer;
import js.Browser;

class Main {

	public function new() {
		var el = Browser.document.getElementById("myElement");
		el.style.width = Browser.window.innerWidth + "px";
		el.style.height = Browser.window.innerHeight + "px";

		var mc = new Hammer(el);

		mc.on("panleft panright tap press", function(ev:Dynamic) {
			el.textContent = ev.type +" gesture detected.";
		});
	}

	static function main() {
		new Main();
	}
}
```

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.

[hammer.js](http://hammerjs.github.io) is written by [Jorik Tangelder (Eight Media)](http://www.eight.nl) and licensed under the [MIT](http://opensource.org/licenses/MIT) License.
