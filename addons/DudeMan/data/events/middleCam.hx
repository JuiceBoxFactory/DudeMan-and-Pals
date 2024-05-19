var posToBe = boyfriend.x + dad.x;
var speed = 1;

function onEvent(e) {
    if (e.event.name == "middleCam") {

        var prevLerp = FlxG.camera.followLerp; 

        posToBe = boyfriend.x + dad.x;
        posToBe = posToBe / 2;
        trace(posToBe);

        var howFast = prevLerp * 30;
        speed = howFast * e.event.params[1];

        if (e.event.params[0] == true) {
            FlxG.camera.followLerp = 0;
            FlxTween.tween(camGame.scroll, {x: posToBe}, speed, {ease: FlxEase.quartOut});      
        }

        if (e.event.params[0] == false) {
            FlxG.camera.followLerp = prevLerp;   
        }

    }
}
