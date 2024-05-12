var posToBe = boyfriend.x + dad.x;
var speed = 1;

function onEvent(e) {
    if (e.event.name == "middleCam") {

        posToBe = posToBe / 2;
        trace(posToBe);

        speed = e.event.params[1];
        trace(speed);

        if (e.event.params[0] == true) {
            FlxG.camera.followLerp = 0;
            FlxTween.tween(camGame.scroll, {x: posToBe}, speed, {ease: FlxEase.quartOut});      
        }

        if (e.event.params[0] == false) {
            FlxG.camera.followLerp = 0.04;   
        }

    }
}