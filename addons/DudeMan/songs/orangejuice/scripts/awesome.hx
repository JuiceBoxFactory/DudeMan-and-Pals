var rotation = false;

function create() {

	buildingbg = new FlxSprite(0, 1300).loadGraphic(Paths.image('backdrop/drawingBoardOJ/backgroundBuild'));
	buildingbg.antialiasing = false;
	buildingbg.alpha = 1;
	buildingbg.scrollFactor.set(0.75, 0.75);
	insert(3,buildingbg);

	building1 = new FlxSprite(0, 900).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build1'));
	building1.antialiasing = false;
	building1.alpha = 1;
	building1.scrollFactor.set(0.9, 0.9);
	insert(4,building1);

	building2 = new FlxSprite(0, 1000).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build2'));
	building2.antialiasing = false;
	building2.alpha = 1;
	building2.scrollFactor.set(0.9, 0.9);
	insert(5,building2);

	building3 = new FlxSprite(0, 1100).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build3'));
	building3.antialiasing = false;
	building3.alpha = 1;
	building3.scrollFactor.set(0.9, 0.9);
	insert(6,building3);

	fog = new FlxSprite(0, 975);	
	fog.frames = Paths.getSparrowAtlas('backdrop/drawingBoardOJ/smoke');
	fog.animation.addByPrefix('thangInQuestion', 'doYoThang', 2);
	fog.animation.play('thangInQuestion');
	fog.antialiasing = false;
	fog.alpha = 1;
	fog.scrollFactor.set(1, 1);
	insert(8, fog);

	pushBuilding = new FlxSprite(-75, 1300).loadGraphic(Paths.image('backdrop/drawingBoardOJ/pushBuilding'));
	pushBuilding.antialiasing = false;
	pushBuilding.alpha = 1;
	insert(14, pushBuilding);

	cloudy = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/drawingBoardOJ/cloudy'));
	cloudy.antialiasing = false;
	cloudy.alpha = 1;
	insert(15, cloudy);

	bClouds = new FlxSprite(100, -2000).loadGraphic(Paths.image('backdrop/drawingBoardOJ/behindClouds'));
	bClouds.antialiasing = false;
	bClouds.scrollFactor.set(0.5, 0.5);
	bClouds.scale.set(1.5, 1.5);
	bClouds.alpha = 1;
	insert(2, bClouds);

	clouds = new FlxSprite(300, -4000).loadGraphic(Paths.image('backdrop/drawingBoardOJ/clouds'));
	clouds.antialiasing = false;
	clouds.scale.set(1.5, 1);
	insert(30, clouds);

}

function update(elapsed) {

	if (rotation == true) {
		boyfriend.angle += 0.05;
		dad.angle -= 0.08;
		gf.angle += 0.1;
	}

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0: 
          defaultCamZoom = 1.5;
	case 118:
//	  FlxTween.tween(ntsc, {alpha: 1}, 2, {ease:FlxEase.quartInOut});
	case 128:
//	  ntsc.alpha = 0;
        case 248: 
          defaultCamZoom = 1.8;
	  FlxG.camera.shake(0.01, 0.6);
	  for (shit in [buildingbg, building1, building2, building3]) {
	  	FlxTween.tween(shit, {y: 0}, 2.5, {ease:FlxEase.quartOut});
	}
	  	FlxTween.tween(fog, {y: 75}, 1, {ease:FlxEase.quartOut});
        case 256: 
	  FlxG.camera.followLerp = 0;
	  FlxTween.tween(camGame.scroll, {y: 405}, 4, {ease:FlxEase.quartInOut});
	  FlxTween.tween(camHUD, {alpha: 0}, 2);			
          defaultCamZoom = 0.8;
        case 306: 
	  FlxTween.tween(camGame.scroll, {y: 745}, 1.5, {ease:FlxEase.quartInOut});
	  FlxTween.tween(camHUD, {alpha: 1}, 1.25);
//	  FlxTween.tween(camGame.scroll, {x: 510.821464616515}, 1.25, {ease:FlxEase.quartInOut});			
          defaultCamZoom = 1.2;
        case 320: 
	  FlxG.camera.followLerp = 0.04;
	  	case 500:
			FlxTween.tween(pushBuilding, {y: 500}, 0.5, {ease:FlxEase.bounceIn}); 
		case 504:
			FlxG.camera.followLerp = 0;
			defaultCamZoom = 0.8;
			FlxTween.tween(camGame.scroll, {y: -3600}, 2, {ease:FlxEase.quartInOut}); 
			FlxTween.tween(boyfriend, {y: -3400}, 3, {ease:FlxEase.quartOut});
			FlxTween.tween(boyfriend, {angle: 720}, 3, {ease:FlxEase.quartOut});  
			FlxTween.tween(gf, {y: -3400}, 3, {ease:FlxEase.quartOut});
			FlxTween.tween(gf, {alpha: 0}, 0.75, {ease:FlxEase.quartOut});
			FlxTween.tween(gf, {angle: 360}, 3, {ease:FlxEase.quartOut});  
			FlxTween.tween(dad, {y: -3400}, 3, {ease:FlxEase.quartOut});
			FlxTween.tween(dad, {angle: -720}, 3, {ease:FlxEase.quartOut}); 
		case 512:
			rotation = true; 
		case 514:
			FlxG.camera.followLerp = 0.04;
		case 760:
			FlxTween.tween(boyfriend, {y: -1800}, 2, {ease:FlxEase.quartInOut});
			FlxTween.tween(gf, {y: -1800}, 2, {ease:FlxEase.quartInOut});
			FlxTween.tween(dad, {y: -1800}, 2, {ease:FlxEase.quartInOut});
			FlxTween.tween(gf, {alpha: 1}, 2, {ease:FlxEase.quartIn});
			FlxTween.tween(clouds, {alpha: 0.4}, 2, {ease:FlxEase.quartInOut});
			FlxTween.tween(clouds, {"scale.x": 1.7}, 2, {ease:FlxEase.quartInOut});
		case 778:
			rotation = false;
			pushBuilding.alpha = 0;
			FlxTween.tween(boyfriend, {y: 805}, 40, {ease:FlxEase.quadIn});
			FlxTween.tween(boyfriend, {angle: 0}, 40, {ease:FlxEase.quadIn});  
			FlxTween.tween(gf, {y: 795}, 40, {ease:FlxEase.quadIn});
			FlxTween.tween(gf, {angle: 0}, 40, {ease:FlxEase.quadIn});  
			FlxTween.tween(dad, {y: 800}, 40, {ease:FlxEase.quadIn});
			FlxTween.tween(dad, {angle: 0}, 40, {ease:FlxEase.quadIn});  
	}
}