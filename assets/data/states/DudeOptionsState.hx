// my melts.
import funkin.options.keybinds.ChangeKeybindSubState;
import funkin.options.keybinds.KeybindSetting;
import funkin.options.keybinds.KeybindsOptions;
import funkin.options.Options;
import haxe.io.Path;
import openfl.text.TextField;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import funkin.game.HealthIcon;
import funkin.savedata.FunkinSave;
import haxe.Json;
import flixel.FlxSubState;
import funkin.backend.system.Controls;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
import flixel.util.FlxTimer;

var Selected1 = 0;
var SelectedGameplay = 0;
var SelectedSecret = 0;
var subStateOpen = false;
var MainOptionsOpen = true;
var GameplayOptionsOpen = false;
var ApperanceOptionsOpen = false;
var SecretOptionsOpen = false;

function new() { 
    	   DiscordUtil.changePresence("goat, u in options", null);
}

function create() {

// DEFAULT SETTINGS WHEN YOU FIRST OPEN THE GAME
	if (FlxG.save.data.wheresGarfield == null) {
		resetSettings();
	}
	
	uiCamera = new FlxCamera(0, 25, 5080, 5020);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);

	borderCamera = new FlxCamera(0, 0, 1280, 720);
	borderCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(borderCamera, false);

}

