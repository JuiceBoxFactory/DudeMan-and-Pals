
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import flixel.text.FlxTextBorderStyle;

var startingStep = 0;

function postCreate() {

	logo = new FlxSprite(340, 1200).loadGraphic(Paths.image('songLogos/'+PlayState.SONG.meta.name));
	logo.antialiasing = false;
	logo.scrollFactor.set(1, 1);
	logo.scale.set(1.2, 1.2);
	logo.alpha = 1;
	logo.cameras = [camHUD];
	logo.updateHitbox();
	add(logo);

}

function logoAnim(type) {
    switch (type) {

        case "appear":
            FlxTween.tween(logo, {y: 110}, 2, {ease:FlxEase.quartOut});	

        case "disappear":
            FlxTween.tween(logo, {y: 1200}, 2, {ease:FlxEase.quartIn});
            new FlxTimer().start(3, function(timer) {
                logo.alpha = 0;
            });	

    }
 

}


function stepHit(curStep:Int) { 
    switch (curStep) {
        case startingStep:
            logoAnim("appear");
            new FlxTimer().start(3, function(timer) {
                logoAnim("disappear");
            });
    }
}