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
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import lime.utils.Assets;
import funkin.game.HealthIcon;
import funkin.savedata.FunkinSave;
import haxe.Json;
import flixel.FlxSubState;
import funkin.backend.system.Controls;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import funkin.backend.utils.DiscordUtil;

var Selected1 = 0;
var SelectedGameplay = 0;
var SelectedMisc = 0;
var SelectedSecret = 0;
var subStateOpen = false;
var MainOptionsOpen = true;
var GameplayOptionsOpen = false;
var MiscOptionsOpen = false;
var SecretOptionsOpen = false;
var popUpOPEN = false;
var languageSelection = 0;

function create() {

	DiscordUtil.changePresenceAdvanced({
		details: "IN: Options",
		state: "This goat changin their settings <3",
		largeImageKey: "icon"
	});

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
	
	popUpCamera = new FlxCamera(0, 0, 1280, 720);
	popUpCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(popUpCamera, false);

	cursorCam = new FlxCamera(0, 0, 1280, 720);
	cursorCam.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(cursorCam, false);

}

function postCreate() {

	FlxG.sound.playMusic(Paths.music('OptionsLoop'), 1, true);

	coolBackdropPOP = new FlxBackdrop(Paths.image('ui/bg'));
	coolBackdropPOP.moves = true;
	coolBackdropPOP.scrollFactor.set(0, 0);
	coolBackdropPOP.velocity.x = 20;
	coolBackdropPOP.velocity.y = 20;
	coolBackdropPOP.active = true;
	coolBackdropPOP.cameras = [popUpCamera];
	coolBackdropPOP.alpha = 0;
	add(coolBackdropPOP);

	popBorder = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/border'));
	popBorder.scrollFactor.set(0, 0);
	popBorder.cameras = [popUpCamera];
	popBorder.scale.set(1, 1);
	popBorder.alpha = 0;
	add(popBorder);

	warningTextPOP = new FlxText(50, 25, 450);
	warningTextPOP.text = "WAIT! before you use downscroll, I just want you to know\n\nthis mod's ui looks way better on upscroll, everything still works for downscroll, but things like DudeRatingTM dont really work correctly. ( unless u use middlescroll )\n\nif you CAN use upscroll, I highly recommend it. if not- dont worry! you can still play the mod completely fine c:";
	warningTextPOP.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	warningTextPOP.cameras = [popUpCamera];
	warningTextPOP.color = 0xFF130022;
	warningTextPOP.antialiasing = false;
	warningTextPOP.borderSize = 2.25;
	warningTextPOP.alpha = 0;
	add(warningTextPOP);

	buttonPOP = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/button'));
	buttonPOP.scrollFactor.set(0, 0);
	buttonPOP.cameras = [popUpCamera];
	buttonPOP.scale.set(1, 1);
	buttonPOP.alpha = 0;
	buttonPOP.updateHitbox();
	add(buttonPOP);

	buttonTextPOP = new FlxText(100, 100, 450);
	buttonTextPOP.text = "oh. go fuck urself.";
	buttonTextPOP.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	buttonTextPOP.cameras = [popUpCamera];
	buttonTextPOP.color = 0xFF130022;
	buttonTextPOP.antialiasing = false;
	buttonTextPOP.borderSize = 2.25;
	buttonTextPOP.alpha = 0;
	add(buttonTextPOP);

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100;
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	Controls = new FlxText();
	Controls.text = "Keybinds";
	Controls.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Controls.x = 180;
	Controls.y = 115;
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
	Gameplay.y = 265;
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

		checkboxDownscroll = new FlxSprite(310, 10);	
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

		dudeRating = new FlxText();
		dudeRating.text = "Dude-Rating";
		dudeRating.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		dudeRating.x = 180;
		dudeRating.y = 220;
		dudeRating.cameras = [uiCamera];
		dudeRating.color = 0xFFFFFFFF;
		dudeRating.borderColor = 0xFF000000;
		dudeRating.antialiasing = false;
		dudeRating.alpha = 0;
		dudeRating.borderSize = 3;
		add(dudeRating);

		checkboxdudeRating = new FlxSprite(350, 110);	
		checkboxdudeRating.frames = Paths.getSparrowAtlas('options/checked');
		checkboxdudeRating.animation.addByPrefix('selected', 'yes', 6);
		checkboxdudeRating.animation.addByPrefix('disselected', 'no', 6);
		checkboxdudeRating.animation.play('disselected');
		checkboxdudeRating.scale.set(0.3, 0.3);
		checkboxdudeRating.antialiasing = false;
		checkboxdudeRating.alpha = 1;
		checkboxdudeRating.scrollFactor.set(1, 1);
		checkboxdudeRating.cameras = [uiCamera];
		add(checkboxdudeRating);

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

	MISC = new FlxText();
	MISC.text = "Accessibility >";
	MISC.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	MISC.x = 180;
	MISC.y = 415;
    MISC.cameras = [uiCamera];
	MISC.color = 0xFFFFFFFF;
	MISC.borderColor = 0xFF000000;
	MISC.antialiasing = false;
	MISC.borderSize = 3;
	add(MISC);

		ResetSaveData = new FlxText();
		ResetSaveData.text = "Reset Save Data";
		ResetSaveData.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		ResetSaveData.x = 180;
		ResetSaveData.y = 125;
		ResetSaveData.cameras = [uiCamera];
		ResetSaveData.color = 0xFFFFFFFF;
		ResetSaveData.borderColor = 0xFF000000;
		ResetSaveData.antialiasing = false;
		ResetSaveData.alpha = 0;
		ResetSaveData.borderSize = 3;
		add(ResetSaveData);

		Language = new FlxText();
		Language.text = "Language";
		Language.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		Language.x = 180;
		Language.y = 225;
		Language.cameras = [uiCamera];
		Language.color = 0xFFFFFFFF;
		Language.borderColor = 0xFF000000;
		Language.antialiasing = false;
		Language.alpha = 0;
		Language.borderSize = 3;
		add(Language);

		LanguageToPick = new FlxText(0, 0, 300);
		LanguageToPick.text = "< English >";
		LanguageToPick.setFormat(Paths.font("COMIC.ttf"), 40, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		LanguageToPick.x = 400;
		LanguageToPick.y = 235;
		LanguageToPick.cameras = [uiCamera];
		LanguageToPick.color = 0xFFFFFFFF;
		LanguageToPick.borderColor = 0xFF000000;
		LanguageToPick.antialiasing = false;
		LanguageToPick.alpha = 0;
		LanguageToPick.borderSize = 3;
		add(LanguageToPick);

	Secret = new FlxText();
	Secret.text = "Secret Settings >";
	Secret.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Secret.x = 180;
	Secret.y = 550;
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

		checkboxNightmare = new FlxSprite(335, 612);	
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

		gfBurger = new FlxText();
		gfBurger.text = "Awesum GF";
		gfBurger.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		gfBurger.x = 180;
		gfBurger.y = 1025;
		gfBurger.cameras = [uiCamera];
		gfBurger.color = 0xFFFFFFFF;
		gfBurger.borderColor = 0xFF000000;
		gfBurger.antialiasing = false;
		gfBurger.alpha = 0;
		gfBurger.borderSize = 3;
		add(gfBurger);

		checkboxgfBurger = new FlxSprite(345, 912);	
		checkboxgfBurger.frames = Paths.getSparrowAtlas('options/checked');
		checkboxgfBurger.animation.addByPrefix('selected', 'yes', 6);
		checkboxgfBurger.animation.addByPrefix('disselected', 'no', 6);
		checkboxgfBurger.animation.play('disselected');
		checkboxgfBurger.scale.set(0.3, 0.3);
		checkboxgfBurger.antialiasing = false;
		checkboxgfBurger.alpha = 1;
		checkboxgfBurger.scrollFactor.set(1, 1);
		checkboxgfBurger.cameras = [uiCamera];
		add(checkboxgfBurger);

		ascend = new FlxText();
		ascend.text = "Ascension";
		ascend.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		ascend.x = 180;
		ascend.y = 1125;
		ascend.cameras = [uiCamera];
		ascend.color = 0xFFFFFFFF;
		ascend.borderColor = 0xFF000000;
		ascend.antialiasing = false;
		ascend.alpha = 1;
		ascend.borderSize = 3;
		add(ascend);

		checkboxascend = new FlxSprite(305, 1012);	
		checkboxascend.frames = Paths.getSparrowAtlas('options/checked');
		checkboxascend.animation.addByPrefix('selected', 'yes', 6);
		checkboxascend.animation.addByPrefix('disselected', 'no', 6);
		checkboxascend.animation.play('disselected');
		checkboxascend.scale.set(0.3, 0.3);
		checkboxascend.antialiasing = false;
		checkboxascend.alpha = 1;
		checkboxascend.scrollFactor.set(1, 1);
		checkboxascend.cameras = [uiCamera];
		add(checkboxascend);

		sillyLang = new FlxText();
		sillyLang.text = "Silly Languages";
		sillyLang.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		sillyLang.x = 180;
		sillyLang.y = 1225;
		sillyLang.cameras = [uiCamera];
		sillyLang.color = 0xFFFFFFFF;
		sillyLang.borderColor = 0xFF000000;
		sillyLang.antialiasing = false;
		sillyLang.alpha = 1;
		sillyLang.borderSize = 3;
		add(sillyLang);

		checkboxsillyLang = new FlxSprite(425, 1115);	
		checkboxsillyLang.frames = Paths.getSparrowAtlas('options/checked');
		checkboxsillyLang.animation.addByPrefix('selected', 'yes', 6);
		checkboxsillyLang.animation.addByPrefix('disselected', 'no', 6);
		checkboxsillyLang.animation.play('disselected');
		checkboxsillyLang.scale.set(0.3, 0.3);
		checkboxsillyLang.antialiasing = false;
		checkboxsillyLang.alpha = 1;
		checkboxsillyLang.scrollFactor.set(1, 1);
		checkboxsillyLang.cameras = [uiCamera];
		add(checkboxsillyLang);

		brooklynMode = new FlxText();
		brooklynMode.text = "Brooklyn Mode";
		brooklynMode.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		brooklynMode.x = 180;
		brooklynMode.y = 1325;
		brooklynMode.cameras = [uiCamera];
		brooklynMode.color = 0xFFFFFFFF;
		brooklynMode.borderColor = 0xFF000000;
		brooklynMode.antialiasing = false;
		brooklynMode.alpha = 1;
		brooklynMode.borderSize = 3;
		add(brooklynMode);

		checkboxbrooklynMode = new FlxSprite(425, 1215);	
		checkboxbrooklynMode.frames = Paths.getSparrowAtlas('options/checked');
		checkboxbrooklynMode.animation.addByPrefix('selected', 'yes', 6);
		checkboxbrooklynMode.animation.addByPrefix('disselected', 'no', 6);
		checkboxbrooklynMode.animation.play('disselected');
		checkboxbrooklynMode.scale.set(0.3, 0.3);
		checkboxbrooklynMode.antialiasing = false;
		checkboxbrooklynMode.alpha = 1;
		checkboxbrooklynMode.scrollFactor.set(1, 1);
		checkboxbrooklynMode.cameras = [uiCamera];
		add(checkboxbrooklynMode);

		anglesDream = new FlxText();
		anglesDream.text = "Angel's Dream";
		anglesDream.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		anglesDream.x = 180;
		anglesDream.y = 1425;
		anglesDream.cameras = [uiCamera];
		anglesDream.color = 0xFFFFFFFF;
		anglesDream.borderColor = 0xFF000000;
		anglesDream.antialiasing = false;
		anglesDream.alpha = 1;
		anglesDream.borderSize = 3;
		add(anglesDream);

		checkboxanglesDream = new FlxSprite(425, 1315);	
		checkboxanglesDream.frames = Paths.getSparrowAtlas('options/checked');
		checkboxanglesDream.animation.addByPrefix('selected', 'yes', 6);
		checkboxanglesDream.animation.addByPrefix('disselected', 'no', 6);
		checkboxanglesDream.animation.play('disselected');
		checkboxanglesDream.scale.set(0.3, 0.3);
		checkboxanglesDream.antialiasing = false;
		checkboxanglesDream.alpha = 1;
		checkboxanglesDream.scrollFactor.set(1, 1);
		checkboxanglesDream.cameras = [uiCamera];
		add(checkboxanglesDream);

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

	cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

	if (FlxG.save.data.language == "english") {
		languageSelection = 0;
	}
	if (FlxG.save.data.language == "spanish") {
		languageSelection = 1;
	}
	if (FlxG.save.data.language == "french") {
		languageSelection = 2;
	}
	if (FlxG.save.data.language == "german") {
		languageSelection = 3;
	}
	if (FlxG.save.data.language == "bengali") {
		languageSelection = 4;
	}
	if (FlxG.save.data.language == "british") {
		languageSelection = 5;
	}
	if (FlxG.save.data.language == "silly") {
		languageSelection = 6;
	}
	if (FlxG.save.data.language == "pirate") {
		languageSelection = 7;
	}

}

function resetSettings() {
		FlxG.save.data.wheresGarfield = null;
		trace("set to default settings");
}

function resetSaveData() {
		FlxG.save.data.defaultSaveData = null;
		FlxG.switchState(new ModState("BetaWarningState"));
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 0, true);
		trace("reset save data");
}

