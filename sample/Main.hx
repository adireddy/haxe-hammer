import hammer.Hammer;
import js.Browser;

class Main {

	public function new() {
		var el = Browser.document.getElementById("myElement");
		el.style.width = Browser.window.innerWidth + "px";
		el.style.height = Browser.window.innerHeight + "px";

		var mc = new Hammer(el);

		mc.on("panleft panright tap press", function(ev:Dynamic) {
			trace(ev);
			el.textContent = ev.type +" gesture detected.";
		});
	}

	static function main() {
		new Main();
	}
}