function postCreate() {

	FlxG.sound.playMusic(Paths.music('OptionsLoop'), 1, true);

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	Controls = new FlxText();
	Controls.text = "Keybinds";
	Controls.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Controls.x = 180;
	Controls.y = 175;
	Controls.cameras = [uiCamera];
	Controls.color = 0xFFFFFFFF;
	Controls.borderColor = 0xFF000000;
	Controls.antialiasing = false;
	Controls.borderSize = 3;
	add(Controls);

	Gameplay = new FlxText();
	Gameplay.text = "Gameplay >";
	Gameplay.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Gameplay.x = 180;
	Gameplay.y = 325;
	Gameplay.cameras = [uiCamera];
	Gameplay.color = 0xFFFFFFFF;
	Gameplay.borderColor = 0xFF000000;
	Gameplay.antialiasing = false;
	Gameplay.borderSize = 3;
	add(Gameplay);

		Downscroll = new FlxText();
		Downscroll.text = "Downscroll";
		Downscroll.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Downscroll.x = 180;
		Downscroll.y = 125;
		Downscroll.cameras = [uiCamera];
		Downscroll.color = 0xFFFFFFFF;
		Downscroll.borderColor = 0xFF000000;
		Downscroll.antialiasing = false;
		Downscroll.alpha = 0;
		Downscroll.borderSize = 3;
		add(Downscroll);

		checkboxDownscroll = new FlxSprite(325, 10);	
		checkboxDownscroll.frames = Paths.getSparrowAtlas('options/checked');
		checkboxDownscroll.animation.addByPrefix('selected', 'yes', 6);
		checkboxDownscroll.animation.addByPrefix('disselected', 'no', 6);
		checkboxDownscroll.animation.play('disselected');
		checkboxDownscroll.scale.set(0.3, 0.3);
		checkboxDownscroll.antialiasing = false;
		checkboxDownscroll.alpha = 1;
		checkboxDownscroll.scrollFactor.set(1, 1);
		checkboxDownscroll.cameras = [uiCamera];
		add(checkboxDownscroll);

		Botplay = new FlxText();
		Botplay.text = "Botplay";
		Botplay.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Botplay.x = 180;
		Botplay.y = 220;
		Botplay.cameras = [uiCamera];
		Botplay.color = 0xFFFFFFFF;
		Botplay.borderColor = 0xFF000000;
		Botplay.antialiasing = false;
		Botplay.alpha = 0;
		Botplay.borderSize = 3;
		add(Botplay);

		checkboxBotplay = new FlxSprite(250, 110);	
		checkboxBotplay.frames = Paths.getSparrowAtlas('options/checked');
		checkboxBotplay.animation.addByPrefix('selected', 'yes', 6);
		checkboxBotplay.animation.addByPrefix('disselected', 'no', 6);
		checkboxBotplay.animation.play('disselected');
		checkboxBotplay.scale.set(0.3, 0.3);
		checkboxBotplay.antialiasing = false;
		checkboxBotplay.alpha = 1;
		checkboxBotplay.scrollFactor.set(1, 1);
		checkboxBotplay.cameras = [uiCamera];
		add(checkboxBotplay);

		GhostTapping = new FlxText();
		GhostTapping.text = "Ghost Tapping";
		GhostTapping.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		GhostTapping.x = 180;
		GhostTapping.y = 320;
		GhostTapping.cameras = [uiCamera];
		GhostTapping.color = 0xFFFFFFFF;
		GhostTapping.borderColor = 0xFF000000;
		GhostTapping.antialiasing = false;
		GhostTapping.alpha = 0;
		GhostTapping.borderSize = 3;
		add(GhostTapping);

		checkboxGhostTapping = new FlxSprite(400, 210);	
		checkboxGhostTapping.frames = Paths.getSparrowAtlas('options/checked');
		checkboxGhostTapping.animation.addByPrefix('selected', 'yes', 6);
		checkboxGhostTapping.animation.addByPrefix('disselected', 'no', 6);
		checkboxGhostTapping.animation.play('disselected');
		checkboxGhostTapping.scale.set(0.3, 0.3);
		checkboxGhostTapping.antialiasing = false;
		checkboxGhostTapping.alpha = 1;
		checkboxGhostTapping.scrollFactor.set(1, 1);
		checkboxGhostTapping.cameras = [uiCamera];
		add(checkboxGhostTapping);

		NoteBounce = new FlxText();
		NoteBounce.text = "Note Bounce";
		NoteBounce.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		NoteBounce.x = 180;
		NoteBounce.y = 420;
		NoteBounce.cameras = [uiCamera];
		NoteBounce.color = 0xFFFFFFFF;
		NoteBounce.borderColor = 0xFF000000;
		NoteBounce.antialiasing = false;
		NoteBounce.alpha = 0;
		NoteBounce.borderSize = 3;
		add(NoteBounce);

		checkboxNoteBounce = new FlxSprite(360, 310);	
		checkboxNoteBounce.frames = Paths.getSparrowAtlas('options/checked');
		checkboxNoteBounce.animation.addByPrefix('selected', 'yes', 6);
		checkboxNoteBounce.animation.addByPrefix('disselected', 'no', 6);
		checkboxNoteBounce.animation.play('disselected');
		checkboxNoteBounce.scale.set(0.3, 0.3);
		checkboxNoteBounce.antialiasing = false;
		checkboxNoteBounce.alpha = 1;
		checkboxNoteBounce.scrollFactor.set(1, 1);
		checkboxNoteBounce.cameras = [uiCamera];
		add(checkboxNoteBounce);

		MiddleScroll = new FlxText();
		MiddleScroll.text = "Middle Scroll";
		MiddleScroll.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		MiddleScroll.x = 180;
		MiddleScroll.y = 520;
		MiddleScroll.cameras = [uiCamera];
		MiddleScroll.color = 0xFFFFFFFF;
		MiddleScroll.borderColor = 0xFF000000;
		MiddleScroll.antialiasing = false;
		MiddleScroll.alpha = 0;
		MiddleScroll.borderSize = 3;
		add(MiddleScroll);

		checkboxMiddleScroll = new FlxSprite(380, 405);	
		checkboxMiddleScroll.frames = Paths.getSparrowAtlas('options/checked');
		checkboxMiddleScroll.animation.addByPrefix('selected', 'yes', 6);
		checkboxMiddleScroll.animation.addByPrefix('disselected', 'no', 6);
		checkboxMiddleScroll.animation.play('disselected');
		checkboxMiddleScroll.scale.set(0.3, 0.3);
		checkboxMiddleScroll.antialiasing = false;
		checkboxMiddleScroll.alpha = 1;
		checkboxMiddleScroll.scrollFactor.set(1, 1);
		checkboxMiddleScroll.cameras = [uiCamera];
		add(checkboxMiddleScroll);

		Subtitles = new FlxText();
		Subtitles.text = "Subtitles";
		Subtitles.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Subtitles.x = 180;
		Subtitles.y = 620;
		Subtitles.cameras = [uiCamera];
		Subtitles.color = 0xFFFFFFFF;
		Subtitles.borderColor = 0xFF000000;
		Subtitles.antialiasing = false;
		Subtitles.alpha = 0;
		Subtitles.borderSize = 3;
		add(Subtitles);

		checkboxSubtitles = new FlxSprite(290, 505);	
		checkboxSubtitles.frames = Paths.getSparrowAtlas('options/checked');
		checkboxSubtitles.animation.addByPrefix('selected', 'yes', 6);
		checkboxSubtitles.animation.addByPrefix('disselected', 'no', 6);
		checkboxSubtitles.animation.play('disselected');
		checkboxSubtitles.scale.set(0.3, 0.3);
		checkboxSubtitles.antialiasing = false;
		checkboxSubtitles.alpha = 1;
		checkboxSubtitles.scrollFactor.set(1, 1);
		checkboxSubtitles.cameras = [uiCamera];
		add(checkboxSubtitles);

		camMove = new FlxText();
		camMove.text = "camMove";
		camMove.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		camMove.x = 180;
		camMove.y = 720;
		camMove.cameras = [uiCamera];
		camMove.color = 0xFFFFFFFF;
		camMove.borderColor = 0xFF000000;
		camMove.antialiasing = false;
		camMove.alpha = 0;
		camMove.borderSize = 3;
		add(camMove);

		checkboxcamMove = new FlxSprite(280, 605);	
		checkboxcamMove.frames = Paths.getSparrowAtlas('options/checked');
		checkboxcamMove.animation.addByPrefix('selected', 'yes', 6);
		checkboxcamMove.animation.addByPrefix('disselected', 'no', 6);
		checkboxcamMove.animation.play('disselected');
		checkboxcamMove.scale.set(0.3, 0.3);
		checkboxcamMove.antialiasing = false;
		checkboxcamMove.alpha = 1;
		checkboxcamMove.scrollFactor.set(1, 1);
		checkboxcamMove.cameras = [uiCamera];
		add(checkboxcamMove);

//	Appearance = new FlxText();
//	Appearance.text = "Debug Mode >";
//	Appearance.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
//	Appearance.x = 180;
//	Appearance.y = 375;
//	Appearance.cameras = [uiCamera];
//	Appearance.color = 0xFFFFFFFF;
//	Appearance.borderColor = 0xFF000000;
//	Appearance.antialiasing = false;
//	Appearance.borderSize = 3;

	Secret = new FlxText();
	Secret.text = "Secret Settings >";
	Secret.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Secret.x = 180;
	Secret.y = 475;
	Secret.cameras = [uiCamera];
	Secret.color = 0xFFFFFFFF;
	Secret.borderColor = 0xFF000000;
	Secret.antialiasing = false;
	Secret.borderSize = 3;
	add(Secret);

		DebugMode = new FlxText();
		DebugMode.text = "Debug Mode";
		DebugMode.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		DebugMode.x = 180;
		DebugMode.y = 125;
		DebugMode.cameras = [uiCamera];
		DebugMode.color = 0xFFFFFFFF;
		DebugMode.borderColor = 0xFF000000;
		DebugMode.antialiasing = false;
		DebugMode.alpha = 0;
		DebugMode.borderSize = 3;
		add(DebugMode);

		checkboxDebugMode = new FlxSprite(360, 10);	
		checkboxDebugMode.frames = Paths.getSparrowAtlas('options/checked');
		checkboxDebugMode.animation.addByPrefix('selected', 'yes', 6);
		checkboxDebugMode.animation.addByPrefix('disselected', 'no', 6);
		checkboxDebugMode.animation.play('disselected');
		checkboxDebugMode.scale.set(0.3, 0.3);
		checkboxDebugMode.antialiasing = false;
		checkboxDebugMode.alpha = 1;
		checkboxDebugMode.scrollFactor.set(1, 1);
		checkboxDebugMode.cameras = [uiCamera];
		add(checkboxDebugMode);

		XboxMode = new FlxText();
		XboxMode.text = "Xbox Mode";
		XboxMode.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		XboxMode.x = 180;
		XboxMode.y = 225;
		XboxMode.cameras = [uiCamera];
		XboxMode.color = 0xFFFFFFFF;
		XboxMode.borderColor = 0xFF000000;
		XboxMode.antialiasing = false;
		XboxMode.alpha = 0;
		XboxMode.borderSize = 3;
		add(XboxMode);

		checkboxXboxMode = new FlxSprite(335, 112);	
		checkboxXboxMode.frames = Paths.getSparrowAtlas('options/checked');
		checkboxXboxMode.animation.addByPrefix('selected', 'yes', 6);
		checkboxXboxMode.animation.addByPrefix('disselected', 'no', 6);
		checkboxXboxMode.animation.play('disselected');
		checkboxXboxMode.scale.set(0.3, 0.3);
		checkboxXboxMode.antialiasing = false;
		checkboxXboxMode.alpha = 1;
		checkboxXboxMode.scrollFactor.set(1, 1);
		checkboxXboxMode.cameras = [uiCamera];
		add(checkboxXboxMode);

		PurpleHorse = new FlxText();
		PurpleHorse.text = "Purple Horse Virus";
		PurpleHorse.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		PurpleHorse.x = 180;
		PurpleHorse.y = 325;
		PurpleHorse.cameras = [uiCamera];
		PurpleHorse.color = 0xFFFFFFFF;
		PurpleHorse.borderColor = 0xFF000000;
		PurpleHorse.antialiasing = false;
		PurpleHorse.alpha = 0;
		PurpleHorse.borderSize = 3;
		add(PurpleHorse);

		checkboxPurpleHorse = new FlxSprite(505, 212);	
		checkboxPurpleHorse.frames = Paths.getSparrowAtlas('options/checked');
		checkboxPurpleHorse.animation.addByPrefix('selected', 'yes', 6);
		checkboxPurpleHorse.animation.addByPrefix('disselected', 'no', 6);
		checkboxPurpleHorse.animation.play('disselected');
		checkboxPurpleHorse.scale.set(0.3, 0.3);
		checkboxPurpleHorse.antialiasing = false;
		checkboxPurpleHorse.alpha = 1;
		checkboxPurpleHorse.scrollFactor.set(1, 1);
		checkboxPurpleHorse.cameras = [uiCamera];
		add(checkboxPurpleHorse);

		BaldiStyle = new FlxText();
		BaldiStyle.text = "BaldiStyle";
		BaldiStyle.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		BaldiStyle.x = 180;
		BaldiStyle.y = 425;
		BaldiStyle.cameras = [uiCamera];
		BaldiStyle.color = 0xFFFFFFFF;
		BaldiStyle.borderColor = 0xFF000000;
		BaldiStyle.antialiasing = false;
		BaldiStyle.alpha = 0;
		BaldiStyle.borderSize = 3;
		add(BaldiStyle);

		checkboxBaldiStyle = new FlxSprite(310, 312);	
		checkboxBaldiStyle.frames = Paths.getSparrowAtlas('options/checked');
		checkboxBaldiStyle.animation.addByPrefix('selected', 'yes', 6);
		checkboxBaldiStyle.animation.addByPrefix('disselected', 'no', 6);
		checkboxBaldiStyle.animation.play('disselected');
		checkboxBaldiStyle.scale.set(0.3, 0.3);
		checkboxBaldiStyle.antialiasing = false;
		checkboxBaldiStyle.alpha = 1;
		checkboxBaldiStyle.scrollFactor.set(1, 1);
		checkboxBaldiStyle.cameras = [uiCamera];
		add(checkboxBaldiStyle);

		Hitsounds = new FlxText();
		Hitsounds.text = "Hitsounds";
		Hitsounds.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Hitsounds.x = 180;
		Hitsounds.y = 525;
		Hitsounds.cameras = [uiCamera];
		Hitsounds.color = 0xFFFFFFFF;
		Hitsounds.borderColor = 0xFF000000;
		Hitsounds.antialiasing = false;
		Hitsounds.alpha = 0;
		Hitsounds.borderSize = 3;
		add(Hitsounds);

		checkboxHitsounds = new FlxSprite(305, 412);	
		checkboxHitsounds.frames = Paths.getSparrowAtlas('options/checked');
		checkboxHitsounds.animation.addByPrefix('selected', 'yes', 6);
		checkboxHitsounds.animation.addByPrefix('disselected', 'no', 6);
		checkboxHitsounds.animation.play('disselected');
		checkboxHitsounds.scale.set(0.3, 0.3);
		checkboxHitsounds.antialiasing = false;
		checkboxHitsounds.alpha = 1;
		checkboxHitsounds.scrollFactor.set(1, 1);
		checkboxHitsounds.cameras = [uiCamera];
		add(checkboxHitsounds);

		Geometry = new FlxText();
		Geometry.text = "Gemontry Dash";
		Geometry.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Geometry.x = 180;
		Geometry.y = 625;
		Geometry.cameras = [uiCamera];
		Geometry.color = 0xFFFFFFFF;
		Geometry.borderColor = 0xFF000000;
		Geometry.antialiasing = false;
		Geometry.alpha = 0;
		Geometry.borderSize = 3;
		add(Geometry);

		checkboxGeometry = new FlxSprite(425, 512);	
		checkboxGeometry.frames = Paths.getSparrowAtlas('options/checked');
		checkboxGeometry.animation.addByPrefix('selected', 'yes', 6);
		checkboxGeometry.animation.addByPrefix('disselected', 'no', 6);
		checkboxGeometry.animation.play('disselected');
		checkboxGeometry.scale.set(0.3, 0.3);
		checkboxGeometry.antialiasing = false;
		checkboxGeometry.alpha = 1;
		checkboxGeometry.scrollFactor.set(1, 1);
		checkboxGeometry.cameras = [uiCamera];
		add(checkboxGeometry);

		Nightmare = new FlxText();
		Nightmare.text = "Nightmare.";
		Nightmare.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Nightmare.x = 180;
		Nightmare.y = 725;
		Nightmare.cameras = [uiCamera];
		Nightmare.color = 0xFFFFFFFF;
		Nightmare.borderColor = 0xFF000000;
		Nightmare.antialiasing = false;
		Nightmare.alpha = 0;
		Nightmare.borderSize = 3;
		add(Nightmare);

		checkboxNightmare= new FlxSprite(335, 612);	
		checkboxNightmare.frames = Paths.getSparrowAtlas('options/checked');
		checkboxNightmare.animation.addByPrefix('selected', 'yes', 6);
		checkboxNightmare.animation.addByPrefix('disselected', 'no', 6);
		checkboxNightmare.animation.play('disselected');
		checkboxNightmare.scale.set(0.3, 0.3);
		checkboxNightmare.antialiasing = false;
		checkboxNightmare.alpha = 1;
		checkboxNightmare.scrollFactor.set(1, 1);
		checkboxNightmare.cameras = [uiCamera];
		add(checkboxNightmare);

		CameraAwesome = new FlxText();
		CameraAwesome.text = "Amazing Camera";
		CameraAwesome.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		CameraAwesome.x = 180;
		CameraAwesome.y = 825;
		CameraAwesome.cameras = [uiCamera];
		CameraAwesome.color = 0xFFFFFFFF;
		CameraAwesome.borderColor = 0xFF000000;
		CameraAwesome.antialiasing = false;
		CameraAwesome.alpha = 0;
		CameraAwesome.borderSize = 3;
		add(CameraAwesome);

		checkboxCameraAwesome = new FlxSprite(450, 712);	
		checkboxCameraAwesome.frames = Paths.getSparrowAtlas('options/checked');
		checkboxCameraAwesome.animation.addByPrefix('selected', 'yes', 6);
		checkboxCameraAwesome.animation.addByPrefix('disselected', 'no', 6);
		checkboxCameraAwesome.animation.play('disselected');
		checkboxCameraAwesome.scale.set(0.3, 0.3);
		checkboxCameraAwesome.antialiasing = false;
		checkboxCameraAwesome.alpha = 1;
		checkboxCameraAwesome.scrollFactor.set(1, 1);
		checkboxCameraAwesome.cameras = [uiCamera];
		add(checkboxCameraAwesome);

		MelTabs  = new FlxText();
		MelTabs.text = "Melty's Tabs";
		MelTabs.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		MelTabs.x = 180;
		MelTabs.y = 925;
		MelTabs.cameras = [uiCamera];
		MelTabs.color = 0xFFFFFFFF;
		MelTabs.borderColor = 0xFF000000;
		MelTabs.antialiasing = false;
		MelTabs.alpha = 0;
		MelTabs.borderSize = 3;
		add(MelTabs);

		checkboxMelTabs = new FlxSprite(375, 812);	
		checkboxMelTabs.frames = Paths.getSparrowAtlas('options/checked');
		checkboxMelTabs.animation.addByPrefix('selected', 'yes', 6);
		checkboxMelTabs.animation.addByPrefix('disselected', 'no', 6);
		checkboxMelTabs.animation.play('disselected');
		checkboxMelTabs.scale.set(0.3, 0.3);
		checkboxMelTabs.antialiasing = false;
		checkboxMelTabs.alpha = 1;
		checkboxMelTabs.scrollFactor.set(1, 1);
		checkboxMelTabs.cameras = [uiCamera];
		add(checkboxMelTabs);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('options/border'));
	border.antialiasing = false;
	border.updateHitbox();
	border.cameras = [borderCamera];
	add(border);

	dudeman = new FlxSprite(0, 0).loadGraphic(Paths.image('options/heydude'));
	dudeman.antialiasing = false;
	dudeman.updateHitbox();
	dudeman.cameras = [borderCamera];
	add(dudeman);

	BottomText = new FlxText();
	BottomText.setFormat(Paths.font("COMIC.ttf"), 28, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	BottomText.x = 150;
	BottomText.y = 682;
	BottomText.cameras = [borderCamera];
	BottomText.color = 0xFFFFFFFF;
	BottomText.borderColor = 0xFF000000;
	BottomText.antialiasing = false;
	BottomText.borderSize = 3;
	add(BottomText);

	title = new FlxSprite(185, 10).loadGraphic(Paths.image('options/title'));
	title.antialiasing = false;
	title.cameras = [borderCamera];
	title.updateHitbox();
	add(title);
	
}

