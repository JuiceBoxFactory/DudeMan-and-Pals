var ough:FlxSprite;

function postCreate() {

if (PlayState.SONG.meta.name == "lighthouse") {
	remove(iconP1);
	remove(iconP2);
	remove(healthBarBG);
	remove(healthBar);

	insert(5, healthBarBG);
	insert(6, healthBar);
	insert(8, iconP1);
	insert(8, iconP2);

	missesTxt.y += 20;
	scoreTxt.y += 20;
}

if (PlayState.SONG.meta.name != "lighthouse") {
	remove(iconP1);
	remove(iconP2);
	remove(healthBarBG);
	remove(healthBar);
	remove(missesTxt);
	remove(scoreTxt);

	healthheader = new FlxSprite(347, 580).loadGraphic(Paths.image('game/healthBarPART2'));
	healthheader.antialiasing = false;
	healthheader.cameras = [camHUD];
	healthheader.setGraphicSize(Std.int(healthheader.width * 1));
	healthheader.updateHitbox();

	insert(5, healthBarBG);
	insert(6, healthBar);
	insert(7, healthheader);
	insert(8, iconP1);
	insert(8, iconP2);
	insert(8, missesTxt);
	insert(8, scoreTxt);

for (obj in [healthBar, healthBarBG])
    obj.y -= 10;


for (obj in [iconP1, iconP2])
    obj.y += 10;

	missesTxt.x -= 155;
	missesTxt.y -= 60;
	scoreTxt.x -= -30;
	scoreTxt.y -= 60;

if (downscroll) {
	for (obj in [healthBar, healthBarBG])
    		obj.y -= 10;
		scoreTxt.y += -20;
		missesTxt.y += -20;
		healthheader.y -= -5;
		iconP1.y -= 20;
		iconP2.y -= 20;
	}

if (FlxG.save.data.xbox) {
	remove(healthBarBG);
	remove(healthheader);

	healthBar.x = -50;
	healthBar.scale.x = 0.7;

	missesTxt.x -= 430;
	scoreTxt.x -= 525;

	for (obj in [iconP1, iconP2, healthBar, missesTxt, scoreTxt])
    	obj.y -= 75;

	for (obj in [iconP1, iconP2, healthBar, missesTxt, scoreTxt])
    	obj.x += 75;

		}
	}

for (obj in [accuracyTxt])
    obj.alpha = 0;

}

function postUpdate() {
if (PlayState.SONG.meta.name != "lighthouse") {
	if (!FlxG.save.data.xbox) {
	iconP1.x = 600;
	iconP2.x = 525;
		}
	if (FlxG.save.data.xbox) {
	iconP1.x = 200;
	iconP2.x = 125;
		}
	}
}

function stepHit(curStep:Int) { 
    if (curStep > 884 && PlayState.SONG.meta.name == "skyblue" ) {
            FlxTween.tween(iconP1, {alpha: 0}, 10);
            FlxTween.tween(iconP2, {alpha: 0}, 10);
            FlxTween.tween(healthheader, {alpha: 0}, 10);
	}    
    if (PlayState.SONG.meta.name == "misconduct") {
	iconP1.alpha = 0;
	iconP2.alpha = 0;
	healthheader.alpha = 0;
	}
    if (curStep > 63 && PlayState.SONG.meta.name == "misconduct") {	
	iconP1.alpha = 1;
	iconP2.alpha = 1;
	healthheader.alpha = 1;
	}
}

function beatHit() {
iconP1.scale.set(1, 1);
iconP2.scale.set(1, 1);
}