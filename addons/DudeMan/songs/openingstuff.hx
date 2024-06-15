import flixel.FlxCamera;

function create() {

	if (PlayState.SONG.meta.noteType != "serious") {

		numberCam = new FlxCamera(0, 0, 1280, 720);
		FlxG.cameras.add(numberCam, false);
		numberCam.bgColor = 0x0000000;
	
		number3bg = new FlxSprite(125, 600).loadGraphic(Paths.image('game/intro/3bg'));
		number3bg.antialiasing = false;
		number3bg.scale.set(1, 1);
		number3bg.alpha = 1;
		number3bg.cameras = [numberCam];
		number3bg.updateHitbox();
		number3bg.angle = 10;
		add(number3bg);

		number3 = new FlxSprite(125, 600).loadGraphic(Paths.image('game/intro/3'));
		number3.antialiasing = false;
		number3.scale.set(1, 1);
		number3.alpha = 1;
		number3.cameras = [numberCam];
		number3.updateHitbox();
		number3.angle = 10;
		add(number3);

		sep1 = new FlxSprite(250, 600).loadGraphic(Paths.image('game/intro/seperator'));
		sep1.antialiasing = false;
		sep1.scale.set(1, 1);
		sep1.alpha = 0;
		sep1.cameras = [numberCam];
		sep1.updateHitbox();
		add(sep1);
	
		number2bg = new FlxSprite(0, 600).loadGraphic(Paths.image('game/intro/2bg'));
		number2bg.antialiasing = false;
		number2bg.scale.set(1.4, 1.4);
		number2bg.alpha = 1;
		number2bg.cameras = [numberCam];
		number2bg.updateHitbox();
		number2bg.angle = 10;
		number2bg.screenCenter(FlxAxes.X);
		add(number2bg);

		number2 = new FlxSprite(0, 600).loadGraphic(Paths.image('game/intro/2'));
		number2.antialiasing = false;
		number2.scale.set(1.4, 1.4);
		number2.alpha = 1;
		number2.cameras = [numberCam];
		number2.updateHitbox();
		number2.angle = 10;
		number2.screenCenter(FlxAxes.X);
		add(number2);

		sep2 = new FlxSprite(510, 600).loadGraphic(Paths.image('game/intro/seperator'));
		sep2.antialiasing = false;
		sep2.scale.set(1, 1);
		sep2.alpha = 0;
		sep2.cameras = [numberCam];
		sep2.updateHitbox();
		add(sep2);

		number1bg = new FlxSprite(450, 600).loadGraphic(Paths.image('game/intro/1bg'));
		number1bg.antialiasing = false;
		number1bg.scale.set(1.8, 1.8);
		number1bg.alpha = 1;
		number1bg.cameras = [numberCam];
		number1bg.updateHitbox();
		number1bg.angle = 10;
		add(number1bg);

		number1 = new FlxSprite(450, 600).loadGraphic(Paths.image('game/intro/1'));
		number1.antialiasing = false;
		number1.scale.set(1.8, 1.8);
		number1.alpha = 1;
		number1.cameras = [numberCam];
		number1.updateHitbox();
		number1.angle = 10;
		add(number1);
	
		numberGObg = new FlxSprite(0, 600).loadGraphic(Paths.image('game/intro/GObg'));
		numberGObg.antialiasing = false;
		numberGObg.scale.set(1.6, 1.6);
		numberGObg.alpha = 1;
		numberGObg.cameras = [numberCam];
		numberGObg.updateHitbox();
		numberGObg.angle = 25;
		numberGObg.screenCenter(FlxAxes.X);
		add(numberGObg);

		numberGO = new FlxSprite(0, 600).loadGraphic(Paths.image('game/intro/GO'));
		numberGO.antialiasing = false;
		numberGO.scale.set(1.6, 1.6);
		numberGO.alpha = 1;
		numberGO.cameras = [numberCam];
		numberGO.updateHitbox();
		numberGO.angle = 10;
		numberGO.screenCenter(FlxAxes.X);
		add(numberGO);

	}

  	if (PlayState.SONG.meta.name != "roomed") {
    	camHUD.zoom = 0;
    	camHUD.alpha = 0;

		openingblack = new FlxSprite(-1000, -1000).loadGraphic(Paths.image('black'));
		openingblack.antialiasing = false;
		openingblack.scale.set(15, 15);
		openingblack.alpha = 1;
		openingblack.updateHitbox();
		insert(35, openingblack);
	}
}

