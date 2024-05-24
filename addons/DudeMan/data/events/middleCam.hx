var posToBe = boyfriend.x + dad.x;
var speed = 1;
var prevLerp = 0.04;

function onEvent(e) {
    if (e.event.name == "middleCam") {

        if (e.event.params[0] == true) {
            prevLerp = FlxG.camera.followLerp;

            posToBe = boyfriend.x + dad.x;
            posToBe = posToBe / 2;

            var howFast = prevLerp * 30;
            speed = howFast * e.event.params[1];

            FlxG.camera.followLerp = 0;
            FlxTween.tween(camGame.scroll, {x: posToBe}, speed, {ease: FlxEase.quartOut});      
        }

        if (e.event.params[0] == false) {
            FlxG.camera.followLerp = prevLerp;   
        }

    }
}
