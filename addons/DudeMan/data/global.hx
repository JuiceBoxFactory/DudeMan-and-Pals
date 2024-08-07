import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.utils.WindowUtils;
import flixel.FlxCamera;
import flixel.util.FlxTimer;

static var volCam:FlxCamera;
static var initialized:Bool = false;
static var timeToMove = true;

function new() {

	FlxG.sound.volume = 0.5;
	FlxG.mouse.visible = false;
	// this mod has more games than the ps5 - Melty

}

function update(elapsed:Float) {

	// DEFAULT SAVE DATA.. if u wanna fck wit it !!! you can use the in-game save file editor to make changes to your actual save - Melty
	if (FlxG.save.data.defaultSaveData == null) {
		FlxG.save.data.funValue == null; // I mean. what do you THINK it does ?
		FlxG.save.data.obituaryThing = null; // this just makes the obituary shit change lol
		FlxG.save.data.selectorButtonsUnlocked = 3; // max is 5, however you can only unlock up to 3.... >:] ( 4 was originally for games, and 4 is just a scrapped thing for project 46, doesnt do anything )
		FlxG.save.data.dudemailsUnlocked = 0; // max is [number will be put here later], however you only unlock up to [number will be put here later], so fuck around to your hearts content, dataminer ! 
		FlxG.save.data.language = null; // unused multi-language support ! just didnt have the motivation to translate allat.
		FlxG.save.data.defaultSaveData = false; // well ??
	}
	// dudeman condems this behaviour - dudeman
	// I DIDNT WRITE THAT - ACTUALLY dudeman
	// yes I did - dudeman

	// DEFAULT SETTINGS ! theres not alot you can do this with lol
	if (FlxG.save.data.wheresGarfield == null) {
		// gameplay settings
		FlxG.save.data.downscroll = false;
		FlxG.save.data.dudeRating = true;
		FlxG.save.data.ghosttap = true;
		FlxG.save.data.notebounce = true;
		FlxG.save.data.middlescroll = false;
		FlxG.save.data.subtitles = true;
		FlxG.save.data.camMove = true;
		// accessibility settings
		FlxG.save.data.language == null; // ( UNUSED LOL )
		// secret settings
		FlxG.save.data.debug = false;
		FlxG.save.data.xbox = false;
		FlxG.save.data.horse = false;
		FlxG.save.data.baldiStyle = false;
		FlxG.save.data.hitsounds = false;
		FlxG.save.data.geomtery = false;
		FlxG.save.data.nightmare = false;
		FlxG.save.data.goodCamera = false;
		FlxG.save.data.MelTabs = false;
		FlxG.save.data.burger = false;
		FlxG.save.data.ascend = false;
		FlxG.save.data.sillyLanguages = false;
		FlxG.save.data.imFromBrooklyn = false;
		FlxG.save.data.angelsDream = false;
		// other settings ( mail thems and shit )
		FlxG.save.data.mailTheme = "light";
		FlxG.save.data.wheresGarfield = false;
	}

	if (FlxG.keys.justPressed.F5) {
        FlxG.resetState();
		FlxG.mouse.visible = false;
    }
}

function preStateSwitch() {
	
	FlxG.sound.soundTrayEnabled = false;
	WindowUtils.winTitle = window.title = "DudeMan and... PALS???";
	window.setIcon(Image.fromBytes(Assets.getBytes('images/modIcon.png')));

	DiscordUtil.changePresenceAdvanced({
		details: "Play My Mod",
		state: "pls",
		largeImageKey: "icon"
	});

	// the mod icon doesnt work ?? - melty
	// yes it does - corva
	// oh you're right actually it does wtf - melty	
}

function postStateSwitch() {

	volCam = new FlxCamera();
	volCam.bgColor = 0;
	FlxG.cameras.add(volCam, false);

    volBar = new FlxSprite(-200, 0);
    volBar.frames = Paths.getSparrowAtlas('DudeVOL');
	volBar.animation.addByPrefix('0', 'noVol', 24, false);
	volBar.animation.addByPrefix('0.1', '0.1', 24, false);
	volBar.animation.addByPrefix('0.2', '0.1', 24, false);
	volBar.animation.addByPrefix('0.2', '0.2', 24, false);
	volBar.animation.addByPrefix('0.3', '0.3', 24, false);
	volBar.animation.addByPrefix('0.4', '0.4', 24, false);
	volBar.animation.addByPrefix('0.5', '0.5', 24, false);
	volBar.animation.addByPrefix('0.6', '0.6', 24, false);
	volBar.animation.addByPrefix('0.7', '0.7', 24, false);
	volBar.animation.addByPrefix('0.8', '0.8', 24, false);
	volBar.animation.addByPrefix('0.9', '0.9', 24, false);
	volBar.animation.addByPrefix('1', '1', 24, false);
	volBar.animation.play(''+FlxG.sound.volume);
	volBar.antialiasing = false;
	volBar.updateHitbox();
	volBar.cameras = [volCam];
	FlxG.state.add(volBar);

    volTime = new FlxTimer();
    volTime.time = 2;
    volTime.active = false;
    FlxG.state.add(volTime);

}

// below this, is the fucking sound tray shit. steal the code I DONT CARE LOL no credit needed ! you're like drake and im your ghostwriter - melty

function postUpdate() {

	if (volBar.x < -199) {
		timeToMove = false;
	}

	if (timeToMove == true) {
		volBar.x -= 0.5;
	}

	FlxG.sound.soundTrayEnabled = false;
	if (FlxG.sound.muted == false) {
		volBar.animation.play(''+FlxG.sound.volume);
	}
	if (FlxG.sound.muted == true) {
		volBar.animation.play('0');
	}

	if (FlxG.keys.justPressed.MINUS || FlxG.keys.justPressed.NUMPADMINUS) {
		volTime.cancel();
		FlxG.sound.play(Paths.sound("Voldown"));
		timeToMove = false;
		volBar.x = 0;
		volTime.start(1, function(timer) {
			timeToMove = true;
		});
    }

	if (FlxG.keys.justPressed.ZERO || FlxG.keys.justPressed.NUMPADZERO) {
		volTime.cancel();
		timeToMove = false;
		volBar.x = 0;
		volTime.start(1, function(timer) {
			timeToMove = true;
		});
	}

	if (FlxG.keys.justPressed.PLUS || FlxG.keys.justPressed.NUMPADPLUS) {
		volTime.cancel();
		if (FlxG.sound.volume < 0.9) {
			FlxG.sound.play(Paths.sound("Volup"));
		}
		else {
			FlxG.sound.play(Paths.sound("VolMAX"));
		}
		timeToMove = false;
		volBar.x = 0;
		volTime.start(1, function(timer) {
			timeToMove = true;
		});
	}

	if (FlxG.sound.volume < 0.1) {
		FlxG.sound.volume = 0;
	}

}