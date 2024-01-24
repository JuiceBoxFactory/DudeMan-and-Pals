function postCreate() {

	opponent = new FlxSprite(150, 800).loadGraphic(Paths.image('singerNames/MeltyKelpy'));
	opponent.antialiasing = false;
	opponent.scrollFactor.set(1, 1);
	opponent.scale.x = 2;
	opponent.scale.y = 2;	
	opponent.alpha = 1;
	opponent.cameras = [camHUD];
	opponent.updateHitbox();
	add(opponent);

	vs = new FlxSprite(435, 800).loadGraphic(Paths.image('singerNames/VS'));
	vs.antialiasing = false;
	vs.scrollFactor.set(1, 1);
	vs.scale.x = 2;
	vs.scale.y = 2;	
	vs.alpha = 1;
	vs.cameras = [camHUD];
	vs.updateHitbox();
	add(vs);

	playerName = new FlxSprite(725, 800).loadGraphic(Paths.image('singerNames/SoupSkid'));
	playerName.antialiasing = false;
	playerName.scrollFactor.set(1, 1);
	playerName.scale.x = 2;
	playerName.scale.y = 2;	
	playerName.alpha = 1;
	playerName.cameras = [camHUD];
	playerName.updateHitbox();
	insert(50,playerName);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0:
            FlxTween.tween(playerName, {y: 100}, 3, {ease:FlxEase.quartOut});	    
            FlxTween.tween(opponent, {y: 100}, 3, {ease:FlxEase.quartOut});	 
            FlxTween.tween(vs, {y: 100}, 3, {ease:FlxEase.quartOut});	
        case 50:
            FlxTween.tween(playerName, {y: 800}, 2, {ease:FlxEase.quartIn});	    
            FlxTween.tween(opponent, {y: 800}, 2, {ease:FlxEase.quartIn});	 
            FlxTween.tween(vs, {y: 800}, 2, {ease:FlxEase.quartIn});
    }
}