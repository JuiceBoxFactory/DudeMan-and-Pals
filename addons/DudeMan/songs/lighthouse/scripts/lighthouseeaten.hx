import flixel.addons.display.FlxBackdrop;

var time = 0;
var section2 = false;
var myPpo = "";
var myOpp = "";

function create() {

	remove(boyfriend);
	
	bg1 = new FlxSprite(-500, -300).loadGraphic(Paths.image('backdrop/lighthoused/bg'));
	bg1.antialiasing = false;
	bg1.scrollFactor.set(0, 0);
	bg1.scale.set(3, 3);
	bg1.alpha = 1;
	bg1.updateHitbox();
	add(bg1);

	bottomScroll3 = new FlxBackdrop(Paths.image('backdrop/lighthoused/bottom3')); 
	bottomScroll3.moves = true;
	bottomScroll3.scrollFactor.set(0, 0);
	bottomScroll3.velocity.x = 10; // you can adjust the values to make the scrolling faster or lower
	bottomScroll3.velocity.y = 0;
	bottomScroll3.active = true;
	bottomScroll3.y = -100;
	add(bottomScroll3);
	
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

	bigbob = new Character(750, 150, "bigbob");
	bigbob.flipX = false; 
	bigbob.alpha = 0;
	add(bigbob);
	bigbob2 = new Character(750, 150, "bigbob2");
	bigbob2.flipX = false; 
	bigbob2.alpha = 0;
	add(bigbob2);

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
		
	hen2 = new Character(-750, 100, "hen2");
	hen2.flipX = false; 
	hen2.alpha = 0;
	add(hen2);
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

	overlay = new FlxSprite(-500, -300).loadGraphic(Paths.image('backdrop/lighthoused/overlay'));
	overlay.scrollFactor.set(0, 0);
	overlay.antialiasing = false;
    	overlay.scale.set(3, 3);
	overlay.alpha = 1;
	overlay.updateHitbox();
	add(overlay);

	ArmsR = new FlxSprite(800, 0);
	ArmsR.frames = Paths.getSparrowAtlas('visuals/lh/bobHandsRight');
	ArmsR.antialiasing = false;
	ArmsR.animation.addByPrefix('1', 'bobHandsRight idle', 6);
	ArmsR.animation.play('1');
    ArmsR.alpha = 1;
    ArmsR.scale.set(1.2, 1);
    ArmsR.cameras = [camHUD];
    ArmsR.scrollFactor.set(0, 0);
	ArmsR.updateHitbox();
	add(ArmsR);

	ArmsL = new FlxSprite(-800, 0);
	ArmsL.frames = Paths.getSparrowAtlas('visuals/lh/bobHandsLeft');
	ArmsL.antialiasing = false;
	ArmsL.animation.addByPrefix('1', 'bobHandsLeft idle', 6);
	ArmsL.animation.play('1');
    ArmsL.alpha = 1;
    ArmsL.scale.set(1.3, 1);
    ArmsL.cameras = [camHUD];
    ArmsL.scrollFactor.set(0, 0);
	ArmsL.updateHitbox();
	add(ArmsL);
	
	if (FlxG.save.data.downscroll) {
		ArmsL.y = -450;
		ArmsR.y = -450;
	}

	blackCam = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackCam.antialiasing = false;
	blackCam.alpha = 1;
	blackCam.screenCenter();
	blackCam.scale.set(6,6);
	blackCam.updateHitbox();
	add(blackCam);

	foggyOverlay = new FlxSprite(-600, -400);
	foggyOverlay.frames = Paths.getSparrowAtlas('visuals/lh/foggy');
	foggyOverlay.antialiasing = false;
	foggyOverlay.animation.addByPrefix('1', 'foggy idle', 4);
	foggyOverlay.animation.play('1');
	foggyOverlay.updateHitbox();
    	foggyOverlay.alpha = 0;
    	foggyOverlay.scale.set(10, 10);
    	foggyOverlay.scrollFactor.set(0, 0);
	foggyOverlay.updateHitbox();
	add(foggyOverlay);

	foggyEnding = new FlxSprite(0, 0);
	foggyEnding.frames = Paths.getSparrowAtlas('visuals/lh/foggy');
	foggyEnding.antialiasing = false;
	foggyEnding.animation.addByPrefix('1', 'foggy idle', 4);
	foggyEnding.animation.play('1');
	foggyEnding.updateHitbox();
    	foggyEnding.alpha = 0;
	foggyEnding.cameras = [camHUD];
    	foggyEnding.scale.set(3, 3);
    	foggyEnding.scrollFactor.set(0, 0);
	foggyEnding.updateHitbox();
	add(foggyEnding);

	bulbbreak = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/lh/beforebreak'));
	bulbbreak.antialiasing = false;
	bulbbreak.scrollFactor.set(0 ,0);
	bulbbreak.alpha = 0;
	bulbbreak.scale.set(0.85, 0.85);
	bulbbreak.cameras = [camHUD];
	bulbbreak.screenCenter();
	bulbbreak.x += 125;
	bulbbreak.updateHitbox();
	add(bulbbreak);

}

