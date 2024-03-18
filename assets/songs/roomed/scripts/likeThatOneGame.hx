var stage:Stage = null;
function create() {

	remove(dad);
	remove(boyfriend);

lockerbehind = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/cabBG'));
    lockerbehind.updateHitbox();
    lockerbehind.alpha = 0;
    lockerbehind.antialiasing = false;
    lockerbehind.scale.set(1, 1);
    lockerbehind.scrollFactor.set(1, 1);
    add(lockerbehind);

    pixeloverlay = new FlxSprite(-150, -150).loadGraphic(Paths.image('visuals/roomed/overlay'));
    pixeloverlay.updateHitbox();
    pixeloverlay.alpha = 0;
    pixeloverlay.antialiasing = false;
    pixeloverlay.scale.set(1, 1);
    pixeloverlay.cameras = [camHUD];
    pixeloverlay.scrollFactor.set(0, 0);
    add(pixeloverlay);

    add(dad);
    add(boyfriend);

    lockercover = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/locker'));
    lockercover.updateHitbox();
    lockercover.alpha = 0;
    lockercover.antialiasing = false;
    lockercover.scale.set(1, 1);
    lockercover.scrollFactor.set(1, 1);
    add(lockercover);

}

function postCreate() {

    black = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
    black.updateHitbox();
    black.alpha = 1;
    black.antialiasing = false;
    black.scale.set(3, 3);
    black.scrollFactor.set(0, 0);
    black.cameras = [camHUD];
    black.updateHitbox();
    insert(35,black);

    nindy = new FlxSprite(0, 20);
    nindy.frames = Paths.getSparrowAtlas('visuals/roomed/90');
    nindy.antialiasing = false;
    nindy.animation.addByPrefix('1', '90 blank', 12);
    nindy.animation.addByPrefix('2', '90 anim', 12);
    nindy.animation.addByPrefix('3', '90 jump', 12);
    nindy.animation.play('1');
    nindy.scrollFactor.set(0, 0);
    nindy.cameras = [camHUD];
    nindy.updateHitbox();
    nindy.alpha = 1;
    add(nindy);

}

function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}
function stepHit(curStep:Int) { 
    switch (curStep) {
    case 96:
      FlxTween.tween(black, {alpha:0}, 15);
    case 384:
    black.alpha = 1;
    case 504:
      FlxTween.tween(black, {alpha:0}, 1);
    case 1273:
      nindy.animation.play('2');
    case 1281:
      black.alpha = 1;
    case 1300:
      nindy.animation.play('1');
    case 1395:
      FlxTween.tween(black, {alpha:0}, 1);	
    case 1405:
      FlxTween.tween(black, {alpha:0}, 1);	
    case 1664:
	 FlxG.camera.flash(0xFFFFFFFF, 1);
      pixeloverlay.alpha = 1;
      FlxTween.tween(camGame.zoom = 1.5);		
    case 1920:
        FlxG.camera.flash(0xFFFFFFFF, 1);
        pixeloverlay.alpha = 0;	
    case 1732:
      FlxTween.tween(camGame.zoom = 1.5);		
    case 1934:
	FlxTween.tween(boyfriend, {x: -800}, 4);	
    case 2020:
	  FlxTween.tween(boyfriend, {x: 800}, 1);
    black.alpha = 1;
    case 2048:
    	lockerbehind.alpha = 1;
     lockercover.alpha = 1;
     black.alpha = 0;
    case 2552:
     nindy.animation.play('2');
    case 2560:
    		black.alpha = 1;
    case 2570:
           nindy.animation.play('1');
    case 2576:
           nindy.animation.play('3');
    case 2591:
           nindy.animation.play('1');
    case 2304:
	      FlxG.camera.flash(0xFFFFFFFF, 1);	
      }
}