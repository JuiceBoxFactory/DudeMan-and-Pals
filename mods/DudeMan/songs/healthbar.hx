var ough:FlxSprite;

function postCreate(){

	remove(iconP1);
	remove(iconP2);
	remove(healthBarBG);
	remove(healthBar);

	healthheader = new FlxSprite(347, 580).loadGraphic(Paths.image('game/healthBarPART2'));
	healthheader.antialiasing = false;
	healthheader.cameras = [camHUD];
	healthheader.setGraphicSize(Std.int(healthheader.width * 1));
	healthheader.updateHitbox();
	insert(51, healthheader);

	insert(52, iconP1);
	insert(52, iconP2);
	insert(20, healthBar);
	insert(20, healthBarBG);


for (obj in [healthBar, healthBarBG])
    obj.y -= 10;


for (obj in [iconP1, iconP2,])
    obj.y += 10;

for (obj in [accuracyTxt])
    obj.alpha = 0;

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

	}
}

function postUpdate(){
	if (!FlxG.save.data.xbox) {
	iconP1.x = 595;
	iconP2.x = 525;
	}
	if (FlxG.save.data.xbox) {
	iconP1.x = 125;
	iconP2.x = 50;
	}

}

function beatHit() {
iconP1.scale.set(1, 1);
iconP2.scale.set(1, 1);
}