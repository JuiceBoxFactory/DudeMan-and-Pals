function create() {

		gifbg = new FlxSprite(200, 0);
		gifbg.antialiasing = false;
		gifbg.frames = Paths.getSparrowAtlas('visuals/sb/skybluegif1');
		gifbg.animation.addByPrefix('animation', 'skybluegif idle', 12);
		gifbg.animation.play('animation');
		gifbg.scale.x = 3;
		gifbg.scale.y = 3;
		gifbg.scrollFactor.set(1, 1);
		gifbg.alpha = 0;
		gifbg.updateHitbox();

		gifbg2 = new FlxSprite(0, 0);
		gifbg2.antialiasing = false;
		gifbg2.frames = Paths.getSparrowAtlas('visuals/sb/skybluegif2');
		gifbg2.animation.addByPrefix('animation', 'skybluegif idle', 12);
		gifbg2.animation.play('animation');
		gifbg2.scale.x = 4;
		gifbg2.scale.y = 4;
		gifbg2.scrollFactor.set(1, 1);
		gifbg2.alpha = 0;
		gifbg2.updateHitbox();

		gifbg3 = new FlxSprite(0, 0);
		gifbg3.antialiasing = false;
		gifbg3.frames = Paths.getSparrowAtlas('visuals/sb/skybluegif3');
		gifbg3.animation.addByPrefix('animation', 'skybluegif idle', 12);
		gifbg3.animation.play('animation');
		gifbg3.scale.x = 4;
		gifbg3.scale.y = 4;
		gifbg3.scrollFactor.set(1, 1);
		gifbg3.alpha = 0;
		gifbg3.updateHitbox();


		gifbg4 = new FlxSprite(200, 0);
		gifbg4.antialiasing = false;
		gifbg4.frames = Paths.getSparrowAtlas('visuals/sb/skybluegif4');
		gifbg4.animation.addByPrefix('animation', 'skybluegif idle', 12);
		gifbg4.animation.play('animation');
		gifbg4.scale.x = 4.5;
		gifbg4.scale.y = 4.5;
		gifbg4.scrollFactor.set(1, 1);
		gifbg4.alpha = 0;
		gifbg4.updateHitbox();


		gifbg5 = new FlxSprite(0, 0);
		gifbg5.antialiasing = false;
		gifbg5.frames = Paths.getSparrowAtlas('visuals/sb/skybluegif5');
		gifbg5.animation.addByPrefix('animation', 'skybluegif idle', 12);
		gifbg5.animation.play('animation');
		gifbg5.scale.x = 4;
		gifbg5.scale.y = 4;
		gifbg5.scrollFactor.set(1, 1);
		gifbg5.alpha = 0;
		gifbg5.updateHitbox();


            topbar = new FlxSprite();
            topbar.makeGraphic(6000, 800, FlxColor.BLACK);
            topbar.scrollFactor.set();
            topbar.x = -490;
            topbar.y = -450;
            topbar.alpha = 0;


            botbar = new FlxSprite();
            botbar.makeGraphic(6000, 800, FlxColor.BLACK);
            botbar.scrollFactor.set();
            botbar.x = -490;
            botbar.y = 450;
            botbar.alpha = 0;


		border = new FlxSprite(0, 0);	
		border.antialiasing = false;
		border.frames = Paths.getSparrowAtlas('visuals/sb/border');
		border.animation.addByPrefix('animation', 'border', 12, false);
		border.animation.play('animation');
		border.scale.x = 1;
		border.scale.y = 1;
		border.scrollFactor.set(1, 1);
		border.alpha = 0;
		border.screenCenter();
		border.cameras = [camHUD];
		border.updateHitbox();


            end = new FlxSprite();
            end.makeGraphic(1280, 720, FlxColor.BLACK);
            end.scrollFactor.set();
            end.screenCenter();
            end.cameras = [camHUD];
            end.alpha = 0;


    text = new FlxText(0, 0, 2000, "this shit is songified autism", 0);
    text.setFormat(Paths.font("vcr.ttf"), 25, FlxColor.WHITE, "center");
    text.scrollFactor.set();
    text.alpha = 0;
    text.screenCenter();
    text.cameras = [camHUD];


		insert(7, gifbg);
		insert(8, gifbg2);
		insert(9, gifbg3);
		insert(10, gifbg4);		
		insert(11, gifbg5);		
		insert(12, topbar);
		insert(12, botbar);           
 		add(border);           
           add(end);            
    		add(text);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 319: 
		camGame.zoom += 0.2;
            gifbg.alpha = 1;
            botbar.alpha = 1;
            topbar.alpha = 1;
		 border.alpha = 1;
        case 336:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 352:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 368:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 384:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 400:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 416:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 422:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 436:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 452:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 468:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 484:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 500:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 516:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 522:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 536:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 552:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 568:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 584:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 600:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 616:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 622:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 636:
		camGame.zoom += 0.4;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 652:
		camGame.zoom += 0.4;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 668:
		camGame.zoom += 0.4;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 684:
		camGame.zoom += 0.4;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 700:
		camGame.zoom += 0.4;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 716:
		camGame.zoom += 0.4;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 722:
		camGame.zoom += 0.4;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 736:
		camGame.zoom += 0.4;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 752:
		camGame.zoom += 0.4;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 768:
		camGame.zoom += 0.4;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 784:
		camGame.zoom += 0.4;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 800:
		camGame.zoom += 0.4;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 816:
		camGame.zoom += 0.4;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 822:
		camGame.zoom += 0.4;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 836:
		camGame.zoom += 0.4;
		gifbg.alpha = 0;
		gifbg4.alpha = 1;
        case 852:
		camGame.zoom += 0.4;
		gifbg4.alpha = 0;
		gifbg2.alpha = 1;
        case 868:
		camGame.zoom += 0.4;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 884:
            FlxTween.tween(end, {alpha: 1}, 10);
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 900:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 916:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
 	   case 922:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 936:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 952:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 968:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 984:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
 	   case 1000:
		camGame.zoom += 0.2;
		gifbg.alpha = 0;
		gifbg2.alpha = 1;
        case 1016:
		camGame.zoom += 0.2;
		gifbg2.alpha = 0;
		gifbg3.alpha = 1;
        case 1022:
		camGame.zoom += 0.2;
		gifbg3.alpha = 0;
		gifbg4.alpha = 1;
        case 1036:
		camGame.zoom += 0.2;
		gifbg4.alpha = 0;
		gifbg5.alpha = 1;
        case 1052:
		camGame.zoom += 0.2;
		gifbg5.alpha = 0;
		gifbg.alpha = 1;
        case 1060:
            FlxTween.tween(text, {alpha: 1}, 4);
	}
}

function beatHit() {
	border.animation.play('animation');
}