var time = 0;
var flippingthisfaggot = false;
var horseSpeed = 1;

function postCreate() {
	
	if (FlxG.save.data.horse) {
		horse = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/itsbeensolong'));
		horse.scrollFactor.set(0, 0);
		horse.scale.set(-0.9, 0.9);
		horse.cameras = [camHUD];
		insert(60, horse);

		horseBoom = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/mydadleftmeinnorthcarolinabrokenheartemoji'));
		horseBoom.scrollFactor.set(0, 0);
		horseBoom.alpha = 0;
		horseBoom.cameras = [camHUD];
		insert(61, horseBoom);
	}

	if (FlxG.save.data.xbox) {
		Xbox = new FlxSprite();
		Xbox.makeGraphic(1920, 1080, FlxColor.GREEN);
		Xbox.alpha = 0.3;
		Xbox.cameras = [camHUD];
		insert(2, Xbox);

		tvOverlay= new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/xbox/tvoverlay'));
		tvOverlay.scrollFactor.set(0, 0);
		tvOverlay.scale.set(1, 1);
		tvOverlay.cameras = [camHUD];
		insert(3, tvOverlay);

		fuckingController= new FlxSprite(140, 300).loadGraphic(Paths.image('secretsettings/xbox/thatfuckingcontroller'));
		fuckingController.scrollFactor.set(0, 0);
		fuckingController.scale.set(0.6, 0.4);
		fuckingController.cameras = [camHUD];
		insert(4, fuckingController);
		
    		camGame.zoom -= 0.2;
    		camGame.y -= 50;
    		camHUD.zoom = 1;
		
		if (downscroll) {

		fuckingController.y += 50;		
		fuckingController.angle = 180;
		
		}
	}
}

function update(delta:Float) {
	time += delta;
	horse.y = horse.y + Math.cos(time * 6.3) * 1;
	horse.angle = horse.angle + Math.cos(time * 3.5) * 0.2;	

	if (flippingthisfaggot == false) {
		horse.x += horseSpeed;
	}
	if (flippingthisfaggot == true) {
		horse.x -= horseSpeed;
	}
	if (horse.x >= 736) {
		flippingthisfaggot = true;
		horse.scale.set(0.9, 0.9);
	}

	if (horse.x <= -128) {
		flippingthisfaggot = false;
		horse.scale.set(-0.9, 0.9);
	}

	if (horseBoom.alpha > 0) {
		horseBoom.alpha -= 0.005;
	}
}

function onPlayerMiss() {
	if (FlxG.save.data.horse) {
		horseBoom.alpha = 1;
		FlxG.sound.play(Paths.sound('cbt'));
	}
}