import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;

var freeRoam = false;
var camFollowing = true;
var botplay = false;
var instructionsGone = false;
var alphaToBeINSTR = 1;
var originalZoom = 1.5;
var timeToBeAt = 0;
var buttonPressed = 0;
var unkillable = false;
var debugPaused = false;

function create() {

	if (FlxG.save.data.debug) {
	}

}

function postCreate() {

	if (FlxG.save.data.debug) {	

			pauseMusic = new FlxSound();
			pauseMusic = FlxG.sound.load(Paths.music('breakfast'), 0.2, true);
			add(pauseMusic);
			pauseMusic.play();
			pauseMusic.pause();

			welcometxt = new FlxText(10, 10, 1500, "Hi welcome to debug mode, fuck around to your hearts content !\nI'll explain some basic controls here, but you can find a more detailed explanation in the debug menu (on main menu)\nto do a debug pause, press SPACE\nto turn on botplay, press CONTROL\nto turn on freeroam, press SHIFT, BHNM to move the camera ( to avoid keybinds ), Q and E for zooming\nthings like scripts and character changes can be found in the buttons below\npress any number to skip said number seconds thru the song (excluding 0 and 7 cuz,.,. yeah LOL) (causes misses)\npress right bracket ( was running out of buttons ) to make urself UNABLE TO DIEEEE\nhappy screwing around ! press TAB to close this", 0);
     		welcometxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     		welcometxt.borderColor = 0xFF06000C;
     		welcometxt.cameras = [camHUD];
     		welcometxt.borderSize = 3;
     		add(welcometxt);

			infotxt = new FlxText(10, 500, 1500, "shit.,,. idk man\n========\nBotplay:\nFreeroam:\nsongPosition:\nuiType:\nPaused:", 0);
			infotxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			infotxt.borderColor = 0xFF06000C;
			infotxt.cameras = [camHUD];
			infotxt.borderSize = 3;
     		add(infotxt);

	}
}

function postUpdate() {

	if (FlxG.save.data.debug) {	
		infotxt.text = "shit.,,. idk man\n========\nBotplay: "+botplay+"\nFreeroam: "+freeRoam+"\nsongPosition: "+CoolUtil.quantize(Conductor.songPosition * 100, 1)+"\nuiType: "+PlayState.SONG.meta.noteType+"\nPaused: "+debugPaused;

		if (debugPaused == true) {
			Conductor.songPosition = timeToBeAt;
			inst.time = timeToBeAt;
			vocals.time = timeToBeAt;
			inst.volume = 0;
			vocals.volume = 0;
		}
	
		if (unkillable == true && health < 0.1) {
			health = 0.1;
		}
	
		if (FlxG.save.data.debug) {
	
			if (botplay == true) {
				player.cpu = true;
			}
	
			if (botplay == false) {
				player.cpu = false;
			}
	
			if (FlxG.keys.justPressed.SPACE && debugPaused == false) {
				new FlxTimer().start(0.10, function(timer) {
					debugPaused = true;
					pauseMusic.resume();
					timeToBeAt = Conductor.songPosition;
				});
			}
			if (FlxG.keys.justPressed.SPACE && debugPaused == true) {
				new FlxTimer().start(0.10, function(timer) {
					debugPaused = false;
					pauseMusic.pause();
					inst.volume = 1;
					vocals.volume = 1;
				});
			}
	
			if (FlxG.keys.justPressed.RBRACKET && unkillable == false) {
				new FlxTimer().start(0.10, function(timer) {
					unkillable = true;
				});
			}
			if (FlxG.keys.justPressed.RBRACKET && unkillable == true) {
				new FlxTimer().start(0.10, function(timer) {
					unkillable = false;
				});
			}
			if (FlxG.keys.justPressed.ONE) {
				Conductor.songPosition += 1000;
				inst.time += 1000;
				vocals.time += 1000;
			}
			if (FlxG.keys.justPressed.TWO) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.THREE) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.FOUR) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.FIVE) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.SIX) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.EIGHT) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
			if (FlxG.keys.justPressed.NINE) {
				Conductor.songPosition += 2000;
				inst.time += 2000;
				vocals.time += 2000;
			}
	
			if (welcometxt.alpha > alphaToBeINSTR) {
				welcometxt.alpha -= 0.05;
			}
	
			if (welcometxt.alpha < alphaToBeINSTR) {
				welcometxt.alpha += 0.05;
			}
	
			if (FlxG.keys.pressed.TAB && instructionsGone == false) {
				new FlxTimer().start(0.10, function(timer) {
					instructionsGone = true;
					alphaToBeINSTR = 0;
				});
			}
			if (FlxG.keys.pressed.TAB && instructionsGone == true) {
				new FlxTimer().start(0.10, function(timer) {
					instructionsGone = false;
					alphaToBeINSTR = 1;
				});
			}
	
			if (FlxG.keys.justPressed.CONTROL && botplay == false) {
				new FlxTimer().start(0.10, function(timer) {
					botplay = true;			
				});
			}
			if (FlxG.keys.justPressed.CONTROL && botplay == true) {
				new FlxTimer().start(0.10, function(timer) {
					botplay = false;		
				});
			}
	
			if (FlxG.keys.pressed.H && freeRoam == true) {
				camGame.scroll.y -= 2;
			}
			if (FlxG.keys.pressed.N && freeRoam == true) {
				camGame.scroll.y += 2;
			}
			if (FlxG.keys.pressed.B && freeRoam == true) {
				camGame.scroll.x -= 2;
			}
			if (FlxG.keys.pressed.M && freeRoam == true) {
				camGame.scroll.x += 2;
			}
			if (FlxG.keys.pressed.Q && freeRoam == true) {
				defaultCamZoom -= 0.01;
				FlxG.camera.zoom -= 0.01;
			}
			if (FlxG.keys.pressed.E && freeRoam == true) {
				defaultCamZoom += 0.01;
				FlxG.camera.zoom += 0.01;
			}
	
			if (camFollowing == false) {
				FlxG.camera.followLerp = 0;
			}
			if (camFollowing == true) {
				FlxG.camera.followLerp = 0.04;
			}
			
			if (FlxG.keys.justPressed.SHIFT && freeRoam == false) {
				new FlxTimer().start(0.10, function(timer) {
					camZooming = false;
					camFollowing = false;
					freeRoam = true;
					originalZoom = defaultCamZoom;
				});
			}
			if (FlxG.keys.justPressed.SHIFT && freeRoam == true) {
				new FlxTimer().start(0.10, function(timer) {
					camZooming = true;
					camFollowing = true;
					freeRoam = false;
					defaultCamZoom = originalZoom;
				});
			}	
		}
	}
}