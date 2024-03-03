import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;

public var sectionselected;
var Selected = 0;


function new() { 
    	   DiscordUtil.changePresence("goat, u lookin at art in the gallery", null);
}

function create() {
	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/bg'));
	bg.antialiasing = false;
	bg.scrollFactor.set(0, 0);
	add(bg);

	paintings = new FlxSprite(75, 50).loadGraphic(Paths.image('gallery/paintings/base'));
	paintings.antialiasing = false;
	paintings.scrollFactor.set(0, 0);
	add(paintings);

	dudeman = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/dudeman'));
	dudeman.antialiasing = false;
	dudeman.scrollFactor.set(0, 0);
	add(dudeman);

	stand = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/stand'));
	stand.antialiasing = false;
	stand.scrollFactor.set(0, 0);
	add(stand);

	light = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/light'));
	light.antialiasing = false;
	light.scrollFactor.set(0, 0);
	add(light);

	arrows = new FlxSprite(15, 250).loadGraphic(Paths.image('gallery/arrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	add(arrows);

	txtbg = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/fortxt'));
	txtbg.antialiasing = false;
	txtbg.updateHitbox();
	add(txtbg);

     text = new FlxText(820, 70, 400, "DEVTHINGS", 0);
     text.setFormat(Paths.font("COMIC.ttf"), 29, FlxColor.BLACK, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     text.borderColor = 0xFF06000C;
     text.borderSize = 0;
     add(text);

}

function update() {	
	if (controls.LEFT_P) {
		FlxG.sound.play(Paths.sound('sparkle'));
		Selected -= 1;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('sparkle'));
		Selected += 1;
	}
	switch(Selected) {
	case 0:
		paintings.loadGraphic(Paths.image('gallery/paintingsdax/mel'));
		text.text = 'Drawn by Melty \nHi fax machine welcome back teehee pokes your lungs \n- ur favorite fag';
	case 1:
		paintings.loadGraphic(Paths.image('gallery/paintingsdax/angel'));
		text.text = 'Drawn by Angel \nFuck Hitler \n- Angel';
	case 2:
		paintings.loadGraphic(Paths.image('gallery/paintingsdax/sweet'));
		text.text = 'Drawn by Sweet \nRadical. \n- Sweet';
	case 3:
		paintings.loadGraphic(Paths.image('gallery/paintingsdax/spencer'));
		text.text = 'Drawn by Spencer \nI really missed you c: \n- Spencer';
//	default:
//		
//		
	}
	if (Selected > 3) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 3;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}