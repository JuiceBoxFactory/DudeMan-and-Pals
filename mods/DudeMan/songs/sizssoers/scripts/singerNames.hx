function postCreate() {

	opponent = new FlxSprite(375, 1200).loadGraphic(Paths.image('singerNames/GhosttaleSans'));
	opponent.antialiasing = false;
	opponent.scrollFactor.set(1, 1);
	opponent.scale.x = 1.2;
	opponent.scale.y = 1.2;	
	opponent.alpha = 1;
	opponent.cameras = [camHUD];
	opponent.updateHitbox();
	add(opponent);

	vs = new FlxSprite(450, 1200).loadGraphic(Paths.image('singerNames/VS'));
	vs.antialiasing = false;
	vs.scrollFactor.set(1, 1);
	vs.scale.x = 1.2;
	vs.scale.y = 1.2;
	vs.screenCenter();	
	vs.alpha = 0;
	vs.cameras = [camHUD];
	vs.updateHitbox();
	add(vs);

	playerName = new FlxSprite(700, 1200).loadGraphic(Paths.image('singerNames/Dax'));
	playerName.antialiasing = false;
	playerName.scrollFactor.set(1, 1);
	playerName.scale.x = 1.2;
	playerName.scale.y = 1.2;	
	playerName.alpha = 1;
	playerName.cameras = [camHUD];
	playerName.updateHitbox();
	add(playerName);

	thisisyou = new FlxSprite(750, 1400).loadGraphic(Paths.image('singerNames/UPSCROLLthanksStar'));
	thisisyou.antialiasing = false;
	thisisyou.scrollFactor.set(1, 1);
	thisisyou.scale.x = 0.6;
	thisisyou.scale.y = 0.6;	
	thisisyou.alpha = 1;
	thisisyou.cameras = [camHUD];
	thisisyou.updateHitbox();
	add(thisisyou);

	vs.y = 1200;

}


function stepHit(curStep:Int) { 
    switch (curStep) {
        case 16:
	    vs.alpha = 1;
            FlxTween.tween(playerName, {y: 250}, 3, {ease:FlxEase.quartOut});	    
            FlxTween.tween(opponent, {y: 250}, 3, {ease:FlxEase.quartOut});	 
            FlxTween.tween(vs, {y: 250}, 3, {ease:FlxEase.quartOut});	
            FlxTween.tween(thisisyou, {y: 450}, 3, {ease:FlxEase.quartOut});	
        case 76:
            FlxTween.tween(playerName, {y: 1200}, 2, {ease:FlxEase.quartIn});	    
            FlxTween.tween(opponent, {y: 1200}, 2, {ease:FlxEase.quartIn});	 
            FlxTween.tween(vs, {y: 1200}, 2, {ease:FlxEase.quartIn});
            FlxTween.tween(thisisyou, {y: 1200}, 2, {ease:FlxEase.quartIn});
    }
}