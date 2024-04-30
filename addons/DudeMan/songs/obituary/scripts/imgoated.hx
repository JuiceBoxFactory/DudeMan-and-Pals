function create() {

//	boyfriend.scale.set(2.3,2.3);
//	boyfriend.x += 650;
//	boyfriend.y += 50;
//	boyfriend.cameraOffset.set(-1250,0);


	logo = new FlxSprite(345, -1200).loadGraphic(Paths.image('songLogos/free4me'));
	logo.antialiasing = false;
	logo.scrollFactor.set(1, 1);
	logo.scale.set(1.2, 1.2);
	logo.alpha = 1;
	logo.cameras = [camHUD];
	logo.updateHitbox();
	insert(40, logo);
	

bgImEvil = new FlxSprite().loadGraphic(Paths.image('backdrop/FREE5ME/obituarybg'));
    bgImEvil.alpha = 0;
    bgImEvil.scale.set(1.3,1.3);
    insert(4, bgImEvil);

    couchImEvil = new FlxSprite().loadGraphic(Paths.image('backdrop/FREE5ME/couchurary'));
    couchImEvil.alpha = 0;
    couchImEvil.scale.set(1.3,1.3);
    insert(6, couchImEvil);

    FlxG.camera.followLerp = 0;
    camGame.scroll.x = 250;
}
function postCreate() {
    FlxG.camera.followLerp = 0;
    camGame.scroll.x = 250;
}
function onDadHit(event) {
	if (881 < curStep) {
		if (health > 0.1) {
		health -= 0.02;
			}
		}
}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0:
			FlxTween.tween(logo, {y: 110}, 2, {ease:FlxEase.quartOut});	
            new FlxTimer().start(3, function(timer) {
                FlxTween.tween(logo, {y: -1200}, 2, {ease:FlxEase.quartIn});
            });
case 1020:
	  FlxG.camera.followLerp = 0.04;
          bgImEvil.alpha = 1;
          couchImEvil.alpha = 1;
	}
}


