// script by meltykelpy and nullfrequency, I love you null my frequency <3333
// kill yourself -Null
import funkin.menus.FreeplayState;
import funkin.backend.chart.Chart;
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
import funkin.backend.system.Controls;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.utils.DiscordUtil;

var mainArray:Array<String> = ["dude", "overstimulation", "srs", "colorful", "fang", "sucker"];
var extrasArray:Array<String> = ["evilman", "lemon", "whopper", "slashgen", "die", "blobs", "kockbuddies", "oleum", "misconduct", "sizssoers", "lighthouse", "roomed"];
var coversArray:Array<String> = ["obituary", "meet-your-project"];
var devArray:Array<String> = ["pastelfever", "lemon", "whopper", "dude", "blood", "royalscientist", "greetings", "sizssoers", "lighthouse", "Quite-Strange", "obituary", "kockbuddies"];
var songL:FlxTypedGroup<FlxText> = [];
var intendedCategory = "VS DUDEMAN";

function create() {

	DiscordUtil.changePresenceAdvanced({
		details: "IN: Freeplay",
		state: "This goat playin my mod <3",
		largeImageKey: "icon"
	});

	canSelect = false;

	uiCamera = new FlxCamera(0, 200, 1280, 720);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);

	if (FlxG.save.data.sectionselected == 0) {
		for (i in 0...mainArray.length) {
    				songs.push(Chart.loadChartMeta(mainArray[i]));
  			}
		}
	if (FlxG.save.data.sectionselected == 1) {
		for (i in 0...extrasArray.length) {
    				songs.push(Chart.loadChartMeta(extrasArray[i]));
  			}
		}
	if (FlxG.save.data.sectionselected == 2) {
		for (i in 0...coversArray.length) {
					songs.push(Chart.loadChartMeta(coversArray[i]));
  			}
		}

	if (FlxG.save.data.sectionselected == 3) {
		for (i in 0...devArray.length) {
    				songs.push(Chart.loadChartMeta(devArray[i]));
  			}
		}
	for (i in 0...songs.length)	
        {

            camPos = new FlxSprite();
            camPos.loadGraphic(Paths.image("freeplay/cameraFollow"));
            camPos.x = (1280 * i) - 88;
			camPos.y = 12;
            camPos.cameras = [uiCamera];
			songL.push(camPos);
            add(camPos);

			if (FlxG.save.data.sectionselected == 3 && i == 0 && FlxG.save.data.obituaryThing == true) {
				image = new FlxSprite();
            	image.loadGraphic(Paths.image("freeplay/coolsongthings/obituary"));
            	image.x = (1280 * i) - 28;
				image.y = 12;
            	image.cameras = [uiCamera];
				image.antialiasing = false;
            	add(image);
			}
			else {
            	image = new FlxSprite();
            	image.loadGraphic(Paths.image("freeplay/coolsongthings/"+songs[i].displayName));
            	image.x = (1280 * i) - 28;
				image.y = 12;
				image.antialiasing = false;
            	image.cameras = [uiCamera];
            	add(image);
			}

            border = new FlxSprite();
            border.loadGraphic(Paths.image("freeplay/iconBorder"));
            border.x = (1280 * i) - 40;
            border.cameras = [uiCamera];
            add(border);

			if (FlxG.save.data.sectionselected == 3 && i == 0 && FlxG.save.data.obituaryThing == true) {
				info1 = new FlxText();
				info1.text = "Obituary";
				info1.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
				info1.x = (1280 * i) + 333;
				info1.y += -9;
				info1.cameras = [uiCamera];
				info1.color = 0xFFFFFFFF;
				info1.borderColor = 0xFF000000;
				info1.antialiasing = false;
				info1.borderSize = 2;
				add(info1);
			}
			else {
				info1 = new FlxText();
				info1.text = songs[i].displayName;
				info1.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
				info1.x = (1280 * i) + 333;
				info1.y += -9;
				info1.cameras = [uiCamera];
				info1.color = 0xFFFFFFFF;
				info1.borderColor = 0xFF000000;
				info1.antialiasing = false;
				info1.borderSize = 2;
				add(info1);
			}

			if (FlxG.save.data.sectionselected == 3 && i == 0 && FlxG.save.data.obituaryThing == null) {
				info2 = new FlxText(0, 0, 350, "im goated", 0);
				info2.text = "oohhhh thats kathy";
				info2.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
				info2.x = (1280 * i) + 333;
				info2.y += 35;
				info2.cameras = [uiCamera]; 
				info2.color = 0xFFFFFFFF;
				info2.borderColor = 0xFF000000;
				info2.antialiasing = false;
				info2.borderSize = 2;
				add(info2);
			}
			else {
				info2 = new FlxText(0, 0, 350, "im goated", 0);
				info2.text = songs[i].bio;
				info2.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
				info2.x = (1280 * i) + 333;
				info2.y += 35;
				info2.cameras = [uiCamera]; 
				info2.color = 0xFFFFFFFF;
				info2.borderColor = 0xFF000000;
				info2.antialiasing = false;
				info2.borderSize = 2;
				add(info2);
			}

            info3 = new FlxText(0, 0, 900, "im goated", 0);
            info3.text = songs[i].actoresses;
            info3.setFormat(Paths.font("COMIC.ttf"), 17, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
            info3.x = (1280 * i) + 333;
            info3.y += 222;
            info3.cameras = [uiCamera]; 
            info3.color = 0xFFFFFFFF;
            info3.borderColor = 0xFF000000;
            info3.antialiasing = false;
            info3.borderSize = 2;
            add(info3);

        }
	for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0;
		}
	
	changeSelection(FlxG.save.data.songSelected);

}

function postCreate() {

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	freeplaytitle = new FlxSprite(175, 10).loadGraphic(Paths.image('freeplay/name'));
	freeplaytitle.antialiasing = false;
	freeplaytitle.updateHitbox();
	add(freeplaytitle);

	arrows = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/menuuiarrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	add(arrows);

	waitImGoated = new FlxText(0, 225);
	waitImGoated.text = "SCORE: NULL";
	waitImGoated.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	waitImGoated.color = 0xFFFFFFFF;
	waitImGoated.screenCenter(FlxAxes.X);
	waitImGoated.borderColor = 0xFF000000;
	waitImGoated.antialiasing = false;
	waitImGoated.borderSize = 2;
	add(waitImGoated);

}

function update() {

	if (FlxG.save.data.language == "english") {
		waitImGoated.text = "SCORE: "+intendedScore;
	}
	if (FlxG.save.data.language == "spanish") {
		waitImGoated.text = "PUNTUACIÓN: "+intendedScore;
	}
	waitImGoated.screenCenter(FlxAxes.X);

	if (controls.LEFT_P) {
		changeSelection(-1);
	}
	
	if (controls.RIGHT_P) {
		changeSelection(1);
	}
	

	for (i in 0...songL.length) {
		songL[i].alpha = 0.6;
		songL[curSelected].alpha = 1;
	}
	uiCamera.follow(songL[curSelected], 0.5);

}

function postUpdate() {

	FlxG.save.data.songSelected = curSelected;

	if (controls.BACK) {
		FlxG.switchState(new ModState("FreeplaySelector"));
	}

}
