import flixel.text.FlxTextBorderStyle;
import openfl.geom.ColorTransform;

var time = 0;

function create() {

	yellow = new FlxSprite(0, -100).loadGraphic(Paths.image('backdrop/strokemypenis/yellow'));
	yellow.antialiasing = false;
	yellow.scale.x = 1;
	yellow.scale.y = 1;
	yellow.alpha = 1;
	yellow.updateHitbox();
	insert(4, yellow);

	yellow2 = new FlxSprite(2275, -100).loadGraphic(Paths.image('backdrop/strokemypenis/yellow'));
	yellow2.antialiasing = false;
	yellow2.scale.x = 1;
	yellow2.scale.y = 1;
	yellow2.alpha = 1;
	yellow2.updateHitbox();
	insert(4, yellow2);

}

function update(delta:Float) {
    time += delta;
    yellow.alpha = yellow.alpha + Math.cos(time * 3.5) * 0.01 / 2;
    yellow2.alpha = yellow2.alpha + Math.cos(time * 3.5) * 0.01 / 2;
}

function stepHit(curStep:Int) { 
    switch (curStep) {

		case 1408:
			FlxTween.tween(boyfriend, {x: 3000}, 0.8);

		case 1416:
			FlxG.camera.flash(0xFFFFFFFF, 1);
			FlxTween.tween(dad, {x: 2500}, 0.4, {ease:FlxEase.quartOut});
			FlxTween.tween(dad, {angle: 360}, 0.6, {ease:FlxEase.quartOut});

		case 1420:
			FlxTween.tween(dad, {y: 800}, 0.8, {ease:FlxEase.backIn});

		case 1424:
			FlxTween.tween(camHUD, {alpha: 0}, 0.7);

	}
}