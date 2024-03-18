import flixel.util.FlxSave;
var leftSideSinger = FlxG.save.data.leftSideSinger;
var rightSideSinger = FlxG.save.data.rightSideSinger;

function postCreate() {

	leftSideName = new FlxSprite(375, 1200).loadGraphic(Paths.image('singerNames/'+FlxG.save.data.leftSideSinger));
	leftSideName.antialiasing = false;
	leftSideName.scrollFactor.set(1, 1);
	leftSideName.scale.x = 1.2;
	leftSideName.scale.y = 1.2;	
	leftSideName.alpha = 1;
	leftSideName.cameras = [camHUD];
	leftSideName.updateHitbox();
	add(leftSideName);

	vs = new FlxSprite(450, 1200).loadGraphic(Paths.image('singerNames/VS'));
	vs.antialiasing = false;
	vs.scrollFactor.set(1, 1);
	vs.scale.x = 1.2;
	vs.scale.y = 1.2;
	vs.screenCenter();	
	vs.alpha = 1;
	vs.cameras = [camHUD];
	vs.updateHitbox();
	add(vs);

	rightSideName = new FlxSprite(700, 1200).loadGraphic(Paths.image('singerNames/'+FlxG.save.data.rightSideSinger));
	rightSideName.antialiasing = false;
	rightSideName.scrollFactor.set(1, 1);
	rightSideName.scale.x = 1.2;
	rightSideName.scale.y = 1.2;	
	rightSideName.alpha = 1;
	rightSideName.cameras = [camHUD];
	rightSideName.updateHitbox();
	add(rightSideName);

if (!downscroll) {
	thisisyou = new FlxSprite(750, 1400).loadGraphic(Paths.image('singerNames/UPSCROLLthanksStar'));
	if (PlayState.SONG.meta.name == "royalscientist") {
		thisisyou.x = 435;
		}
}
if (downscroll) {
	thisisyou = new FlxSprite(750, 1400).loadGraphic(Paths.image('singerNames/DOWNSCROLLthanksStar'));
	if (PlayState.SONG.meta.name == "royalscientist") {
		thisisyou.x = 435;
		}
}
	thisisyou.antialiasing = false;
	thisisyou.scrollFactor.set(1, 1);
	thisisyou.scale.x = 0.6;
	thisisyou.scale.y = 0.6;	
	thisisyou.alpha = 1;
	thisisyou.cameras = [camHUD];
	thisisyou.updateHitbox();
	add(thisisyou);

	vs.y = 1200;

  	if (PlayState.SONG.meta.name == "lemon" || PlayState.SONG.meta.name == "misconduct" || PlayState.SONG.meta.name == "roomed" || PlayState.SONG.meta.name == "lighthouse" || PlayState.SONG.meta.name == "sizssoers") {
	rightSideName.alpha = 0;
	vs.alpha = 0;
	leftSideName.alpha = 0;
	thisisyou.alpha = 0;
	}

}


function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0:
            FlxTween.tween(leftSideName, {y: 250}, 3, {ease:FlxEase.quartOut});	    
            FlxTween.tween(rightSideName, {y: 250}, 3, {ease:FlxEase.quartOut});	 
            FlxTween.tween(vs, {y: 250}, 3, {ease:FlxEase.quartOut});	
            FlxTween.tween(thisisyou, {y: 460}, 3, {ease:FlxEase.quartOut});	
        case 35:
            FlxTween.tween(rightSideName, {y: 1200}, 2, {ease:FlxEase.quartIn});	    
            FlxTween.tween(leftSideName, {y: 1200}, 2, {ease:FlxEase.quartIn});	 
            FlxTween.tween(vs, {y: 1200}, 2, {ease:FlxEase.quartIn});
            FlxTween.tween(thisisyou, {y: 1200}, 2, {ease:FlxEase.quartIn});
    }
}