function resetSettings() {
		FlxG.save.data.downscroll = false;
		FlxG.save.data.botplay = false;
		FlxG.save.data.ghosttap = true;
		FlxG.save.data.notebounce = true;
		FlxG.save.data.middlescroll = false;
		FlxG.save.data.debug = false;
		FlxG.save.data.xbox = false;
		FlxG.save.data.horse = false;
		FlxG.save.data.baldiStyle = false;
		FlxG.save.data.hitsounds = false;
		FlxG.save.data.geomtery = false;
		FlxG.save.data.nightmare = false;
		FlxG.save.data.goodCamera = false;
		FlxG.save.data.MelTabs = false;
		FlxG.save.data.subtitles = true;
		FlxG.save.data.camMove = true;

		FlxG.save.data.wheresGarfield = false;
		trace("set to default settings");
}

function update() {

	BottomText.text = "Hi welcome to the options menu, goat :fire::100:   press R to reset settings";

	// CHECKING CATEGORY		
	if (MainOptionsOpen == true) {
		for (obj in [Controls, Gameplay, Secret]) {
		add(obj);
		obj.alpha = 0.6;
		}
	}
	
	if (FlxG.keys.justPressed.R) {
		resetSettings();	
	}
	if (MainOptionsOpen == false) {
		for (obj in [Controls, Gameplay, Secret]) {
		remove(obj);
		}
	}
	if (GameplayOptionsOpen == true) {
		for (obj in [Downscroll, checkboxDownscroll, Botplay, checkboxBotplay, GhostTapping, checkboxGhostTapping, NoteBounce, checkboxNoteBounce, MiddleScroll, checkboxMiddleScroll, Subtitles, checkboxSubtitles, camMove, checkboxcamMove]) {
		add(obj);
		}
		for (obj in [Downscroll, Botplay, GhostTapping, NoteBounce, MiddleScroll, Subtitles, camMove]) {
		obj.alpha = 0.6;
		}
	}
	if (GameplayOptionsOpen == false) {
		for (obj in [Downscroll, checkboxDownscroll, Botplay, checkboxBotplay, GhostTapping, checkboxGhostTapping, NoteBounce, checkboxNoteBounce, MiddleScroll, checkboxMiddleScroll, Subtitles, checkboxSubtitles, camMove, checkboxcamMove]) {
		remove(obj);
		}
	}
	if (SecretOptionsOpen == true) {
		for (obj in [DebugMode, checkboxDebugMode, XboxMode, checkboxXboxMode, PurpleHorse, checkboxPurpleHorse, BaldiStyle, checkboxBaldiStyle, Hitsounds, checkboxHitsounds, Geometry, checkboxGeometry, Nightmare, checkboxNightmare, CameraAwesome, checkboxCameraAwesome, MelTabs, checkboxMelTabs]) {
		add(obj);
		}
		for (obj in [DebugMode, XboxMode, PurpleHorse, BaldiStyle, Hitsounds, Geometry, Nightmare, CameraAwesome, MelTabs]) {
		obj.alpha = 0.6;
		}
	}
	if (SecretOptionsOpen == false) {
		for (obj in [DebugMode, checkboxDebugMode, XboxMode, checkboxXboxMode, PurpleHorse, checkboxPurpleHorse, BaldiStyle, checkboxBaldiStyle, Hitsounds, checkboxHitsounds, Geometry, checkboxGeometry, Nightmare, checkboxNightmare, CameraAwesome, checkboxCameraAwesome, MelTabs, checkboxMelTabs]) {
		remove(obj);
		}
	}
	// CONTROLS
	if (controls.UP_P && subStateOpen == false && MainOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected1 -= 1;	
	}
	if (controls.DOWN_P && subStateOpen == false && MainOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected1 += 1;
	}	          
	if (controls.UP_P && GameplayOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedGameplay -= 1;	
	}
	if (controls.DOWN_P && GameplayOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedGameplay += 1;
	}
	if (controls.UP_P && SecretOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedSecret -= 1;	
	}
	if (controls.DOWN_P && SecretOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedSecret += 1;
	}
	// BUTTONS MAIN
	if (Selected1 == 0 && controls.ACCEPT && MainOptionsOpen == true && subStateOpen == false) {
		subStateOpen = true;
		openSubState(new KeybindsOptions());
	}
	if (Selected1 == 1 && controls.ACCEPT && MainOptionsOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			GameplayOptionsOpen = true; 
			MainOptionsOpen = false;
			trace("poop");
		});
	}
	if (Selected1 == 2 && controls.ACCEPT && MainOptionsOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			SecretOptionsOpen = true; 
			MainOptionsOpen = false;
			trace("poop");
		});
	}
	if (controls.BACK && subStateOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			subStateOpen = false;
		});
	}
	if (Selected1 == 0 && MainOptionsOpen == true) {
		Controls.alpha = 1;	
	}
	if (Selected1 == 1 && MainOptionsOpen == true) {
		Gameplay.alpha = 1;	
	}