function onCountdown(event) {

	event.cancel();

	if (PlayState.SONG.meta.noteType != "serious") {
		if (event.swagCounter == 0) {
			FlxG.sound.play(Paths.sound('intro3'));
	    	FlxTween.tween(number3, {y: 175}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(number3bg, {y: 175}, 0.7, {ease:FlxEase.quartOut});
			FlxTween.tween(number3, {angle: 0}, 1.7, {ease:FlxEase.quartOut});
			FlxTween.tween(number3bg, {angle: 0}, 1.7, {ease:FlxEase.quartOut});

		}
		if (event.swagCounter == 1) {
			FlxG.sound.play(Paths.sound('intro2'));
			FlxTween.tween(number2, {y: 75}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(number2bg, {y: 75}, 0.7, {ease:FlxEase.quartOut});
			FlxTween.tween(sep1, {y: 175}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(sep1, {alpha: 1}, 1.4, {ease:FlxEase.quartOut});
			FlxTween.tween(number2, {angle: 0}, 1.7, {ease:FlxEase.quartOut});
			FlxTween.tween(number2bg, {angle: 0}, 1.7, {ease:FlxEase.quartOut});

		}
		if (event.swagCounter == 2) {
			FlxG.sound.play(Paths.sound('intro1'));
			FlxTween.tween(number1, {y: -75}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(number1bg, {y: -75}, 0.7, {ease:FlxEase.quartOut});
			FlxTween.tween(sep2, {y: 175}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(sep2, {alpha: 1}, 1.4, {ease:FlxEase.quartOut});
			FlxTween.tween(number1, {angle: 0}, 1.7, {ease:FlxEase.quartOut});
			FlxTween.tween(number1bg, {angle: 0}, 1.7, {ease:FlxEase.quartOut});

		}
	
		if (event.swagCounter == 3) {
			FlxG.sound.play(Paths.sound('introGO'));
			FlxTween.tween(numberGO, {y: -100}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(numberGObg, {y: -100}, 0.7, {ease:FlxEase.quartOut});
			FlxTween.tween(numberGO, {angle: 0}, 0.6, {ease:FlxEase.quartOut});
			FlxTween.tween(numberGObg, {angle: 0}, 0.6, {ease:FlxEase.quartOut});
	
			new FlxTimer().start(0.6, function(timer) {
				FlxTween.tween(numberGO, {y: 600}, 0.8, {ease:FlxEase.quartIn});
				FlxTween.tween(numberGObg, {y: 600}, 0.8, {ease:FlxEase.quartIn});
				FlxTween.tween(numberGO, {angle: 10}, 0.6, {ease:FlxEase.quartIn});
				FlxTween.tween(numberGObg, {angle: 25}, 0.6, {ease:FlxEase.quartIn});
			});
	
			FlxTween.tween(number3, {y: 600}, 1, {ease:FlxEase.backIn});
			FlxTween.tween(number3bg, {y: 600}, 1, {ease:FlxEase.backIn});
			FlxTween.tween(number2, {y: 600}, 1.15, {ease:FlxEase.backIn});
			FlxTween.tween(number2bg, {y: 600}, 1.15, {ease:FlxEase.backIn});
			FlxTween.tween(sep1, {y: 600}, 1, {ease:FlxEase.backIn});
			FlxTween.tween(number1, {y: 600}, 1.2, {ease:FlxEase.backIn});
			FlxTween.tween(number1bg, {y: 600}, 1.2, {ease:FlxEase.backIn});
			FlxTween.tween(sep2, {y: 600}, 1.15, {ease:FlxEase.backIn});
		}
	}

	if (PlayState.SONG.meta.name != "roomed") {
		FlxTween.tween(openingblack, {alpha: 0}, 0.5);
	}

	FlxTween.tween(camHUD, {alpha: 1}, 0.5);

}