function update() {

	if (MiscOptionsOpen && SelectedMisc == 1)  {
		if (controls.LEFT_P) {
			languageSelection -= 1;
		}
		if (controls.RIGHT_P) {
			languageSelection += 1;
		}
	}

	if (languageSelection == 0) {
		FlxG.save.data.language = "english";
		LanguageToPick.text = "< English >";
	}
	if (languageSelection == 1) {
		FlxG.save.data.language = "spanish";
		LanguageToPick.text = "< Español >";
	}
	if (languageSelection == 2) {
		FlxG.save.data.language = "french";
		LanguageToPick.text = "< Français >";
	}
	if (languageSelection == 3) {
		FlxG.save.data.language = "german";
		LanguageToPick.text = "< Deutsch >";
	}
	if (languageSelection == 4) {
		FlxG.save.data.language = "bengali";
		LanguageToPick.text = "< Bengali >";
	}
	if (languageSelection == 5) {
		FlxG.save.data.language = "british";
		LanguageToPick.text = "< Bri-ish >";
	}
	if (languageSelection == 6) {
		FlxG.save.data.language = "silly";
		LanguageToPick.text = "< SILLY X3 >";
	}
	if (languageSelection == 7) {
		FlxG.save.data.language = "pirate";
		LanguageToPick.text = "< Yarg. >";
	}

	if (FlxG.save.data.sillyLanguages == false) {
		if (languageSelection < 0) {
			languageSelection = 4;
		}
		if (languageSelection > 4) {
			languageSelection = 0;
		}
	}

	if (FlxG.save.data.sillyLanguages == true) {
		if (languageSelection < 0) {
			languageSelection = 7;
		}
		if (languageSelection > 7) {
			languageSelection = 0;
		}
	}

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

	BottomText.text = "Hi welcome to the options menu, goat :fire::100:   press R to reset settings";

	// CHECKING CATEGORY		
	if (MainOptionsOpen == true) {
		for (obj in [Controls, Gameplay, MISC, Secret]) {
		add(obj);
		obj.alpha = 0.6;
		}
	}
	
	if (FlxG.keys.justPressed.R) {
		resetSettings();	
	}
	if (MainOptionsOpen == false) {
		for (obj in [Controls, Gameplay, MISC, Secret]) {
			remove(obj);
		}
	}
	
	for (obj in [Downscroll, checkboxDownscroll, dudeRating, checkboxdudeRating, GhostTapping, checkboxGhostTapping, NoteBounce, checkboxNoteBounce, MiddleScroll, checkboxMiddleScroll, Subtitles, checkboxSubtitles, camMove, checkboxcamMove]) {
		if (GameplayOptionsOpen == true) {
			add(obj);
		}
		if (GameplayOptionsOpen == false) {
			remove(obj);
		}
	}
	for (obj in [Downscroll, dudeRating, GhostTapping, NoteBounce, MiddleScroll, Subtitles, camMove]) {
		obj.alpha = 0.6;
	}

	for (obj in [ResetSaveData, Language, LanguageToPick]) {
		if (MiscOptionsOpen == true) {
			add(obj);
		}
		if (MiscOptionsOpen == false) {
			remove(obj);
		}
	}
	for (obj in [ResetSaveData, Language, LanguageToPick]) {
		obj.alpha = 0.6;
	}

	for (obj in [DebugMode, checkboxDebugMode, XboxMode, checkboxXboxMode, PurpleHorse, checkboxPurpleHorse, BaldiStyle, checkboxBaldiStyle, Hitsounds, checkboxHitsounds, Geometry, checkboxGeometry, Nightmare, checkboxNightmare, CameraAwesome, checkboxCameraAwesome, MelTabs, checkboxMelTabs, gfBurger, checkboxgfBurger, ascend, checkboxascend, sillyLang, checkboxsillyLang, brooklynMode, checkboxbrooklynMode, anglesDream, checkboxanglesDream]) {
		if (SecretOptionsOpen == true) {
			add(obj);
		}
		if (SecretOptionsOpen == false) {
			remove(obj);
		}
	}
	for (obj in [DebugMode, XboxMode, PurpleHorse, BaldiStyle, Hitsounds, Geometry, Nightmare, CameraAwesome, MelTabs, gfBurger, ascend, sillyLang, brooklynMode, anglesDream]) {
		obj.alpha = 0.6;
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
	// MISC SETTINGS SHIT.. god why is this so unorganized PLS
	if (controls.UP_P && MiscOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedMisc -= 1;	
	}
	if (controls.DOWN_P && MiscOptionsOpen == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		SelectedMisc += 1;
	}
	if (SelectedMisc > 1) {
		SelectedMisc = 0;
	}
	if (SelectedMisc < 0) {
		SelectedMisc = 1;
	}
	if (SelectedMisc == 0 && MiscOptionsOpen == true) {
		BottomText.text = "Pressing this will remove ur save data ! instantly ! like /gen dude";
		ResetSaveData.alpha = 1;	
	}
	if (SelectedMisc == 1 && MiscOptionsOpen == true) {
		BottomText.text = "Change ur language, dude !";
		Language.alpha = 1;	
		LanguageToPick.alpha = 1;	
	}
	if (SelectedMisc == 0 && controls.ACCEPT && MiscOptionsOpen == true) {
		resetSaveData();
	}
	// BUTTONS MAIN
	if (Selected1 == 0 && controls.ACCEPT && MainOptionsOpen == true && subStateOpen == false) {
		subStateOpen = true;
		openSubState(new KeybindsOptions());
	}
	if (Selected1 == 1 && controls.ACCEPT && MainOptionsOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			GameplayOptionsOpen = true; 
			MiscOptionsOpen = false;
			MainOptionsOpen = false;
			trace("poop");
		});
	}
	if (Selected1 == 2 && controls.ACCEPT && MainOptionsOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			SecretOptionsOpen = false; 
			MiscOptionsOpen = true;
			MainOptionsOpen = false;
			trace("poop");
		});
	}
	if (Selected1 == 3 && controls.ACCEPT && MainOptionsOpen == true) {
		new FlxTimer().start(0.1, function(timer) {
			SecretOptionsOpen = true; 
			MiscOptionsOpen = false;
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
	if (Selected1 == 2 && MainOptionsOpen == true) {
		MISC.alpha = 1;	
	}
	if (Selected1 == 3 && MainOptionsOpen == true) {
		Secret.alpha = 1;	
	}
	// BUTTONS GAMEPLAY
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true) {
		BottomText.text = "Its just downscroll, do i rly gotta describe that ?";
		Downscroll.alpha = 1;	
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true) {
		BottomText.text = "Patented Dude-Rating system ! doesnt work well in Downscroll tho, so u can turn it off !";
		dudeRating.alpha = 1;
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
	if (SelectedSecret == 9 && SecretOptionsOpen == true) {
		BottomText.text = "I think antydote will enjoy dissecting this frame by fra";
		gfBurger.alpha = 1;	
	}
	if (SelectedSecret == 10 && SecretOptionsOpen == true) {
		BottomText.text = "bye bye !!!";
		ascend.alpha = 1;	
	}
	if (SelectedSecret == 11 && SecretOptionsOpen == true) {
		BottomText.text = "wait im so funny haha yes ! ( only for English )";
		sillyLang.alpha = 1;	
	}
	if (SelectedSecret == 12 && SecretOptionsOpen == true) {
		BottomText.text = "smells like jobs";
		brooklynMode.alpha = 1;	
	}
	if (SelectedSecret == 13 && SecretOptionsOpen == true) {
		BottomText.text = "im at my breaking point istg if i hear BURP MODE ONE MORE TIME -meltykelpy";
		anglesDream.alpha = 1;	
	}
	// CONTROLS PT 2
	if (Selected1 > 3) {
		Selected1 = 0;
	}
	if (Selected1 < 0) {
		Selected1 = 3;
	}
	if (SelectedGameplay > 6) {
		SelectedGameplay = 0;
	}
	if (SelectedGameplay < 0) {
		SelectedGameplay = 6;
	}
	if (SelectedSecret > 13) {
		SelectedSecret = 0;
	}
	if (SelectedSecret < 0) {
		SelectedSecret = 13;
	}
	// SECRETSETTINGS CAM
	if (SelectedSecret > 9 && SecretOptionsOpen == true) {
		if (uiCamera.y > -875) {
			uiCamera.y -= 10;
		}
		else if (uiCamera.y < -875) {
			uiCamera.y += 10;
		}
	}
	if (SelectedSecret > 4 && SecretOptionsOpen == true && SelectedSecret < 10) {
		if (uiCamera.y > -475) {
			uiCamera.y -= 10;
		}
		else if (uiCamera.y < -475) {
			uiCamera.y += 10;
		}
	}
	if (SelectedSecret < 5 && SecretOptionsOpen == true) {
		if (uiCamera.y < 25) {
			uiCamera.y += 10;
		}
	}
	// GAMEPLAY CAM
	if (SelectedGameplay > 4 && GameplayOptionsOpen == true) {
		if (uiCamera.y != -175) {
			uiCamera.y -= 10;
		}
	}
	if (SelectedGameplay < 5 && GameplayOptionsOpen == true) {
		if (uiCamera.y != 25) {
			uiCamera.y += 10;
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
		new FlxTimer().start(0.1, function(timer) {
			FlxG.switchState(new MainMenuState());
		});
	}
     if (controls.BACK && MainOptionsOpen == false) {
			GameplayOptionsOpen = false;
			SecretOptionsOpen = false;
			MainOptionsOpen = true;
			MiscOptionsOpen = false;
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
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true && FlxG.save.data.downscroll == false && controls.ACCEPT && subStateOpen == false) {
		new FlxTimer().start(0.10, function(timer) {
			downscolled("open");
		});
	}
	if (SelectedGameplay == 0 && GameplayOptionsOpen == true && FlxG.save.data.downscroll == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.downscroll = false;
		});
	}
	if (FlxG.save.data.dudeRating == true) {
		checkboxdudeRating.animation.play('selected');
	}
	if (FlxG.save.data.dudeRating == false) {
		checkboxdudeRating.animation.play('disselected');
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true && FlxG.save.data.dudeRating  == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.dudeRating = true;
		});
	}
	if (SelectedGameplay == 1 && GameplayOptionsOpen == true && FlxG.save.data.dudeRating  == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.dudeRating = false;
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
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.MelTabs = false;
		});
	}
	if (FlxG.save.data.burger == true) {
		checkboxgfBurger.animation.play('selected');
	}
	if (FlxG.save.data.burger == false) {
		checkboxgfBurger.animation.play('disselected');
	}
	if (SelectedSecret == 9 && SecretOptionsOpen == true && FlxG.save.data.burger == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.burger = true;
		});
	}
	if (SelectedSecret == 9 && SecretOptionsOpen == true && FlxG.save.data.burger == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.burger = false;
		});
	}
	
	if (FlxG.save.data.ascend == true) {
		checkboxascend.animation.play('selected');
	}
	if (FlxG.save.data.ascend == false) {
		checkboxascend.animation.play('disselected');
	}
	if (SelectedSecret == 10 && SecretOptionsOpen == true && FlxG.save.data.ascend == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.ascend = true;
		});
	}
	if (SelectedSecret == 10 && SecretOptionsOpen == true && FlxG.save.data.ascend == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.ascend = false;
		});
	}

	if (FlxG.save.data.sillyLanguages == true) {
		checkboxsillyLang.animation.play('selected');
	}
	if (FlxG.save.data.sillyLanguages == false) {
		checkboxsillyLang.animation.play('disselected');
	}
	if (SelectedSecret == 11 && SecretOptionsOpen == true && FlxG.save.data.sillyLanguages == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.sillyLanguages = true;
		});
	}
	if (SelectedSecret == 11 && SecretOptionsOpen == true && FlxG.save.data.sillyLanguages == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.sillyLanguages = false;
		});
	}

	if (FlxG.save.data.imFromBrooklyn == true) {
		checkboxbrooklynMode.animation.play('selected');
	}
	if (FlxG.save.data.imFromBrooklyn == false) {
		checkboxbrooklynMode.animation.play('disselected');
	}
	if (SelectedSecret == 12 && SecretOptionsOpen == true && FlxG.save.data.imFromBrooklyn == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.imFromBrooklyn = true;
		});
	}
	if (SelectedSecret == 12 && SecretOptionsOpen == true && FlxG.save.data.imFromBrooklyn == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.imFromBrooklyn = false;
		});
	}

	if (FlxG.save.data.angelsDream == true) {
		checkboxanglesDream.animation.play('selected');
	}
	if (FlxG.save.data.angelsDream == false) {
		checkboxanglesDream.animation.play('disselected');
	}
	if (SelectedSecret == 12 && SecretOptionsOpen == true && FlxG.save.data.angelsDream == false && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.angelsDream = true;
		});
	}
	if (SelectedSecret == 12 && SecretOptionsOpen == true && FlxG.save.data.angelsDream == true && controls.ACCEPT) {
		new FlxTimer().start(0.10, function(timer) {
		FlxG.save.data.angelsDream = false;
		});
	}

	if (popUpOPEN && FlxG.mouse.justPressed) {
		if (FlxG.mouse.overlaps(buttonPOP)) {
			downscolled("close");
			FlxG.save.data.downscroll = true;
		}
	}
}