function postCreate() {

	icon1 = new FlxSprite(0, 0).loadGraphic(Paths.image('icons/'+myPpo));
	icon1.antialiasing = false;
	icon1.flipX = true;
	icon1.cameras = [camHUD];
	icon1.alpha = 0;
	icon1.updateHitbox();
	add(icon1);

	icon2 = new FlxSprite(0, 0).loadGraphic(Paths.image('icons/'+myOpp));
	icon2.antialiasing = false;
	icon2.cameras = [camHUD];
	icon2.updateHitbox();
	add(icon2);

	blackHUD = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackHUD.antialiasing = false;
	blackHUD.alpha = 1;
	blackHUD.screenCenter();
	blackHUD.cameras = [camHUD];
	blackHUD.scale.set(6,6);
	blackHUD.updateHitbox();
	add(blackHUD);

	for (dumbBullShit in [healthBar, healthBarBG, scoreTxt, missesTxt]) {
		dumbBullShit.y -= 15; 
		scoreTxt.y -= 20;
		missesTxt.y -= 20;
	}

}

function onCountdown(e) {
	e.cancel();
}

function onPlayerHit(event) {
	hen2.playSingAnim(event.direction);
}               
function onDadHit(event) {
	bigbob.playSingAnim(event.direction);
	bigbob2.playSingAnim(event.direction);
	if (health > 0.1) {
	health -= 0.03;
	}
}

function update(delta:Float) {
    time += delta;
    light1.alpha = light1.alpha + Math.cos(time * 10) * 0.01 / 2;
}

function postUpdate(){

	iconP1.alpha = 0;
	iconP2.alpha = 0;

	icon1.x = iconP1.x;
	icon1.y = iconP1.y;
	icon2.x = iconP2.x;
	icon2.y = iconP2.y;

	myOpp = dad.getIcon();
	myPpo = boyfriend.getIcon();

	if (health < 0.5) {
		icon1.loadGraphic(Paths.image('icons/'+myPpo+'-losing'));
		icon2.loadGraphic(Paths.image('icons/'+myOpp));
		icon1.x = iconP1.x + FlxG.random.int(-1.5, 1.5);
		icon1.y = iconP1.y + FlxG.random.int(-1.5, 1.5);
	}
	else if (health > 1.5) {
		icon1.loadGraphic(Paths.image('icons/'+myPpo));
		icon2.loadGraphic(Paths.image('icons/'+myOpp+'-losing'));
	}
	else {
		icon1.loadGraphic(Paths.image('icons/'+myPpo));
		icon2.loadGraphic(Paths.image('icons/'+myOpp));
	}

if (section2 == true) {
	if (curCameraTarget == 0) { 
		defaultCamZoom = 0.65;
		} 
	else { 
		defaultCamZoom = 1.1; 
		}
	}
}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 128:
			icon1.alpha = 1;
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
	    light1.loadGraphic(Paths.image('backdrop/lighthoused/light2'));
	    light1.x = -500;
	    lighthouseBase1.loadGraphic(Paths.image('backdrop/lighthoused/lighthouseBase2'));
	    lighthouseTop1.loadGraphic(Paths.image('backdrop/lighthoused/lighthouseTop2'));
	    backRails1.loadGraphic(Paths.image('backdrop/lighthoused/backrails2'));
	    frontRails1.loadGraphic(Paths.image('backdrop/lighthoused/frontrails2'));
	    bigbob.alpha = 1;
	    hen2.alpha = 1;
	    section2 = true;
	case 705:
	    remove(dad);
	    remove(boyfriend);
	case 1216:
            FlxTween.tween(ArmsL, {x: -20}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(ArmsR, {x: -240}, 2, {ease:FlxEase.quartOut});
	case 1968:
            FlxTween.tween(bulbbreak, {alpha: 1}, 1.2, {ease:FlxEase.quartOut});
	case 1980:
		camHUD.zoom += 0.4;
	       bulbbreak.loadGraphic(Paths.image('visuals/lh/afterbreak'));
	case 1983:
	    defaultCamZoom = 0.80;
	    section2 = false;
	    bigbob.alpha = 0;
	    hen2.alpha = 0;
	    bigbob2.alpha = 1;
	    bottomScroll3.alpha = 1;
	    lighthouseBase1.loadGraphic(Paths.image('backdrop/lighthoused/lighthouseBase3'));
	    light1.alpha = 0;
	    lighthouseTop1.alpha = 0;
	    ArmsL.alpha = 0;
	    ArmsR.alpha = 0;
	    bottomScroll1.alpha = 0;
	    backRails1.alpha = 0;
	    frontRails1.alpha = 0;
	case 1986:
	    remove(boyfriend);
	    remove(dad);
         FlxTween.tween(bulbbreak, {alpha: 0}, 0.2, {ease:FlxEase.quartOut});
	case 2496:
//		bulbbreak.scale.set(1, 1);
//		 bulbbreak.alpha = 1;
//	      bulbbreak.loadGraphic(Paths.image('visuals/lh/ending'));
//		bulbbreak.screenCenter();
//		bulbbreak.y += 76;
//		bulbbreak.x += 119;
           FlxTween.tween(foggyEnding, {alpha: 1}, 4);
	case 2528:
//		blackCam.alpha = 1;
		bulbbreak.alpha = 0;
	}
}