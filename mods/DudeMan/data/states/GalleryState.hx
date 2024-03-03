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

	FlxG.sound.playMusic(Paths.music('gallery'), 1, true);

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
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	switch(Selected) {
	case 0:
		paintings.loadGraphic(Paths.image('gallery/paintings/penkaru'));
		text.text = 'I made this image as a joke and they told me to kill myself \n- Mel';
	case 1:
		paintings.loadGraphic(Paths.image('gallery/paintings/cclogo'));
		text.text = 'unused asset from Code of Misconduct, it was originally gonna show up as a transition between the main section and the CertainContext style sprites, but i just ended up not doing it. you can actually still find this in the visuals folder under images/visuals/misconduct !';
	case 2:
		paintings.loadGraphic(Paths.image('gallery/paintings/whythefuck'));
		text.text = 'I dont know why the fuck this shit is in the files bro. well, actually I do technically. raven added it to the files for some reason and I dont know why, it wasnt even that funny man. I swear im going to bite his ears off mark my words.';
	case 3:
		paintings.loadGraphic(Paths.image('gallery/paintings/santa'));
		text.text = 'heh. that moment when you realised santa FUCKED the christmas turkey \n- frumpo';
	case 4:
		paintings.loadGraphic(Paths.image('gallery/paintings/burningdog'));
		text.text = 'HELP MEEEEE IM BURNNNNIINNNGGGGGGG HELPPPPPP MEEEEEEE \n- burning dog';
//	default:
//		
//		
	}
	if (Selected > 4) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 4;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}