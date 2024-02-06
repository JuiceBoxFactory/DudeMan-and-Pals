import flixel.addons.display.FlxBackdrop;

var time = 0;

function create() {


	remove(dad);
	remove(boyfriend);
	
	bg1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/bg'));
	bg1.antialiasing = false;
	bg1.alpha = 1;
	bg1.updateHitbox();
	add(bg1);
	
	topScroll1 = new FlxBackdrop(Paths.image('backdrop/lighthoused/topscroll')); 
	topScroll1.moves = true;
	topScroll1.scrollFactor.set(0, 0);
	topScroll1.velocity.x = 10; // you can adjust the values to make the scrolling faster or lower
	topScroll1.velocity.y = 0;
	topScroll1.active = true;
	topScroll1.y = -600;
	add(topScroll1);

	light1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/light'));
	light1.antialiasing = false;
	light1.alpha = 1;
	light1.updateHitbox();
	add(light1);

	lighthouseBase1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/lighthouseBase'));
	lighthouseBase1.antialiasing = false;
	lighthouseBase1.alpha = 1;
	lighthouseBase1.updateHitbox();
	add(lighthouseBase1);

	lighthouseTop1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/lighthouseTop'));
	lighthouseTop1.antialiasing = false;
	lighthouseTop1.alpha = 1;
	lighthouseTop1.updateHitbox();
	add(lighthouseTop1);

	backRails1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/backrails'));
	backRails1.antialiasing = false;
	backRails1.alpha = 1;
	backRails1.updateHitbox();
	add(backRails1);
		
	add(dad);
	add(boyfriend);

	frontRails1 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/frontrails'));
	frontRails1.antialiasing = false;
	frontRails1.alpha = 1;
	frontRails1.updateHitbox();
	add(frontRails1);

	bottomScroll1 = new FlxBackdrop(Paths.image('backdrop/lighthoused/bottomscroll')); 
	bottomScroll1.moves = true;
	bottomScroll1.scrollFactor.set(0, 0);
	bottomScroll1.velocity.x = 25; // you can adjust the values to make the scrolling faster or lower
	bottomScroll1.velocity.y = 0;
	bottomScroll1.active = true;
	bottomScroll1.y = -300;
	add(bottomScroll1);

	overlay = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/lighthoused/overlay'));
	overlay.antialiasing = false;
	overlay.alpha = 1;
	overlay.updateHitbox();
	add(overlay);

	blackCam = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackCam.antialiasing = false;
	blackCam.alpha = 1;
	blackCam.screenCenter();
	blackCam.scale.set(6,6);
	blackCam.updateHitbox();
	add(blackCam);

	blackHUD = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackHUD.antialiasing = false;
	blackHUD.alpha = 1;
	blackHUD.screenCenter();
	blackHUD.cameras = [camHUD];
	blackHUD.scale.set(6,6);
	blackHUD.updateHitbox();
	add(blackHUD);

	foggyOverlay = new FlxSprite(0, 0);
	foggyOverlay.frames = Paths.getSparrowAtlas('visuals/lh/foggy');
	foggyOverlay.antialiasing = false;
	foggyOverlay.animation.addByPrefix('1', 'foggy idle', 4);
	foggyOverlay.animation.play('1');
	foggyOverlay.updateHitbox();
    	foggyOverlay.alpha = 0;
    	foggyOverlay.scale.set(3, 3);
    	foggyOverlay.scrollFactor.set(0, 0);
	foggyOverlay.updateHitbox();
	add(foggyOverlay);

}

function onCountdown(e) {
	e.cancel();
}

function update(delta:Float) {
    time += delta;
    light1.alpha = light1.alpha + Math.cos(time * 10) * 0.01 / 2;
}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 128:
            FlxTween.tween(blackHUD, {alpha: 0}, 1);
            FlxTween.tween(blackCam, {alpha: 0}, 2);
	case 384:
	    FlxG.camera.flash(0xFF000000, 1);
    	    foggyOverlay.alpha = 0.4;
	case 640:
            FlxTween.tween(blackHUD, {alpha: 1}, 3);
            FlxTween.tween(blackCam, {alpha: 1}, 3);
	case 704:
	    FlxG.camera.flash(0xFF000000, 1);
            blackHUD.alpha = 0;
            blackCam.alpha = 0;
	}
}