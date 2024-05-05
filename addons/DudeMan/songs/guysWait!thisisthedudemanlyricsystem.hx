import flixel.util.FlxTimer;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

var yValue = 435;

function postCreate() {

    lyricItself = new FlxText(0, 1530);
    lyricItself.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    lyricItself.cameras = [camHUD];
    lyricItself.antialiasing = false;
    lyricItself.borderSize = 3;
    insert(100, lyricItself);

    icon = new FlxSprite(0, 1435).loadGraphic(Paths.image('LYRICS/face'));
    icon.antialiasing = false;
    icon.cameras = [camHUD];
    insert(100, icon);

    if (FlxG.save.data.subtitles == false) {
        lyricItself.alpha = 0;
        icon.alpha = 0;
    }

    if (downscroll) {
        yValue = 415;
    }

}

function setTextShit(setText, setSingIcon, setBaseColor, setAddColor, isItaltic) {

    lyricItself.text = setText;
    icon.loadGraphic(Paths.image('LYRICS/'+setSingIcon));
    lyricItself.color = setBaseColor;
    lyricItself.borderColor = setAddColor;
    lyricItself.italic = isItaltic;
    lyricItself.screenCenter(FlxAxes.X);
    icon.screenCenter(FlxAxes.X);
    lyricItself.scale.x = 1.1;
    icon.scale.set(0.9, 0.9);
    FlxTween.tween(lyricItself.scale, {x: 1}, 0.3, {ease:FlxEase.quartOut});
    FlxTween.tween(icon.scale, {x: 1, y: 1}, 0.3, {ease:FlxEase.quartOut});

}

function textState(type) {

    switch(type) {
        
        case "popUpINSTANT":
            FlxTween.tween(lyricItself, {y: 530}, 0.01, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: yValue}, 0.01, {ease:FlxEase.quartIn});          
        case "goDownINSTANT":
            FlxTween.tween(lyricItself, {y: 1530}, 0.01, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: 1435}, 0.01, {ease:FlxEase.quartOut});
        case "popUpFast":
            FlxTween.tween(lyricItself, {y: 530}, 1, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 1, {ease:FlxEase.quartOut});   
        case "popUpRlyFast":
            FlxTween.tween(lyricItself, {y: 530}, 0.3, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 0.3, {ease:FlxEase.quartOut});  
        case "popUpSlow":
            FlxTween.tween(lyricItself, {y: 530}, 3, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 3, {ease:FlxEase.quartOut});         
        case "goDownFast":
            FlxTween.tween(lyricItself, {y: 1530}, 1, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: 1435}, 1, {ease:FlxEase.quartIn});
        case "goDownRlyFast":
            FlxTween.tween(lyricItself, {y: 1530}, 0.3, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: 1435}, 0.3, {ease:FlxEase.quartIn});
        case "goDownSlow":
            FlxTween.tween(lyricItself, {y: 1530}, 3, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: 1435}, 3, {ease:FlxEase.quartIn});

    }
}

function stepHit(curStep:Int) {
    /// https://fsymbols.com/generators/tarty/


    /// █▀▄ █░█ █▀▄ █▀▀ 
    /// █▄▀ █▄█ █▄▀ ██▄ 

    if (PlayState.SONG.meta.name == "dude") {
        switch(curStep) {
                case 520:
                    textState("popUpFast");
                    setTextShit("FIRE IN THE HOLE", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 528:
                    textState("goDownINSTANT");
                case 530:
                    textState("popUpINSTANT");
                    setTextShit("White people be like-", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 535:
                    setTextShit("FIRE IN THE HOLE", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 551:
                    setTextShit("JDSHSDJHDSJHDSJ", "dudeman", 0xFFFFFFFF, 0xFF484848, false);                    
                case 554:        
                    setTextShit("Black people be like-", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 560:
                    textState("goDownSlow"); 
                case 620:
                    textState("popUpRlyFast");
                    setTextShit(":O", "bf", 0xFFFF2D32, 0xFFFAE237, false);
                case 624:
                    textState("goDownRlyFast");
        }
    }


    /// █▀█ █░█ █▀▀ █▀█ █▀ ▀█▀ █ █▀▄▀█ █░█ █░░ ▄▀█ ▀█▀ █ █▀█ █▄░█
    /// █▄█ ▀▄▀ ██▄ █▀▄ ▄█ ░█░ █ █░▀░█ █▄█ █▄▄ █▀█ ░█░ █ █▄█ █░▀█

    if (PlayState.SONG.meta.name == "overstimulation") {
        switch(curStep) {
            case 144:
                textState("popUpRlyFast");
                setTextShit("Number 15.", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
            case 156:
                setTextShit("Wah :c", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
            case 160:
                textState("goDownRlyFast");
            case 248:
                textState("popUpRlyFast");
                setTextShit("Severe and Continuous.", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
            case 256:
                textState("goDownRlyFast");
            case 288:
                textState("popUpRlyFast");
                setTextShit("*screaming*", "none", 0xFFFFFFFF, 0xFF000000, true);
            case 300:
                textState("goDownINSTANT");
            case 303:
                textState("popUpINSTANT");
            case 305:
                textState("goDownINSTANT");
//            case 421:
//                FlxTween.tween(lyricItself, {y: 630}, 0.3, {ease:FlxEase.quartOut});
//                setTextShit("it was a nightmare.", "none", 0xFFFFFFFF, 0xFF000000, false);
//            case 437:
//                setTextShit("im", "none", 0xFFFFFFFF, 0xFF000000, true);
//            case 440:
//                setTextShit("EVIL", "none", 0xFFFF0000, 0xFF000000, true);                
//            case 447:
//                textState("goDownINSTANT");
        }
    }
}