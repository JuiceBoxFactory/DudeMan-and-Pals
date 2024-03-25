import flixel.text.FlxTextBorderStyle;

var LyricInQuestion:FlxText;

function create() {

	if (FlxG.save.data.subtitles == true) {

	lyricscon = new FlxSprite(0, 500).loadGraphic(Paths.image('LYRICS/none'));
	lyricscon.antialiasing = false;
	lyricscon.cameras = [camHUD];
	lyricscon.scale.x = 1;
	lyricscon.scale.y = 1;
	lyricscon.updateHitbox();
	add(lyricscon);

    LyricInQuestion = new FlxText(125, 550, 1000, "", 0);
    LyricInQuestion.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    LyricInQuestion.scrollFactor.set();
    LyricInQuestion.borderColor = 0xFF000000;
    LyricInQuestion.borderSize = 2;
    add(LyricInQuestion);
    LyricInQuestion.cameras = [camHUD];

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

}

function stepHit(curStep:Int) { 
    switch (curStep) {      
        case 544:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("milk and cereal"); 
        case 560:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("milk and cereal !"); 
        case 576:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("milk and cereal"); 
        case 592:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("cereal and milk !"); 
        case 608:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 900:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 960:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric(""); 
        case 866:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("im chewing on.."); 
        case 875:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("hubba bubba max"); 
        case 1023:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("MUFFLED SCREAMING"); 
        case 909:
		 LyricInQuestion.color = 0xFFFFFFFF;
		 LyricInQuestion.borderColor = 0xFF484848;
		 lyricscon.loadGraphic(Paths.image('LYRICS/dudemanLYRICSCON'));
            UpdateLyric("I got 4 pieces in my mouth rn"); 
        case 928:
		 LyricInQuestion.color = 0xFFFF2D32;
		 LyricInQuestion.borderColor = 0xFFFAE237;
		 lyricscon.loadGraphic(Paths.image('LYRICS/bfLYRICSCON'));
            UpdateLyric("DAMMMNNNNNNN");  
    }
}