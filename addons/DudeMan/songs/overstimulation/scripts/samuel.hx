import flixel.text.FlxTextBorderStyle;

function postCreate() {

	bgSay = new FlxSprite(400, -100).loadGraphic(Paths.image('visuals/overstimulation/bg'));
	bgSay.antialiasing = false;
	bgSay.alpha = 0;
	bgSay.updateHitbox();
	insert(10,bgSay);

	over1Say = new FlxSprite(400, -100).loadGraphic(Paths.image('visuals/overstimulation/overlay1'));
	over1Say.antialiasing = false;
	over1Say.alpha = 0;
	over1Say.updateHitbox();
	add(over1Say);

	over2Say = new FlxSprite(400, -100).loadGraphic(Paths.image('visuals/overstimulation/overlay2'));
	over2Say.antialiasing = false;
	over2Say.alpha = 0;
	over2Say.updateHitbox();
	add(over2Say);

	doorBar = new FlxSprite(400, -100).loadGraphic(Paths.image('visuals/overstimulation/doorBar'));
	doorBar.antialiasing = false;
	doorBar.alpha = 0;
	doorBar.updateHitbox();
	add(doorBar);

	black = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	black.antialiasing = false;
	black.cameras = [camHUD];
	black.scale.x = 9;
	black.scale.y = 9;
	black.alpha = 0;
	black.updateHitbox();
	add(black);
	
    theText = new FlxText(0, 0);
	theText.text = "15";
    theText.setFormat(Paths.font("Bahnschrift.ttf"), 60, FlxColor.WHITE, "center");
    theText.cameras = [camHUD];
    theText.antialiasing = false;
	theText.alpha = 0;
	theText.screenCenter();
    add(theText);

	cryingbaby = new FlxSprite(0, 1000).loadGraphic(Paths.image('visuals/overstimulation/Crying Baby'));
	cryingbaby.antialiasing = false;
	cryingbaby.cameras = [camHUD];
	cryingbaby.alpha = 0;
	cryingbaby.updateHitbox();
	cryingbaby.screenCenter(FlxAxes.X);
	add(cryingbaby);

	exe = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/overstimulation/exe'));
	exe.antialiasing = false;
	exe.cameras = [camHUD];
	exe.alpha = 0;
	exe.updateHitbox();
	add(exe);

	severe = new FlxSprite(0, 0);	
	severe.antialiasing = false;
	severe.scrollFactor.set(0, 0);
	severe.frames = Paths.getSparrowAtlas('visuals/overstimulation/severe');
	severe.animation.addByPrefix('lapse', 'lapse', 6);
	severe.animation.play('lapse');
	severe.alpha = 0;
	severe.cameras = [camHUD];
	severe.scale.set(1.15, 1.15);
	severe.screenCenter();
	insert(1, severe);

	nightmareALT = new FlxSprite(0, 0);	
	nightmareALT.antialiasing = false;
	nightmareALT.scrollFactor.set(0, 0);
	nightmareALT.frames = Paths.getSparrowAtlas('visuals/overstimulation/itwasanightmare');
	nightmareALT.animation.addByPrefix('evil', 'evil', 12, false);
	nightmareALT.animation.play('evil');
	nightmareALT.alpha = 0;
	nightmareALT.cameras = [camHUD];
	insert(1, nightmareALT);

	nightmare = new FlxSprite(0, 0);	
	nightmare.antialiasing = false;
	nightmare.scrollFactor.set(0, 0);
	nightmare.frames = Paths.getSparrowAtlas('visuals/overstimulation/itwasanightmare');
	nightmare.animation.addByPrefix('it', 'it', 10);
	nightmare.animation.addByPrefix('was a', 'was a', 10);
	nightmare.animation.addByPrefix('nightmare', 'nightmare', 10);
	nightmare.animation.addByPrefix('im', 'im', 10);
	nightmare.animation.addByPrefix('evil', 'evil', 12, false);
	nightmare.animation.play('it');
	nightmare.alpha = 0;
	nightmare.cameras = [camHUD];
	nightmare.scale.set(1, 1);
	add(nightmare);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 144:
			black.alpha = 1;
			FlxTween.tween(theText, {alpha: 1}, 1, {ease:FlxEase.linearIn});
		case 156:
			cryingbaby.alpha = 1;
			FlxTween.tween(cryingbaby, {angle: 365}, 0.55, {ease:FlxEase.quartOut});
			FlxTween.tween(cryingbaby, {y: 222}, 0.5, {ease:FlxEase.quartOut});
		case 160:
			FlxTween.tween(theText, {alpha: 0}, 1.3, {ease:FlxEase.linearIn});
			cryingbaby.alpha = 0;
			black.alpha = 0;
			theText.alpha = 0;
        case 248:
            severe.alpha = 1;
        case 256:
            severe.alpha = 0;
        case 288:
			exe.alpha = 1;
        case 300:
			exe.alpha = 0;
        case 303:
			exe.alpha = 1;
        case 305:
			exe.alpha = 0;
		case 416:
			black.alpha = 1;
		case 421:
			nightmare.alpha = 1;
		case 422:
			nightmare.animation.play('was a');
		case 426:
			nightmare.animation.play('nightmare');
		case 437:
			nightmare.animation.play('im');
		case 440:
			nightmare.animation.play('evil');
			nightmareALT.animation.play('evil');
		case 445:
			FlxTween.tween(nightmareALT, {alpha: 1}, 0.3, {ease:FlxEase.quartOut});
		case 447:
			black.alpha = 0;
			FlxTween.tween(nightmare, {alpha: 0}, 0.4, {ease:FlxEase.quartOut});
		case 451:
			nightmareALT.alpha = 0;
			defaultCamZoom = 1;
			bgSay.alpha = 1;
			over1Say.alpha = 1;
			over2Say.alpha = 1;
			doorBar.alpha = 1;
		case 576:
			defaultCamZoom = 1.6;
			bgSay.alpha = 0;
			over1Say.alpha = 0;
			over2Say.alpha = 0;
			doorBar.alpha = 0;
	}
}