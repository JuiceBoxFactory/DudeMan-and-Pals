import flixel.text.FlxTextBorderStyle;

var LyricInQuestion:FlxText;

function create() {

	if (FlxG.save.data.subtitles == true) {

	blackHUD = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackHUD.antialiasing = false;
	blackHUD.alpha = 0;
	blackHUD.screenCenter();
	blackHUD.cameras = [camHUD];
	blackHUD.scale.set(6,6);
	blackHUD.updateHitbox();
	add(blackHUD);

	lyricscon = new FlxSprite(0, 500).loadGraphic(Paths.image('LYRICS/none'));
	lyricscon.antialiasing = false;
	lyricscon.cameras = [camHUD];
	lyricscon.scale.x = 1;
	lyricscon.scale.y = 1;
	lyricscon.updateHitbox();
	add(lyricscon);

	lyricscon2 = new FlxSprite(0, 500);
	lyricscon2.frames = Paths.getSparrowAtlas('LYRICS/kathyevilLYRICSCON');
	lyricscon2.antialiasing = false;
	lyricscon2.animation.addByPrefix('static', 'static', 4);
	lyricscon2.animation.addByPrefix('turn', 'turnAF', 4, false);
	lyricscon2.animation.play('static');
	lyricscon2.updateHitbox();
    	lyricscon2.alpha = 0;
	lyricscon2.cameras = [camHUD];
	lyricscon2.updateHitbox();
	add(lyricscon2);

	playSpritesheet = new FlxSprite(375, 490);
	playSpritesheet.frames = Paths.getSparrowAtlas('LYRICS/playSpritesheet');
	playSpritesheet.antialiasing = false;
	playSpritesheet.animation.addByPrefix('wiggle', 'aintNoWay', 4);
	playSpritesheet.animation.play('wiggle');
	playSpritesheet.updateHitbox();
    	playSpritesheet.alpha = 0;
	playSpritesheet.cameras = [camHUD];
	playSpritesheet.updateHitbox();
	add(playSpritesheet);

    LyricInQuestion = new FlxText(125, 550, 1000, "", 0);
    LyricInQuestion.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    LyricInQuestion.scrollFactor.set();
    LyricInQuestion.borderColor = 0xFF000000;
    LyricInQuestion.borderSize = 2;
    add(LyricInQuestion);
    LyricInQuestion.cameras = [camHUD];

    LyricInQuestionfade = new FlxText(125, 550, 1000, "", 0);
    LyricInQuestionfade.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    LyricInQuestionfade.scrollFactor.set();
    LyricInQuestionfade.borderColor = 0xFF000000;
    LyricInQuestionfade.borderSize = 2;
    LyricInQuestionfade.alpha = 0;
    add(LyricInQuestionfade);
    LyricInQuestionfade.cameras = [camHUD];

	}
}

function UpdateLyric(text:String) {
    LyricInQuestion.scale.y = 1.8;
    LyricInQuestion.scale.x = 1.1;
    lyricscon.scale.y = 1.6;
    lyricscon.scale.x = 1.1;
    LyricInQuestion.text = text;
    FlxTween.tween(LyricInQuestion.scale, {y: 1, x: 1}, 0.2, {ease: FlxEase.circOut});
    FlxTween.tween(lyricscon.scale, {y: 1, x: 1}, 0.2, {ease: FlxEase.circOut});
    LyricInQuestionfade.scale.y = 1.8;
    LyricInQuestionfade.scale.x = 1.1;
    LyricInQuestionfade.text = text;
    FlxTween.tween(LyricInQuestionfade.scale, {y: 1, x: 1}, 0.2, {ease: FlxEase.circOut});

}

function UpdateLyric2(text:String) {
    LyricInQuestion.text = text;
    LyricInQuestionfade.text = text;

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 45:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("hmmm");        
        case 57:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("wonder where he is...");   
        case 75:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("oh, there you are !");   
        case 98:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("lets begin."); 
        case 109:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("I only need you to run,");
        case 139:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("with me,");
        case 153:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("today.");
        case 173:
		 LyricInQuestion.color = 0xFFFFDFA3;
		 LyricInQuestion.borderColor = 0xFF5ED277;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 219:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("you can stand up and fight !");
        case 249:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("or be,");
        case 259:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("afraid !");
        case 282:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("its your choice.");
        case 306:
		 LyricInQuestion.color = 0xFFFFDFA3;
		 LyricInQuestion.borderColor = 0xFF5ED277;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 323:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("when were together");
        case 339:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("weve got nothing to fret !");
        case 366:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("cuz the only way you'd live a life");
        case 399:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("with any regrets,");
        case 416:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("is if you-");
        case 425:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("never knew its easy as you");
        case 452:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("want it to be !");
        case 476:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("so stay within that box,");
        case 502:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("or set yourself free !");
        case 526:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("for me.");
        case 539:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("let the sound of it guide you.");
        case 582:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("the beautiful sound !");
        case 608:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("that stems from the depths of your soul.");
        case 645:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("were here to stay !");
        case 685:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("we ll never go away");
        case 738:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("we see the brave tomorrow best,");
        case 790:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("the challenges today !");
        case 845:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("todayyy....");
        case 881:
		 LyricInQuestion.color = 0xFFFFDFA3;
		 LyricInQuestion.borderColor = 0xFF5ED277;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 890:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("hey ! you did great there-");
        case 917:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("though, I have a question.");
        case 945:
		 LyricInQuestion.color = 0xFFFFDFA3;
		 LyricInQuestion.borderColor = 0xFF5ED277;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric("");
        case 960:
		 blackHUD.alpha = 1;
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
		 LyricInQuestionfade.color = 0xFF7C0A00;
		 LyricInQuestionfade.borderColor = 0xFF2D252C;
            UpdateLyric("do");
        case 963:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric("do you");
        case 970:
    		 FlxTween.tween(LyricInQuestionfade, {alpha: 1}, 4, {ease: FlxEase.circOut});		
    		 FlxTween.tween(LyricInQuestion, {alpha: 0}, 4, {ease: FlxEase.circOut});
    		 FlxTween.tween(lyricscon2, {alpha: 1}, 3, {ease: FlxEase.circOut});		
    		 FlxTween.tween(lyricscon, {alpha: 0}, 3, {ease: FlxEase.circOut});
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
		 lyricscon.loadGraphic(Paths.image('LYRICS/kathyFree4meLYRICSCON'));
            UpdateLyric2("do you want");
        case 974:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
            UpdateLyric2("do you want to");
        case 980:
        	 playSpritesheet.alpha = 1;
        case 987:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;
            UpdateLyric2("do you want to        with");
        case 990:
		 LyricInQuestion.color = 0xFF2D252C;
		 LyricInQuestion.borderColor = 0xFFFF00FA;		
            UpdateLyric2("do you want to        with me");
        case 1000:
	      lyricscon2.animation.play('turn');
        case 1016:
  		 lyricscon2.alpha = 0;
  		 lyricscon.alpha = 1;      	 
		 lyricscon.loadGraphic(Paths.image('icons/kathyObituary'));
        case 1020:
		 blackHUD.alpha = 0;
		 LyricInQuestion.color = 0xFFFFDFA3;
		 LyricInQuestion.borderColor = 0xFF5ED277;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
  		 lyricscon.alpha = 0;
        	 playSpritesheet.alpha = 0;
            UpdateLyric2("");
    }
}