import flixel.util.FlxTimer;

var phoneTime = 0;

function create() {

    FlxG.sound.playMusic(Paths.sound('fnaf/phoneCall'), 2, false);

    fuckingPhone = new FlxSprite(0, 0);
    fuckingPhone.frames = Paths.getFrames('shh/FNAF/phoneLine');
    fuckingPhone.animation.addByPrefix('boil','boil',6, true);
    fuckingPhone.animation.play('boil');
    fuckingPhone.visible = true;
    fuckingPhone.scrollFactor.set();
    fuckingPhone.screenCenter();
    fuckingPhone.alpha = 0;
    add(fuckingPhone);

    subtitles = new FlxText(0, 600, 400);
    subtitles.text = '';
    subtitles.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center");            
    subtitles.screenCenter(FlxAxes.X);
    subtitles.antialiasing = false;
    add(subtitles);

}

function update() {

    subtitlesBitch();
    phoneTime = FlxG.sound.music.time * 0.001;
    trace(phoneTime);
    subtitlesBitch();

    if (phoneTime == 223) {
        loadNight();
    }
    subtitlesBitch();


}

function postUpdate() {

    subtitlesBitch();

	if (controls.ACCEPT) {
        loadNight();
    }

}

function updateText(dialogue) {

    subtitles.text = ""+dialogue;
    subtitles.screenCenter(FlxAxes.X);

}

function subtitlesBitch() {

    if (phoneTime == 2) {
        FlxTween.tween(fuckingPhone, {alpha: 1}, 2, {ease:FlxEase.quartOut});
        updateText("*PHONE RINGING*");
    }
    if (phoneTime == 4) {
        FlxTween.tween(subtitles, {alpha: 0}, 1, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 6) {
        FlxTween.tween(subtitles, {alpha: 1}, 2, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 8) {
        FlxTween.tween(subtitles, {alpha: 0}, 1, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 10.6) {
        FlxTween.tween(subtitles, {alpha: 1}, 1.2, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 12) {
        subtitles.alpha = 0;
    }
    if (phoneTime == 13) {
        subtitles.alpha = 1;
        updateText("PUZZLE THE PRICK:\nHey Hey Hey !");
    }
    if (phoneTime == 14) {
        updateText("PUZZLE THE PRICK:\nYou've returned.");
    }
    if (phoneTime == 15.68) {
        updateText("PUZZLE THE PRICK:\nWelcome to Dudeman's Emporium.");
    }
    if (phoneTime == 17.88) {
        updateText("PUZZLE THE PRICK:\nA place where Dudeman and Pals chill !... and stuff.");
    }
    if (phoneTime == 20.7) {
        updateText("PUZZLE THE PRICK:\nLet me tell you, you made a");
    }
    if (phoneTime == 22) {
        subtitles.setFormat(Paths.font("Bahnschrift.ttf"), 30, FlxColor.WHITE, "center");  
        updateText("PUZZLE THE PRICK:\nBIG MISTAKE");
    }
    if (phoneTime == 22.8) {
        subtitles.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center");  
        updateText("PUZZLE THE PRICK:\nHiring for this shitshow.");
    }
    if (phoneTime == 24.5) {
        updateText("PUZZLE THE PRICK:\nYou're pretty much asking to be killed.");
    }
    if (phoneTime == 26.5) {
        updateText("PUZZLE THE PRICK:\nHe's gonna fuck up EVERYTHING for you !");
    }
    if (phoneTime == 29.48) {
        updateText("PUZZLE THE PRICK:\nand by that, I mean killing you.");
    }
    if (phoneTime == 31.4 || phoneTime == 31.5 || phoneTime == 31.3) {
        updateText("PUZZLE THE PRICK:\nJUST LIKE HOW HE FUCKED EVERYTHING UP FOR ME");
    }
    if (phoneTime == 33) {
        subtitles.alpha = 0;
    }
    if (phoneTime == 33.56) {
        subtitles.alpha = 1;
        updateText("PUZZLE THE PRICK:\n*sigh* no matter.");
    }
    if (phoneTime == 35.1) {
        updateText("PUZZLE THE PRICK:\nI will let you on a call with a friend of mine");
    }
    if (phoneTime == 37.20) {
        updateText("PUZZLE THE PRICK:\nHe should help you get the gist of things");
    }
    if (phoneTime == 39.20) {
        updateText("PUZZLE THE PRICK:\nBetter than I probably could");
    }
    if (phoneTime == 41) {
        updateText("PUZZLE THE PRICK:\nBUH BYE !");
    }
    if (phoneTime == 41.90) {
        updateText("PUZZLE THE PRICK:\nagain.");
    }  
    if (phoneTime == 42.68) {
        FlxTween.tween(subtitles, {alpha: 0}, 0.3, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 43) {
        subtitles.alpha = 1;
        updateText("BEEP");        
    }  
    if (phoneTime == 43.96) {
        updateText("?:\nhey hey hey !");
    } 
    if (phoneTime == 45.24) {
        updateText("?:\nSeems like puzzle gave me the right number !");
    } 
    if (phoneTime == 47.3 || phoneTime == 47.4 || phoneTime == 47.2) {
        subtitles.alpha = 0;
    } 
    if (phoneTime == 48.12 || phoneTime == 48.22 || phoneTime == 48.02) {
        subtitles.alpha = 1;
        updateText("NATE:\nMy Name's Nate.");
    }       
    if (phoneTime == 49.6 || phoneTime == 49.7 || phoneTime == 49.5) {
        updateText("NATE:\nYou don't really need to know that, But I thought I'd tell you anyways.");
    }
    if (phoneTime == 52.14 || phoneTime == 52.24 || phoneTime == 52.34) {
        subtitles.alpha = 0;
    }        
    if (phoneTime == 52.6 || phoneTime == 52.7 || phoneTime == 52.5) {
        subtitles.alpha = 1;
        updateText("NATE:\nWelcome to Dudemans Emporium!");
    }
    if (phoneTime == 54.5 || phoneTime == 54.4 || phoneTime == 54.6) {
        updateText("NATE:\nA magical, fun place for Dudeman and his pals to. Chill. And, do Dudeman things. Heh.");
    }
    if (phoneTime == 61.14 || phoneTime == 61.24 || phoneTime == 61.04) {
        updateText("NATE:\nOkay I'm gonna keep it a buck with you man.");
    }
}

function loadNight() {
    FlxG.sound.pause();
    FlxG.switchState(new ModState('GAMES/FNAF/nightShift'));
}