// script by nullfrequency
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
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

var mainArray:Array<String> = ["dude", "blood", "greetings"];
var extrasArray:Array<String> = ["lemon", "somari", "royalscientist"];
var palsArray:Array<String> = ["pastelfever", "sizssoers", "lighthouse"];
var coversArray:Array<String> = [];
var devArray:Array<String> = ["pastelfever", "lemon", "somari", "dude", "blood", "royalscientist", "greetings", "sizssoers", "lighthouse", "Quite-Strange"];
var songL:FlxTypedGroup<FlxText> = [];

function create() {

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
		for (i in 0...palsArray.length) {
    				songs.push(Chart.loadChartMeta(palsArray[i]));
  			}
		}
	if (FlxG.save.data.sectionselected == 3) {
		for (i in 0...coversArray.length) {
    				songs.push(Chart.loadChartMeta(coversArray[i]));
  			}
		}
	if (FlxG.save.data.sectionselected == 4) {
		for (i in 0...devArray.length) {
    				songs.push(Chart.loadChartMeta(devArray[i]));
  			}
		}
	for (i in 0...songs.length)	
        {
            trace(songs[i].displayName);
            var text = new FlxSprite();
            text.loadGraphic(Paths.image("freeplay/coolsongthings/"+songs[i].displayName));
            text.x = (1280 * i) + 30;
            text.cameras = [uiCamera];
            songL.push(text);
            add(text);
        }
	for (item in grpSongs.members)
		{
			item.alpha = 0;
		}

	for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0;
		}
	curSelected = 0;
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

}


function update() {
	if (controls.LEFT_P) {
		changeSelection(-1);
	}
	
	if (controls.RIGHT_P) {
		changeSelection(1);
	}
	if (FlxG.keys.justPressed.TAB) {
	changeCoopMode(1);
	}

	for (i in 0...songL.length) {
		songL[i].alpha = 0.6;
		songL[curSelected].alpha = 1;
	}
	uiCamera.follow(songL[curSelected], 0.5);
}
