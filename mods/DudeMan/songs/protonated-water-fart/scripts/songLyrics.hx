import flixel.text.FlxTextBorderStyle;

var LyricInQuestion:FlxText;

function create() {

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
        case 124:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("I have reached");         
        case 131:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("the peak of insanity.");
        case 148:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("I am now sitting on a chair-");
        case 176:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("and the chair, is on my bed.");
        case 200:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric("");
        case 210:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("so, would that mean I am sitting on a chair ?");
        case 236:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("or sitting on my bed ?");
        case 256:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/none'));
            UpdateLyric("");
        case 2622:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("ayo ?");
        case 2632:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("AYO ?");
        case 2644:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("AYO ?!?!??!");
        case 2658:
		 LyricInQuestion.color = 0xFFFF0000;
		 LyricInQuestion.borderColor = 0xFF5100FF;
		 lyricscon.loadGraphic(Paths.image('LYRICS/koseLYRICSCON'));
            UpdateLyric("*dies cutely X3*");
    }
}