var dBar:FlxSprite;
var shootsfx:FlxSound;
var hitsfx:FlxSound;

var shooting = 0;
var timer = 0;

var vshot = 0;
var cross = FlxSprite;

function postCreate() {
	trace("hi");

	shootsfx = FlxG.sound.play(Paths.sound("pistolshot"), 1);
	shootsfx.volume = 0;
	hitsfx = FlxG.sound.play(Paths.sound("sfx_killingblow"), 1);
	hitsfx.volume = 0;

	cross = new FlxSprite(0, 0).loadGraphic(Paths.image('cross'));
	cross.x = -200;
	cross.y = -200;
	cross.scale.x = cross.scale.y = 3;
	add(cross);

    	dBar = new FlxSprite();
	dBar.makeGraphic(500, 50, FlxColor.WHITE);
	dBar.x = 750;
	dBar.y = 350;
	dBar.camera = camGame;
	dBar.origin.set(0, 0);
	add(dBar);
}

function update() {
	if (FlxG.keys.justPressed.SPACE && timer == 0) {
		shooting = 25;
		timer = 100;
		shootsfx = FlxG.sound.play(Paths.sound("pistolshot"), 1);
		shootsfx.volume = 1;
		hitsfx = FlxG.sound.play(Paths.sound("sfx_killingblow"), 1);
		hitsfx.volume = 1;
		health += 0.25;
	}

	if (shooting > 0) {
		boyfriend.animation.play('shoot', false);
		shooting -= 1;
	}
	if (timer > 0) {
		timer -= 0.1;
	}
	if (timer < 0.15) {
		timer = 0;
	}

	if (shooting == 0 && timer > 0) {
		boyfriend.color = 0xFFAAAAFF;
	} else if (timer == 0) {
		boyfriend.color = 0xFFFFFFFF;
	}

	if (vshot > 0) {
		dad.animation.play('shoot', false);
		vshot -= 1;
	}

	dBar.x = 750;
	dBar.scale.x = timer / 100;
}
function beatHit(curBeat) {
	if ((curBeat + 4) % 64 == 0 && (curBeat + 4) != 0) {
		cross.x = -200;
		FlxTween.tween(cross, {x: boyfriend.x + 100, y:boyfriend.y + 475}, 1.25, {ease: FlxEase.quadOut});
		FlxTween.tween(cross.scale, {x: 4, y:4}, 1.1, {ease: FlxEase.quadOut});
	}
	if (curBeat % 64 == 0 && curBeat != 0) {
		cross.scale.x = cross.scale.y = 1;
		shootsfx = FlxG.sound.play(Paths.sound("pistolshot"), 1);
		shootsfx.volume = 1;
		hitsfx = FlxG.sound.play(Paths.sound("sfx_killingblow"), 1);
		hitsfx.volume = 1;
		if (health > 1) {
		health -= 1;
		} else {
		health *= 0.5;
		}
		vshot = 25;
		camGame.flash(FlxColor.fromRGB(255,255,255), 0.75);
		FlxTween.tween(cross, {x: 100, y:-200}, 0.75, {ease: FlxEase.backOut});
		FlxTween.tween(cross.scale, {x: 3, y:3}, 0.3, {ease: FlxEase.quadOut});
	}
}
function out() {
	defaultCamZoom = 0;
	FlxTween.tween(camGame, {alpha:0, angle:360}, 2, {ease: FlxEase.quadOut});
	FlxTween.tween(camHUD, {alpha:0, angle:360}, 1, {ease: FlxEase.quadOut});
}