function downscolled(openclose) {

	switch (openclose) {
		case "open":
			popUpCamera.x = 350;
			popUpCamera.y = 50;
			popUpCamera.width = 550;
			popUpCamera.height = 600;
			popBorder.scale.set(5.55, 6.1);
			popBorder.x = 225;
			popBorder.y = 255;

			warningTextPOP.scale.set(0.001, 0.001);
			buttonPOP.scale.set(0.001, 0.001);
			buttonTextPOP.scale.set(0.001, 0.001);
			warningTextPOP.alpha = 1;
			buttonPOP.alpha = 1;
			buttonTextPOP.alpha = 1;
			buttonTextPOP.x = 55;
			buttonTextPOP.y = 510;
			buttonPOP.x = 635;
			buttonPOP.y = 485;
			buttonPOP.offset.set(350, 50);
			buttonPOP.x -= 145;
			buttonPOP.y += 50;
	
			FlxTween.tween(warningTextPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(buttonPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(buttonTextPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(coolBackdropPOP, {alpha: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(popBorder, {alpha: 1}, 1, {ease: FlxEase.quartOut});

			popUpOPEN = true;
			subStateOpen = true;

		case "close":
			FlxTween.tween(warningTextPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(buttonPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(buttonTextPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(coolBackdropPOP, {alpha: 0}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(popBorder, {alpha: 0}, 1, {ease: FlxEase.quartOut});

			subStateOpen = false;
			popUpOPEN = false;
		
	}

}