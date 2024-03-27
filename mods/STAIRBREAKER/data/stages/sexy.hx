var camZoom = 0;
var camOther;
var sans2;
var sans3;
var thatonepart = false;
function create() {
	FlxG.camera.followLerp = 0.03;

	grad.scale.x = 100;
	grad.scale.y = 1;
	grad.camera = camGame;

	FlxG.cameras.add(camOther = new FlxCamera(), false);
	camOther.bgColor = FlxColor.TRANSPARENT;

	flip = new FlxSprite(-450, 300).loadGraphic(Paths.image("Flipaclip"));
	flip.scale.x = flip.scale.y = 0.2;
	flip.camera = camOther;
	add(flip);

	if (FlxG.save.data.sex != true) {
		sans2 = new Character(dad.x, dad.y, "sexysansmain");
		sans2.flipX = dad.flipX;
		sans2.alpha = 0;
		insert(members.indexOf(boyfriend), sans2);
		sans3 = new Character(dad.x, dad.y, "phase3");
		sans3.flipX = dad.flipX;
		sans3.alpha = 0;
		add(sans3);
	}
}

function postCreate() {
    	for (i in [missesTxt, accuracyTxt, scoreTxt, healthBar, healthBarBG, iconP1, iconP2]) {
        	i.visible = false;
    	}
	for (i in 0...2) {
    		cpuStrums.members[i].x = 110 + i * 105;
		cpuStrums.members[i].scale.x = cpuStrums.members[i].scale.y = 0.5;
	}
	for (i in 2...4) {
    		cpuStrums.members[i].x = 740 + i * 105;
		cpuStrums.members[i].scale.x = cpuStrums.members[i].scale.y = 0.5;
	}
	for (i in 0...4) {
    		playerStrums.members[i].x = 425 + i * 105;
		playerStrums.members[i].scale.x = playerStrums.members[i].scale.y = 0.5;
	}
	for (strum in strumLines) {
		if (strum.cpu) {
			for (note in strum.notes) {
				note.alpha = 0.25;
    			}
		}
		for (note in strum.notes) {
			note.scale.x = note.scale.y = 0.5;
    		}
	}

	camHUD.alpha = 0;
}

function onCountdown(event) {
	event.spritePath = switch(event.swagCounter) {
		case 0: null;
		case 1: null;
		case 2: null;
		case 3: null;
	};
}

function onPlayerHit(event:NoteHitEvent) {
	event.ratingPrefix = "stages/school/ui/";
	event.ratingScale = 0;
	event.ratingAntialiasing = false;

	event.numScale = 0;
	event.numAntialiasing = false;
}


function update() {
	FlxG.camera.followLerp = 0.03;
	for (i in 0...4) {
		cpuStrums.members[i].alpha = 0.25;
		playerStrums.members[i].alpha = 1;
	}
	if (FlxG.save.data.sex != true) {
		dad.scale.x = dad.scale.y = sans2.scale.x = sans2.scale.y = sans3.scale.x = sans3.scale.y = dad.x/1600;
	} else {
		dad.scale.x = dad.scale.y = dad.x/1600;
	}

	if (FlxG.save.data.sex != true) {
		sans2.x = dad.x + 240;
		sans2.y = dad.y - 25;
		sans3.x = dad.x + 270;
		sans3.y = dad.y - 40;
	}
	boyfriend.scale.x = boyfriend.scale.y = (boyfriend.x)/200;
	defaultCamZoom = FlxMath.remapToRange(camGame.scroll.x, 400, 700, 1.8, 0.8);
	if (thatonepart) {
		dad.x = 400;
		if (FlxG.save.data.sex != true) {
			dad.alpha = 0;
			sans2.alpha = 0;
			sans3.alpha = 1;
		}
	}
	if (FlxG.save.data.sex != true) {
		if (!thatonepart) {
			sans3.alpha = 0;
		}
	}
}
function onDadHit(event) {
	if (FlxG.save.data.sex != true) {
		sans2.playSingAnim(event.direction);
		sans3.playSingAnim(event.direction);
	}
}

function beatHit(curBeat) {
	if (curBeat % 2 == 0) {
		camGame.zoom += 0.05;
		camHUD.zoom += 0.025;
	}
	if (curBeat == 0) {
		FlxTween.tween(camHUD, {alpha: 1}, 2, {ease:FlxEase.quartOut});
		dad.x = 400;
		grad.y = -4000;
		grad.scale.y = 1;
	}
	if (curBeat < 4) {
		dad.x = 400;
		grad.y = -4000;
		grad.scale.y = 1;
		if (FlxG.save.data.sex != true) {
			sans3.alpha = 0;
		}
		thatonepart = false;
		for (strum in strumLines) {
			if (strum.cpu) {
				for (note in strum.notes) {
					note.alpha = 0.25;
    				}
			}
			for (note in strum.notes) {
				note.scale.x = note.scale.y = 0.5;
    			}
		}
	}
	if (curBeat == 197) {
		FlxTween.tween(grad, {y: 500}, 17 / inst.pitch, {ease:FlxEase.linear});
		FlxTween.tween(dad, {x: dad.x + 300}, 17 / inst.pitch, {ease:FlxEase.linear});
		FlxTween.tween(grad.scale, {y: 2}, 1 / inst.pitch, {ease:FlxEase.linear});
	}
	if (FlxG.save.data.sex != true) {
	if (curBeat < 84) {
		dad.alpha = 1;
		sans2.alpha = 0;
	}
	if (curBeat > 84) {
		dad.alpha = 0;
		sans2.alpha = 1;
	}
	}
	flip.scale.x = flip.scale.y = 0.25;
	FlxTween.tween(flip.scale, {x: 0.2, y: 0.2}, 0.4, {ease:FlxEase.quartOut});

}

function grad() {
	trace("hey hey!!");
}

function trans1() {
	FlxTween.tween(camGame, {alpha:0}, 0.5, {ease:FlxEase.quartOut});
	FlxTween.tween(camHUD, {alpha:0}, 0.25, {ease:FlxEase.quartOut});
}
function trans1end() {
	FlxTween.tween(camGame, {alpha:1}, 0.5, {ease:FlxEase.quartOut});
	FlxTween.tween(camHUD, {alpha:1}, 0.25, {ease:FlxEase.quartOut});
	dad.x += 200;
}

function blackout() {
	camGame.alpha = camHUD.alpha = 0;
	thatonepart = true;
}
function unblackout() {
	FlxTween.tween(camGame, {alpha:1}, 0.25, {ease:FlxEase.quartOut});
	FlxTween.tween(camHUD, {alpha:1}, 0.25, {ease:FlxEase.quartOut});
}