import flixel.text.FlxTextBorderStyle;

var LyricInQuestion:FlxText;

function postCreate() {

	if (FlxG.save.data.subtitles == true) {
    	LyricInQuestion = new FlxText(150, 550, 1000, "", 0);
    	LyricInQuestion.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    	LyricInQuestion.scrollFactor.set();
    	LyricInQuestion.borderColor = 0xFF000000;
    	LyricInQuestion.borderSize = 2;
        LyricInQuestion.cameras = [camHUD];
    	add(LyricInQuestion);
	}
	
    ominous1 = new FlxText(-325, 300, 2000, "HE WAITS IN THE FOG", 0);
    ominous1.setFormat(Paths.font("vcr.ttf"), 70, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    ominous1.scrollFactor.set();
    ominous1.borderColor = 0xFF000000;
    ominous1.borderSize = 2;
    ominous1.alpha = 0;
    ominous1.cameras = [camHUD];
    add(ominous1);

    ominous2 = new FlxText(-325, 375, 2000, "turn off your light.", 0);
    ominous2.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    ominous2.scrollFactor.set();
    ominous2.borderColor = 0xFF000000;
    ominous2.borderSize = 2;
    ominous2.alpha = 0;
    ominous2.cameras = [camHUD];
    add(ominous2);

    Songname = new FlxText(-350, 300, 2000, "LIGHTHOUSE", 0);
    Songname.setFormat(Paths.font("vcr.ttf"), 70, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Songname.scrollFactor.set();
    Songname.borderColor = 0xFF000000;
    Songname.borderSize = 2;
    Songname.alpha = 0;
    Songname.cameras = [camHUD];
    add(Songname);

    tagline = new FlxText(-350, 375, 2000, "AMONG THE FOG", 0);
    tagline.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    tagline.scrollFactor.set();
    tagline.borderColor = 0xFF000000;
    tagline.borderSize = 2;
    tagline.alpha = 0;
    tagline.cameras = [camHUD];
    add(tagline);

    HENRY = new FlxText(-350, 150, 2000, "HENRY", 0);
    HENRY.setFormat(Paths.font("vcr.ttf"), 70, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    HENRY.scrollFactor.set();
    HENRY.borderColor = 0xFF000000;
    HENRY.borderSize = 2;
    HENRY.alpha = 0;
    HENRY.cameras = [camHUD];
    add(HENRY);

    BIGBOB = new FlxText(-350, 450, 2000, "BIG-BOB", 0);
    BIGBOB.setFormat(Paths.font("vcr.ttf"), 70, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    BIGBOB.scrollFactor.set();
    BIGBOB.borderColor = 0xFF000000;
    BIGBOB.borderSize = 2;
    BIGBOB.alpha = 0;
    BIGBOB.cameras = [camHUD];
    add(BIGBOB);

    VS = new FlxText(-350, 300, 2000, "VS", 0);
    VS.setFormat(Paths.font("vcr.ttf"), 70, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    VS.scrollFactor.set();
    VS.borderColor = 0xFF000000;
    VS.borderSize = 2;
    VS.alpha = 0;
    VS.cameras = [camHUD];
    add(VS);

}

function postCreate() {

    iconP1.alpha = 0;
    iconP2.alpha = 0;
    healthBarBG.alpha = 0;
    healthBar.alpha = 0;
    missesTxt.alpha = 0;
    scoreTxt.alpha = 0;

}

function UpdateLyric(text:String) {
    LyricInQuestion.text = text;
}

function stepHit(curStep:Int) { 
    switch (curStep) {
	    case 0:
            FlxTween.tween(Songname, {alpha: 1}, 2);
            FlxTween.tween(tagline, {alpha: 1}, 2);
        case 9:
		    LyricInQuestion.color = 0xFFFFFFFF;
            UpdateLyric('in a terrifying turn of events');        
        case 27:
            UpdateLyric('a creature only known as big bob');  
        case 48:
            FlxTween.tween(Songname, {alpha: 0}, 2);
            FlxTween.tween(tagline, {alpha: 0}, 2);
            UpdateLyric('has been roaming the waters and EATING lighthouses');  
	    case 60:
            FlxTween.tween(ominous1, {alpha: 1}, 4);
            FlxTween.tween(ominous2, {alpha: 1}, 4);
        case 80:
            UpdateLyric('taking fog with it as it goes-');
        case 100:
            UpdateLyric('If you work at a lighthouse,                   ');
        case 116:
            UpdateLyric('If you work at a lighthouse, be safe out there.');
            FlxTween.tween(ominous1, {alpha: 0}, 3);
            FlxTween.tween(ominous2, {alpha: 0}, 3);
        case 128:
            FlxTween.tween(iconP1, {alpha: 1}, 3);
            FlxTween.tween(iconP2, {alpha: 1}, 3);
            FlxTween.tween(healthBar, {alpha: 1}, 3);
            FlxTween.tween(healthBarBG, {alpha: 1}, 3);
            FlxTween.tween(scoreTxt, {alpha: 1}, 3);
            FlxTween.tween(missesTxt, {alpha: 1}, 3);
            UpdateLyric('');
        case 688:
            HENRY.alpha = 1;
        case 692:
    	    VS.alpha = 1;
	    case 696:
    	    BIGBOB.alpha = 1;
	    case 704:
    	    HENRY.alpha = 0;
    	    VS.alpha = 0;
    	    BIGBOB.alpha = 0;
    }
}