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

    time();

}

function update() {

    if (phoneTime == 223) {
        loadNight();
    }


}

function time() {

    new FlxTimer().start(0.25, function(timer) {
        phoneTime += 0.25;
        time();
        subtitlesBitch();
    });
    
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
        FlxTween.tween(subtitles, {alpha: 0}, 1.5, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 10) {
        FlxTween.tween(subtitles, {alpha: 1}, 2, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 12) {
        subtitles.alpha = 0;
    }
    if (phoneTime == 13) {
        subtitles.alpha = 1;
        updateText("PUZZLE THE PRICK:\nHey Hey Hey !");
    }
    if (phoneTime == 14) {
        updateText("PUZZLE THE PRICK:\nYou've returned !");
    }
    if (phoneTime == 15.50) {
        updateText("PUZZLE THE PRICK:\nWelcome to Dudeman's Emporium.");
    }
    if (phoneTime == 17.50) {
        updateText("PUZZLE THE PRICK:\nA place where Dudeman and Pals chill !... and stuff.");
    }
    if (phoneTime == 20.25) {
        updateText("PUZZLE THE PRICK:\nLet me tell you, you made a");
    }
    if (phoneTime == 21.50) {
        subtitles.setFormat(Paths.font("Bahnschrift.ttf"), 30, FlxColor.WHITE, "center");  
        updateText("PUZZLE THE PRICK:\nBIG MISTAKE");
    }
    if (phoneTime == 22.50) {
        subtitles.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center");  
        updateText("PUZZLE THE PRICK:\nHiring for this shitshow.");
    }
    if (phoneTime == 24) {
        updateText("PUZZLE THE PRICK:\nYou're pretty much asking to be killed.");
    }
    if (phoneTime == 25.50) {
        updateText("PUZZLE THE PRICK:\nHe's gonna fuck up EVERYTHING for you !");
    }
    if (phoneTime == 28.75) {
        updateText("PUZZLE THE PRICK:\nand by that, I mean killing you.");
    }
    if (phoneTime == 30.75) {
        updateText("PUZZLE THE PRICK:\nJUST LIKE HOW HE FUCKED EVERYTHING UP FOR ME");
    }
    if (phoneTime == 32.75) {
        updateText("PUZZLE THE PRICK:\n*sigh* no matter.");
    }
    if (phoneTime == 34) {
        updateText("PUZZLE THE PRICK:\nI will let you on a call with a friend of mine");
    }
    if (phoneTime == 36.25) {
        updateText("PUZZLE THE PRICK:\nHe should help you get the gist of things");
    }
    if (phoneTime == 38.25) {
        updateText("PUZZLE THE PRICK:\nBetter than I probably could");
    }
    if (phoneTime == 40) {
        updateText("PUZZLE THE PRICK:\nBUH BYE !");
    }
    if (phoneTime == 40.75) {
        updateText("PUZZLE THE PRICK:\nagain.");
    }  
    if (phoneTime == 41.50) {
        FlxTween.tween(subtitles, {alpha: 0}, 0.5, {ease:FlxEase.quartOut});
    }
    if (phoneTime == 42) {
        subtitles.alpha = 1;
        updateText("BEEP");        
    }  
    if (phoneTime == 43) {
        updateText("?:\nhey hey hey !");
    } 
    if (phoneTime == 44.50) {
        updateText("?:\nSeems like puzzle gave me the right number !");
    } 
    if (phoneTime == 46.50) {
        subtitles.alpha = 0;
    } 
    if (phoneTime == 47.25) {
        subtitles.alpha = 1;
        updateText("NATE:\nMy Name's Nate.");
    }       
}

function loadNight() {
    FlxG.switchState(new ModState('GAMES/FNAF/nightShift'));
}