//	if (Selected1 == 2 && MainOptionsOpen == true) {
//		Appearance.alpha = 1;	
//	}
	if (Selected1 == 2 && MainOptionsOpen == true) {
		Secret.alpha = 1;	
	}
	// BUTTONS GAMEPLAY
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true) {
		BottomText.text = "Its just downscroll, do i rly gotta describe that ?";
		Downscroll.alpha = 1;	
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true) {
		BottomText.text = "Somehow isnt in normal codename. messes stuff up in a select few songs";
		Botplay.alpha = 1;
	}
	if (SelectedGameplay == 2 && GameplayOptionsOpen == true) {
		BottomText.text = "Ghost ?? like..... Ghostybricks creator of dudeman from the hit mod dudeman and pals ?";
		GhostTapping.alpha = 1;
	}
	if (SelectedGameplay == 3 && GameplayOptionsOpen == true) {
		BottomText.text = "Makes the strumline notes bounce when hit !";
		NoteBounce.alpha = 1;
	}
	if (SelectedGameplay == 4 && GameplayOptionsOpen == true) {
		BottomText.text = "its just fucking middlescroll- dude do I seriously have to describe these";
		MiddleScroll.alpha = 1;
	}
	if (SelectedGameplay == 5 && GameplayOptionsOpen == true && FlxG.save.data.subtitles == true) {
		BottomText.text = "hehehe wouldnt it be funny if the subtitles controlled this text too ?";
		Subtitles.alpha = 1;
	}
	if (SelectedGameplay == 5 && GameplayOptionsOpen == true && FlxG.save.data.subtitles == false) {
		BottomText.text = "";
		Subtitles.alpha = 1;
	}
	if (SelectedGameplay == 6 && GameplayOptionsOpen == true && FlxG.save.data.camMove == true) {
		BottomText.text = "Are you silly or are you a loser ?";
		camMove.alpha = 1;
	}
	if (SelectedGameplay == 6 && GameplayOptionsOpen == true && FlxG.save.data.camMove == false) {
		BottomText.text = "Loser. clearly.";
		camMove.alpha = 1;
	}
	// BUTTONS SECRET
	if (SelectedSecret == 0 && SecretOptionsOpen == true) {
		BottomText.text = "Debug Mode, lets you do a bunch of shit in the middle of songs";
		DebugMode.alpha = 1;	
	}
	if (SelectedSecret == 1 && SecretOptionsOpen == true) {
		BottomText.text = "This Lowkey turns the game into an xbox";
		XboxMode.alpha = 1;	
	}
	if (SelectedSecret == 2 && SecretOptionsOpen == true) {
		BottomText.text = "The horse calls upon those who wait. :racehorse:";
		PurpleHorse.alpha = 1;	
	}
	if (SelectedSecret == 3 && SecretOptionsOpen == true) {
		BottomText.text = "Baldi when he gangnams his styles";
		BaldiStyle.alpha = 1;	
	}
	if (SelectedSecret == 4 && SecretOptionsOpen == true) {
		BottomText.text = "Thanks for the suggestion OJStheCoder";
		Hitsounds.alpha = 1;	
	}
	if (SelectedSecret == 5 && SecretOptionsOpen == true) {
		BottomText.text = "It like note ratings, but better";
		Geometry.alpha = 1;	
	}
	if (SelectedSecret == 6 && SecretOptionsOpen == true) {
		BottomText.text = "Dont Miss.";
		Nightmare.alpha = 1;	
	}
	if (SelectedSecret == 7 && SecretOptionsOpen == true) {
		BottomText.text = "4K 1080p 120 FPS gameplay footage";
		CameraAwesome.alpha = 1;	
	}
	if (SelectedSecret == 8 && SecretOptionsOpen == true) {
		BottomText.text = "You dont need all those tabs open.";
		MelTabs.alpha = 1;	
	}
	// CONTROLS PT 2
	if (Selected1 > 2) {
		Selected1 = 0;
	}
	if (Selected1 < 0) {
		Selected1 = 2;
	}
	if (SelectedGameplay > 6) {
		SelectedGameplay = 0;
	}
	if (SelectedGameplay < 0) {
		SelectedGameplay = 6;
	}
	if (SelectedSecret > 8) {
		SelectedSecret = 0;
	}
	if (SelectedSecret < 0) {
		SelectedSecret = 8;
	}
	// SECRETSETTINGS CAM
	if (SelectedSecret > 4 && SecretOptionsOpen == true) {
		if (uiCamera.y != -475) {
			uiCamera.y -= 5;
		}
	}
	if (SelectedSecret < 5 && SecretOptionsOpen == true) {
		if (uiCamera.y != 25) {
			uiCamera.y += 5;
		}
	}
	// GAMEPLAY CAM
	if (SelectedGameplay > 4 && GameplayOptionsOpen == true) {
		if (uiCamera.y != -175) {
			uiCamera.y -= 5;
		}
	}
	if (SelectedGameplay < 5 && GameplayOptionsOpen == true) {
		if (uiCamera.y != 25) {
			uiCamera.y += 5;
		}
	}
}
function postUpdate() {

	if (FlxG.save.data.wasJustInPause == true && controls.BACK && MainOptionsOpen == true && subStateOpen == false) {
		new FlxTimer().start(0.10, function(timer) {
           	FlxG.save.data.wasJustInPause = null;
           	FlxG.switchState(new PlayState());
		});
     }
     if (controls.BACK && FlxG.save.data.wasJustInPause == null && subStateOpen == false && MainOptionsOpen == true) {
		new FlxTimer().start(0.10, function(timer) {
			FlxG.switchState(new MainMenuState());
		});
	}
     if (controls.BACK && FlxG.save.data.wasJustInPause == false && subStateOpen == false && MainOptionsOpen == true) {
		new FlxTimer().start(0.10, function(timer) {
			FlxG.switchState(new MainMenuState());
		});
	}
     if (controls.BACK && MainOptionsOpen == false) {
			GameplayOptionsOpen = false;
			SecretOptionsOpen = false;
			MainOptionsOpen = true;
			uiCamera.y = 25;
			SelectedSecret = 0;
	}
	// CHECKS GAMEPLAY
	if (FlxG.save.data.downscroll == true) {
		checkboxDownscroll.animation.play('selected');
	}
	if (FlxG.save.data.downscroll == false) {
		checkboxDownscroll.animation.play('disselected');
	}
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true && FlxG.save.data.downscroll == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.downscroll = true;
		});
	}
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true && FlxG.save.data.downscroll == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.downscroll = false;
		});
	}
	if (FlxG.save.data.botplay == true) {
		checkboxBotplay.animation.play('selected');
	}
	if (FlxG.save.data.botplay == false) {
		checkboxBotplay.animation.play('disselected');
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true && FlxG.save.data.botplay  == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.botplay = true;
		});
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true && FlxG.save.data.botplay  == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.botplay = false;
		});
	}
	if (FlxG.save.data.ghosttap == true) {
		checkboxGhostTapping.animation.play('selected');
	}
	if (FlxG.save.data.ghosttap == false) {
		checkboxGhostTapping.animation.play('disselected');
	}
	if (SelectedGameplay == 2 && GameplayOptionsOpen == true && FlxG.save.data.ghosttap == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.ghosttap = true;
		});
	}
	if (SelectedGameplay == 2 && GameplayOptionsOpen == true && FlxG.save.data.ghosttap == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.ghosttap = false;
		});
	}
	if (FlxG.save.data.notebounce == true) {
		checkboxNoteBounce.animation.play('selected');
	}
	if (FlxG.save.data.notebounce == false) {
		checkboxNoteBounce.animation.play('disselected');
	}
	if (SelectedGameplay == 3 && GameplayOptionsOpen == true && FlxG.save.data.notebounce == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.notebounce = true;
		});
	}
	if (SelectedGameplay == 3 && GameplayOptionsOpen == true && FlxG.save.data.notebounce == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.notebounce = false;
		});
	}
	if (FlxG.save.data.middlescroll == true) {
		checkboxMiddleScroll.animation.play('selected');
	}
	if (FlxG.save.data.middlescroll == false) {
		checkboxMiddleScroll.animation.play('disselected');
	}
	if (SelectedGameplay == 4 && GameplayOptionsOpen == true && FlxG.save.data.middlescroll == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.middlescroll = true;
		});
	}
	if (SelectedGameplay == 4 && GameplayOptionsOpen == true && FlxG.save.data.middlescroll == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.middlescroll = false;
		});
	}
	if (FlxG.save.data.subtitles == true) {
		checkboxSubtitles.animation.play('selected');
	}
	if (FlxG.save.data.subtitles == false) {
		checkboxSubtitles.animation.play('disselected');
	}
	if (SelectedGameplay == 5 && GameplayOptionsOpen == true && FlxG.save.data.subtitles == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.subtitles = true;
		});
	}
	if (SelectedGameplay == 5 && GameplayOptionsOpen == true && FlxG.save.data.subtitles == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.subtitles = false;
		});
	}	
	if (FlxG.save.data.camMove == true) {
		checkboxcamMove.animation.play('selected');
	}
	if (FlxG.save.data.camMove == false) {
		checkboxcamMove.animation.play('disselected');
	}
	if (SelectedGameplay == 6 && GameplayOptionsOpen == true && FlxG.save.data.camMove == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.camMove = true;
		});
	}
	if (SelectedGameplay == 6 && GameplayOptionsOpen == true && FlxG.save.data.camMove == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.camMove = false;
		});
	}	
	
	
	// CHECKS SECRET
	if (FlxG.save.data.debug == true) {
		checkboxDebugMode.animation.play('selected');
	}
	if (FlxG.save.data.debug == false) {
		checkboxDebugMode.animation.play('disselected');
	}
	if (SelectedSecret == 0 && SecretOptionsOpen == true && FlxG.save.data.debug == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.debug = true;
		});
	}
	if (SelectedSecret == 0 && SecretOptionsOpen == true && FlxG.save.data.debug == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.debug = false;
		});
	}
	if (FlxG.save.data.xbox == true) {
		checkboxXboxMode.animation.play('selected');
	}
	if (FlxG.save.data.xbox == false) {
		checkboxXboxMode.animation.play('disselected');
	}
	if (SelectedSecret == 1 && SecretOptionsOpen == true && FlxG.save.data.xbox == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.xbox = true;
		});
	}
	if (SelectedSecret == 1 && SecretOptionsOpen == true && FlxG.save.data.xbox == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.xbox = false;
		});
	}
	if (FlxG.save.data.horse == true) {
		checkboxPurpleHorse.animation.play('selected');
	}
	if (FlxG.save.data.horse == false) {
		checkboxPurpleHorse.animation.play('disselected');
	}
	if (SelectedSecret == 2 && SecretOptionsOpen == true && FlxG.save.data.horse == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.horse = true;
		});
	}
	if (SelectedSecret == 2 && SecretOptionsOpen == true && FlxG.save.data.horse == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.horse = false;
		});
	}
	if (FlxG.save.data.baldiStyle == true) {
		checkboxBaldiStyle.animation.play('selected');
	}
	if (FlxG.save.data.baldiStyle == false) {
		checkboxBaldiStyle.animation.play('disselected');
	}
	if (SelectedSecret == 3 && SecretOptionsOpen == true && FlxG.save.data.baldiStyle == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.baldiStyle = true;
		});
	}
	if (SelectedSecret == 3 && SecretOptionsOpen == true && FlxG.save.data.baldiStyle == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.baldiStyle = false;
		});
	}
	if (FlxG.save.data.hitsounds == true) {
		checkboxHitsounds.animation.play('selected');
	}
	if (FlxG.save.data.hitsounds == false) {
		checkboxHitsounds.animation.play('disselected');
	}
	if (SelectedSecret == 4 && SecretOptionsOpen == true && FlxG.save.data.hitsounds == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.hitsounds = true;
		});
	}
	if (SelectedSecret == 4 && SecretOptionsOpen == true && FlxG.save.data.hitsounds == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.hitsounds = false;
		});
	}
	if (FlxG.save.data.geomtery == true) {
		checkboxGeometry.animation.play('selected');
	}
	if (FlxG.save.data.geomtery == false) {
		checkboxGeometry.animation.play('disselected');
	}
	if (SelectedSecret == 5 && SecretOptionsOpen == true && FlxG.save.data.geomtery == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.geomtery = true;
		});
	}
	if (SelectedSecret == 5 && SecretOptionsOpen == true && FlxG.save.data.geomtery == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.geomtery = false;
		});
	}
	if (FlxG.save.data.nightmare == true) {
		checkboxNightmare.animation.play('selected');
	}
	if (FlxG.save.data.nightmare == false) {
		checkboxNightmare.animation.play('disselected');
	}
	if (SelectedSecret == 6 && SecretOptionsOpen == true && FlxG.save.data.nightmare == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.nightmare = true;
		});
	}
	if (SelectedSecret == 6 && SecretOptionsOpen == true && FlxG.save.data.nightmare == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.nightmare = false;
		});
	}
	if (FlxG.save.data.goodCamera == true) {
		checkboxCameraAwesome.animation.play('selected');
	}
	if (FlxG.save.data.goodCamera == false) {
		checkboxCameraAwesome.animation.play('disselected');
	}
	if (SelectedSecret == 7 && SecretOptionsOpen == true && FlxG.save.data.goodCamera == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.goodCamera = true;
		});
	}
	if (SelectedSecret == 7 && SecretOptionsOpen == true && FlxG.save.data.goodCamera == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.goodCamera = false;
		});
	}
	if (FlxG.save.data.MelTabs == true) {
		checkboxMelTabs.animation.play('selected');
	}
	if (FlxG.save.data.MelTabs == false) {
		checkboxMelTabs.animation.play('disselected');
	}
	if (SelectedSecret == 8 && SecretOptionsOpen == true && FlxG.save.data.MelTabs == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.MelTabs = true;
		});
	}
	if (SelectedSecret == 8 && SecretOptionsOpen == true && FlxG.save.data.MelTabs == true && controls.ACCEPT) {
		trace("oh.. man");
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.MelTabs = false;
		});
	}
}