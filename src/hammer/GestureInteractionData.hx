package hammer;

typedef GestureInteractionData = {
	var type:String;					//Name of the event. Like panstart.
	var deltaX:Float;					//Movement of the X axis.
	var deltaY:Float;					//Movement of the Y axis.
	var deltaTime:Float;				//Total time in ms since the first input.
	var distance:Float;					//Distance moved.
	var angle:Float;					//Angle moved.
	var velocityX:Float;				//Velocity on the X axis, in px/ms.
	var velocityY:Float;				//Velocity on the Y axis, in px/ms
	var velocity:Float;					//Highest velocityX/Y value.
	var direction:Int;					//Direction moved. Matches the DIRECTION constants.
	var offsetDirection:Int;			//Direction moved from it's starting point. Matches the DIRECTION constants.
	var scale:Float;					//Scaling that has been done when multi-touch. 1 on a single touch.
	var rotation:Float;					//Rotation that has been done when multi-touch. 0 on a single touch.
	var center:Dynamic;					//Center position for multi-touch, or just the single pointer.
	var srcEvent:Dynamic;				//Source event object, type TouchEvent, MouseEvent or PointerEvent.
	var target:Dynamic;					//Target that received the event.
	var pointerType:String;				//Primary pointer type, could be touch, mouse, pen or kinect.
	var eventType:Int;					//Event type, matches the INPUT constants.
	var isFirst:Bool; 					//when the first input.
	var isFinal:Bool; 					//when the final (last) input.
	var pointers:Dynamic;				//Array with all pointers, including the ended pointers (touchend, mouseup).
	var changedPointers:Dynamic;		//Array with all new/moved/lost pointers.
	var preventDefault:Void -> Void;	//Reference to the srcEvent.preventDefault() method. Only for experts!
}