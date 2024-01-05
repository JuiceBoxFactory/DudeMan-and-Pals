/**
import flixel.text.FlxTextBorderStyle;

var AA:FlxText;

 function create() {
	samuel = new FlxSprite(550, 1000).loadGraphic(Paths.image('him/samueljerkingoff'));
	samuel.antialiasing = false;
	samuel.cameras = [camHUD];
	samuel.scale.x = 0.2;
	samuel.scale.y = 0.2;
	samuel.updateHitbox();
	add(samuel);
	
     AA = new FlxText(500, 2000, 1000, "Samuel Jumpscare", 0);
     AA.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     AA.scrollFactor.set();
     AA.borderColor = 0xFF000000;
     AA.borderSize = 2;
     add(AA);
     AA.cameras = [camHUD];

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 55:
    FlxTween.tween(AA, {y: 400}, 2, {ease: FlxEase.circOut});
    FlxTween.tween(samuel, {y: 100}, 2, {ease: FlxEase.circOut});
        case 85:
    FlxTween.angle(samuel, samuel.angle, samuel.angle - 360, 1, {ease: FlxEase.circOut});      
    FlxTween.tween(samuel, {y: 1000}, 2, {ease: FlxEase.circIn});
    FlxTween.tween(AA, {y: 2000}, 2, {ease: FlxEase.circIn});
	}
}
**/