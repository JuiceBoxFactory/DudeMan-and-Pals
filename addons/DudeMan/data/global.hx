import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.utils.WindowUtils;
import flixel.FlxCamera;
import flixel.util.FlxTimer;

function create() {
     invert.invert = 1;
     FlxG.game.addShader(invert);
}

static var volCam:FlxCamera;
static var initialized:Bool = false;
static var timeToMove = true;
var invert = new FunkinShader("#pragma header
    uniform float iTime;
    #define iChannel0 bitmap
    #define texture flixel_texture2D
    #define fragColor gl_FragColor
    
    uniform int invert; // 0 means no original color 1 means invert
    void main(){
    vec2 uv = openfl_TextureCoordv.xy;
    
    vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
        vec4 color = texture(iChannel0, fragCoord.xy/iResolution.xy);
        if(invert == 0) {
            fragColor = color;
        } else {
        fragColor = vec4(flixel_texture2D(iChannel0,uv).a-color.rgb,flixel_texture2D(iChannel0,uv).a);
        }
    }");
var shaderAdded = false;

function new() {

	FlxG.sound.volume = 0.5;
	FlxG.mouse.visible = false;
	// this mod has more games than the ps5 - Melty

}

function update(elapsed:Float) {

	if (shaderAdded == false && FlxG.save.data.invert == true) {
		FlxG.game.removeShader(invert);
		shaderAdded = true;
		invert.invert = 1;
		FlxG.game.addShader(invert);
	}
	else if (FlxG.save.data.invert == false) {
		shaderAdded = false;
		FlxG.game.removeShader(invert);
	}

	// DEFAULT SAVE DATA.. if u wanna fck wit it !!! you can use the in-game save file editor to make changes to your actual save, this is just more... veristile ? ( non limited ) - Melty
	if (FlxG.save.data.defaultSaveData == null) {
		FlxG.save.data.funValue = null; // I mean. what do you THINK it does ?
		FlxG.save.data.obituaryThing = null; // this just makes the obituary shit change lol
		FlxG.save.data.selectorButtonsUnlocked = 3; // only goes up to 4, 3 locks the games and 4 unlocks them
		FlxG.save.data.language = null; // unused multi-language support ! just didnt have the motivation to translate allat. spanish works on a few places and german works on the main menu, put it in "", ex: "english" or "spanish"
		FlxG.save.data.datingDialogue = null; // messing with this one will not end well probably
		resetDatingSave();
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
		FlxG.save.data.invert = false;
		// other settings ( mail thems and shit )
		FlxG.save.data.mailTheme = "light";
		FlxG.save.data.wheresGarfield = false;
	}

	if (FlxG.keys.justPressed.F5) {
        FlxG.resetState();
		FlxG.mouse.visible = false;
    }
}

function resetDatingSave() {

    FlxG.save.data.datingSave1 = "blank";
    FlxG.save.data.datingSave2 = "blank";
    FlxG.save.data.datingSave3 = "blank";
    FlxG.save.data.datingSave4 = "blank";
    FlxG.save.data.datingSave5 = "blank";
    FlxG.save.data.datingSave6 = "blank";
    FlxG.save.data.datingSave7 = "blank";
    FlxG.save.data.datingSave8 = "blank";
	FlxG.save.data.fileDesc = [];

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