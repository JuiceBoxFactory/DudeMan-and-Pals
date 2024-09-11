import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import flixel.util.FlxTimer;

var deathCam = new FlxCamera();
var curVideo = null;
var quitted = false;
var ninetyShakeDEATH = false;
var ninetyDefaultXDEATH = 0;
var ninetyDefaultYDEATH = 0;
var tmrTime = 0.15;

var chance = 0;

function create() {

	if (PlayState.SONG.meta.name != 'lo-fight') {
		cameras = [];

		FlxG.cameras.add(deathCam, false);
	
		if (chance < 49 && PlayState.SONG.meta.name != 'roomed') {
			
			deathQoutes = new FlxSprite(0, 0);
			deathQoutes.scrollFactor.set(0, 0);
			deathQoutes.loadGraphic(Paths.image('deathScreens/'+PlayState.SONG.meta.name));
			deathQoutes.cameras = [deathCam];
			add(deathQoutes);

			fuckyou = new FlxSprite(0, 0);
			fuckyou.scrollFactor.set(0, 0);
			fuckyou.loadGraphic(Paths.image('deathScreens/recovery'));
			fuckyou.cameras = [deathCam];
			fuckyou.alpha = 0;
			add(fuckyou);

		}
	
		if (PlayState.SONG.meta.name == "lighthouse") {
			chance = FlxG.random.int(0,49);
		}

		if (PlayState.SONG.meta.name == 'roomed') {
			redDEATH = new FlxSprite();
			redDEATH.makeGraphic(1920, 1080, FlxColor.RED);
			redDEATH.alpha = 0;
			redDEATH.scale.set(6, 6);
			redDEATH.cameras = [deathCam];
			redDEATH.screenCenter();
			insert(28, redDEATH);

			deathANINETY = new FlxSprite(0, 0);	
    		deathANINETY.frames = Paths.getSparrowAtlas('visuals/roomed/A-90');
    		deathANINETY.animation.addByPrefix('default', 'base', 6, false);
    		deathANINETY.animation.addByPrefix('thejumps', 'jumpscare', 24, false);
    		deathANINETY.animation.play('default');
    		deathANINETY.antialiasing = false;
    		deathANINETY.alpha = 0;
    		deathANINETY.scale.set(0.6, 0.6);
    		deathANINETY.scrollFactor.set(0, 0);
    		deathANINETY.screenCenter();
			deathANINETY.cameras = [deathCam];
    		insert(31, deathANINETY);

    		deathtopSign = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/hand'));
			deathtopSign.antialiasing = false;
			deathtopSign.updateHitbox();
    		deathtopSign.scale.set(0.3, 0.3);
    		deathtopSign.scrollFactor.set(0, 0);
    		deathtopSign.screenCenter();
    		deathtopSign.alpha = 0;
			deathtopSign.cameras = [deathCam];
			insert(30, deathtopSign);

			roomedDeath();

		}

		if (chance == 49) {
			curVideo = new FlxVideo();
			curVideo.onEndReached.remove(curVideo);
			var path = Paths.file("videos/lighthouseRoomforonemore.mp4");
			curVideo.load(Assets.getPath(path));

			var timer:FlxTimer = new FlxTimer();
			timer.start(1, curVideo.play(), 0);
			}
	}
}

function roomedDeath() {

retrySFX = "clear";

FlxG.sound.play(Paths.sound('WarningA90'), 1);

new FlxTimer().start(0.2, function(timer) {
	deathtopSign.alpha = 1;
	FlxTween.tween(deathtopSign.scale, {x: 0.4, y: 0.4}, 1, {ease:FlxEase.quintOut});
	new FlxTimer().start(tmrTime, function(timer) {
		ninetyDefaultXDEATH = deathANINETY.x;
		ninetyDefaultYDEATH = deathANINETY.y;
		FlxTween.tween(deathANINETY, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
		deathtopSign.alpha = 0;	
	}); 
		new FlxTimer().start(tmrTime, function(timer) {
			deathtopSign.alpha = 0;
			new FlxTimer().start(tmrTime, function(timer) {
				deathtopSign.alpha = 1;
				new FlxTimer().start(tmrTime, function(timer) {
					deathtopSign.alpha = 0;
					new FlxTimer().start(tmrTime, function(timer) {
						deathtopSign.alpha = 1;
						new FlxTimer().start(tmrTime, function(timer) {
							deathtopSign.alpha = 0;
							new FlxTimer().start(tmrTime, function(timer) {
								deathtopSign.alpha = 1;
								new FlxTimer().start(tmrTime, function(timer) {
									deathtopSign.alpha = 0;
									new FlxTimer().start(tmrTime, function(timer) {
										FlxG.sound.play(Paths.sound('JumpscareA90'), 1);
										ninetyShakeDEATH = true;
										redDEATH.alpha = 1;
										deathANINETY.animation.play('thejumps');
										new FlxTimer().start(tmrTime, function(timer) {
											redDEATH.alpha = 0;
											new FlxTimer().start(tmrTime, function(timer) {
												redDEATH.alpha = 1;
												new FlxTimer().start(tmrTime, function(timer) {
													redDEATH.alpha = 0;
													new FlxTimer().start(tmrTime, function(timer) {
														redDEATH.alpha = 1;
														new FlxTimer().start(tmrTime, function(timer) {
															redDEATH.alpha = 0;
															new FlxTimer().start(tmrTime, function(timer) {
																redDEATH.alpha = 1;
																new FlxTimer().start(tmrTime, function(timer) {
																	redDEATH.alpha = 0;
																									new FlxTimer().start(tmrTime, function(timer) {
																										redDEATH.alpha = 1;
																										FlxTween.tween(redDEATH, {alpha: 0}, 3, {ease:FlxEase.quartOut});
																										FlxTween.tween(deathANINETY, {alpha: 0}, 0.01, {ease:FlxEase.quartOut});
																										ninetyShakeDEATH = false;
																										new FlxTimer().start(3, function(timer) {
																											endBullshit();
																										}); 
																									}); 
																								}); 
																							}); 
																						}); 
																					}); 
																				}); 
																			}); 
																		}); 
														}); 
													}); 
												}); 
											}); 
										}); 
									}); 
								}); 
							}); 
						}); 																												

}

function update() {

	if (ninetyShakeDEATH == true) {
        deathANINETY.x = ninetyDefaultXDEATH + FlxG.random.int(-1.5, 1.5);
        deathANINETY.y = ninetyDefaultYDEATH + FlxG.random.int(-1.5, 1.5);
    }

	if (chance == 49 || PlayState.SONG.meta.name == 'roomed') {	
		lossSFX.volume = 0;
		FlxG.sound.playMusic(Paths.music('gallery'), 0);
	}

	if (controls.ACCEPT) {
		FlxTween.tween(fuckyou, {alpha: 1}, 2);
	}
	
	if (PlayState.SONG.meta.name != 'lo-fight') {
		character.alpha = 0;
	}

}
