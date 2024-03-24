// my melts.
import funkin.options.keybinds.ChangeKeybindSubState;
import funkin.options.keybinds.KeybindSetting;
import funkin.options.keybinds.KeybindsOptions;
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

var Selected1 = 0;
var subStateOpen = false;

function new() { 
    	   DiscordUtil.changePresence("goat, u in options", null);
}

function create() {

	uiCamera = new FlxCamera(0, 200, 1280, 720);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);

}

function postCreate() {

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	Controls = new FlxText();
	Controls.text = "Controls";
	Controls.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Controls.x = 180;
	Controls.y += 25;
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
	Gameplay.y += 125;
	Gameplay.cameras = [uiCamera];
	Gameplay.color = 0xFFFFFFFF;
	Gameplay.borderColor = 0xFF000000;
	Gameplay.antialiasing = false;
	Gameplay.borderSize = 3;
	add(Gameplay);

	Appearance = new FlxText();
	Appearance.text = "Appearance >";
	Appearance.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Appearance.x = 180;
	Appearance.y += 225;
	Appearance.cameras = [uiCamera];
	Appearance.color = 0xFFFFFFFF;
	Appearance.borderColor = 0xFF000000;
	Appearance.antialiasing = false;
	Appearance.borderSize = 3;
	add(Appearance);

	Secret = new FlxText();
	Secret.text = "Secret Settings >";
	Secret.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	Secret.x = 180;
	Secret.y += 325;
	Secret.cameras = [uiCamera];
	Secret.color = 0xFFFFFFFF;
	Secret.borderColor = 0xFF000000;
	Secret.antialiasing = false;
	Secret.borderSize = 3;
	add(Secret);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	dudeman = new FlxSprite(0, 0).loadGraphic(Paths.image('options/heydude'));
	dudeman.antialiasing = false;
	dudeman.updateHitbox();
	add(dudeman);

	title = new FlxSprite(185, 10).loadGraphic(Paths.image('options/title'));
	title.antialiasing = false;
	title.updateHitbox();
	add(title);

}

function update() {

	for (obj in [Controls, Gameplay, Appearance, Secret])
	obj.alpha = 0.6;
		
	if (controls.UP_P && subStateOpen == false) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected1 -= 1;	
	}
	if (controls.DOWN_P && subStateOpen == false) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected1 += 1;
	}	          
     if (controls.BACK && subStateOpen == false) {
		FlxG.switchState(new MainMenuState());
	}
	if (controls.BACK && subStateOpen == true) {
		subStateOpen = false;
		close(KeybindsOptions);
	}
	if (Selected1 == 0) {
		Controls.alpha = 1;	
	}
	if (Selected1 == 0 && controls.ACCEPT) {
		subStateOpen = true;
		openSubState(new KeybindsOptions());
	}
	if (Selected1 == 1) {
		Gameplay.alpha = 1;	
	}
	if (Selected1 == 2) {
		Appearance.alpha = 1;	
	}
	if (Selected1 == 3) {
		Secret.alpha = 1;	
	}
	if (Selected1 > 3) {
		Selected1 = 0;
	}
	if (Selected1 < 0) {
		Selected1 = 3;
	}
	
}
function postUpdate() {
	if (FlxG.save.data.wasJustInPause == true && controls.BACK) {
           FlxG.save.data.wasJustInPause = false;
           FlxG.switchState(new PlayState());
     }
}