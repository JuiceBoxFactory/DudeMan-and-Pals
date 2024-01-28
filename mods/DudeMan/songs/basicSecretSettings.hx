var time = 0;
var flippingthisfaggot = false;
var horseSpeed = 1;

function create() {
	if (FlxG.save.data.horse) {
		horse = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/itsbeensolong'));
		horse.scrollFactor.set(0, 0);
		horse.scale.set(-0.9, 0.9);
		horse.cameras = [camHUD];
		add(horse);

		horseBoom = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/mydadleftmeinnorthcarolinabrokenheartemoji'));
		horseBoom.scrollFactor.set(0, 0);
		horseBoom.alpha = 0;
		horseBoom.cameras = [camHUD];
		insert(666, horseBoom);
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