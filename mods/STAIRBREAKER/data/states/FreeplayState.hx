// script by superkoolraven
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

var songL:FlxTypedGroup<FlxText> = [];
var box:FlxSprite;
var boxO:FlxSprite;

var ySpd = 0;
var grav = 0.25;
var jumpAmt = 10;
var grounded = false;

var coolBackdrop = FlxBackdrop;

function create() {
	canSelect = false;

	uiCamera = new FlxCamera(0, 0, 1280, 720);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);

	var bg = new FlxSprite(0, 0);
	bg.makeGraphic(2000, 2000, FlxColor.fromRGB(0, 0, 0));
	bg.x = 0;
	bg.y = 0;
	bg.scale.x = bg.scale.y = 100;
	bg.cameras = [uiCamera];
	add(bg);

	coolBackdrop = new FlxBackdrop(Paths.image('brickbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.velocity.x = 0; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 0;
	coolBackdrop.active = true;
	coolBackdrop.scrollFactor.set(0.7, 0.7);
	coolBackdrop.scale.x = coolBackdrop.scale.y = 3;
	coolBackdrop.camera = uiCamera;
	add(coolBackdrop);


	for (i in 0...songs.length)
		{
			var gbg = new FlxSprite(0, 0);
			if (songs[i].color == null) {
				gbg.makeGraphic(120, 219, FlxColor.fromRGB(105, 112, 205));
			} else {
				gbg.makeGraphic(120, 219, FlxColor.fromString(songs[i].color));
			}
			gbg.x = (32 * 16 * i) + 50;
			gbg.y = -130;
			gbg.scale.x = gbg.scale.y = 1.5;
			gbg.cameras = [uiCamera];
			add(gbg);

			var gate = new FlxSprite(0, 0).loadGraphic(Paths.image('gate'));
			gate.x = (32 * 16 * i) + 30;
			gate.y = -200;
			gate.scale.x = gate.scale.y = 1.5;
			gate.cameras = [uiCamera];
			add(gate);

			var text = new FlxText();
			text.text = songs[i].displayName;
			text.color = FlxColor.WHITE;
			text.size = 32;
			text.cameras = [uiCamera];
			text.x = (32 * 16 * i) + 30;
			text.y = -300;

			songL.push(text);
			add(text);

		}
	for (e in 0...64) {
		for (i in 0...16) {
			var tile = new FlxSprite(0, 0).loadGraphic(Paths.image('ground'));
			tile.x = -196 + (64 * i) * 2 + (128 * e);
			tile.y = 200;
			tile.scale.x = tile.scale.y = 2;
			tile.cameras = [uiCamera];
			add(tile);
		}
	}
	for (i in 0...32) {
		var tile = new FlxSprite(0, 0).loadGraphic(Paths.image('wall'));
		tile.x = (256 + 32 + 16) * -2;
		tile.y = ((128 * i * -2) - 64 + 8) + 256;
		tile.scale.x = tile.scale.y = 2;
		tile.cameras = [uiCamera];
		add(tile);
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

    	box = new FlxSprite();
	box.makeGraphic(50, 50, FlxColor.WHITE);
	box.x = 0;
	box.y = 85;
	box.cameras = [uiCamera];
	add(box);

    	boxO = new FlxSprite();
	boxO.makeGraphic(1, 1, FlxColor.WHITE);
	boxO.x = 0;
	boxO.y = 0;
	boxO.cameras = [uiCamera];
	add(box);
}

function update() {
	//if (controls.LEFT_P) {
		//changeSelection(-1);
	//}
	
	//if (controls.RIGHT_P) {
		//changeSelection(1);
	//}

	if (FlxG.keys.justPressed.TAB) {
	changeCoopMode(1);
	}

	if (FlxG.keys.pressed.LEFT) {
		box.x -= 5;
	}

	if (FlxG.keys.pressed.RIGHT) {
		box.x += 5;
	}

	if (FlxG.keys.justPressed.Z && grounded) {
		ySpd -= jumpAmt;
		box.y -= jumpAmt;
	}

	if (box.y < 85) {
		grounded = false;
	}
	if (box.y >= 85) {
		grounded = true;
	}

	if (!grounded) {
		ySpd += grav;
	}

	if (grounded) {
		ySpd = 0;
	}

	if (box.x < -128 - 32 - 64) {
		box.x = -128 - 32 - 64;
	}
	if (box.x > -196 + 4096 + 1024 - 64) {
		box.x = -196 + 4096 + 1024 - 64;
	}

	box.y += ySpd;

	boxO.x = box.x - 0;
	boxO.y = box.y - 100;

	for (i in 0...songL.length)
	{
		if (box.x + 50 > songL[i].x && box.x < songL[i].x + 200) {
			curSelected = i;
		}
	}

	for (i in 0...songL.length) {
		songL[i].alpha = 0.6;
		songL[curSelected].alpha = 1;
	}
	uiCamera.follow(boxO, 3, 200);
	songInstPlaying = false;
}