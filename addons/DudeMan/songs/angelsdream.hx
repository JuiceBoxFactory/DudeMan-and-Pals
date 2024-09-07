import flixel.text.FlxTextBorderStyle;
import sys.io.FileSystem;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.FlxCamera;

var enable = false;
var IMGOATED;
var silly = boyfriend.x;
var burping = false;
var burpCounter = 0;

function create() {

    if (FlxG.save.data.angelsDream == true) {

        awesomeCam = new FlxCamera(0, 0, 1280, 720);
        FlxG.cameras.add(awesomeCam, false);
        awesomeCam.bgColor = 0x00000000;

        text = new FlxText(0, 0);
        text.text = "PRESS SPACE TO BURP !!!!!!!!!!!!!!!!!!!!!!!!!!";
        text.setFormat(Paths.font("COMIC.ttf"), 60, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);            
        text.antialiasing = false;
        text.borderSize = 4.25;
        text.alpha = 1;
        text.cameras = [awesomeCam];
        text.screenCenter();
        IMGOATED = text.y;
        text.y = 800;
        add(text);   
        
        burpCount = new FlxText(1000, 650);
        burpCount.text = "burp count: "+burpCounter;
        burpCount.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);            
        burpCount.antialiasing = false;
        burpCount.borderSize = 1.25;
        burpCount.alpha = 1;
        burpCount.cameras = [camHUD];
        add(burpCount);   

        enable = true;

    }

}

function update() {

    burpCount.text = "burp count: "+burpCounter;

    if (FlxG.keys.justPressed.SPACE) {
        FlxG.sound.play(Paths.sound("burp"));
        burping = true;
        burpCounter += 1;
        new FlxTimer().start(1.3, function(timer) {
            burping = false;
            boyfriend.x = silly;
        });
    }

    if (burping == true) {
        boyfriend.x = silly + FlxG.random.int(-2, 2);
        FlxG.camera.shake(0.005, .1);
    }

}

function stepHit(curStep:Int) {

    if (enable == true) {

        switch (curStep) {

            case 0:   
                FlxTween.tween(text, {y: IMGOATED}, 1, {ease:FlxEase.quartOut}); 
                FlxG.sound.play(Paths.sound("alarmSoundBURP"));
                new FlxTimer().start(5.2, function(timer) {
                    FlxTween.tween(text, {y: 800}, 1, {ease:FlxEase.quartOut}); 
                });

        }

    }

}