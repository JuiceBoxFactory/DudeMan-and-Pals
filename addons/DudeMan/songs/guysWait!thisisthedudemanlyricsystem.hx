import flixel.util.FlxTimer;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

var yValue = 435;
var yValueDpear = 1435;
var yValueText = 530;
var yValueDpearText = 1530;

function postCreate() {

    if (downscroll) {
        yValue = 160;
        yValueDpear = -160;
        yValueText = 175;
        yValueDpearText = -175;
    }

    lyricItself = new FlxText(0, yValueDpearText);
    lyricItself.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    lyricItself.cameras = [camHUD];
    lyricItself.antialiasing = false;
    lyricItself.borderSize = 3;
    insert(100, lyricItself);

    icon = new FlxSprite(0, yValueDpear).loadGraphic(Paths.image('icons/face'));
    icon.antialiasing = false;
    icon.cameras = [camHUD];
    insert(100, icon);

    if (FlxG.save.data.subtitles == false) {
        lyricItself.alpha = 0;
        icon.alpha = 0;
    }

}

function setTextShit(setText, setSingIcon, setBaseColor, setAddColor, isItaltic) {

    lyricItself.text = setText;
    icon.loadGraphic(Paths.image('icons/'+setSingIcon));
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
            FlxTween.tween(lyricItself, {y: yValueText}, 0.01, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: yValue}, 0.01, {ease:FlxEase.quartIn});          
        case "goDownINSTANT":
            FlxTween.tween(lyricItself, {y: yValueDpearText}, 0.01, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValueDpear}, 0.01, {ease:FlxEase.quartOut});
        case "popUpFast":
            FlxTween.tween(lyricItself, {y: yValueText}, 1, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 1, {ease:FlxEase.quartOut});   
        case "popUpRlyFast":
            FlxTween.tween(lyricItself, {y: yValueText}, 0.3, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 0.3, {ease:FlxEase.quartOut});  
        case "popUpSlow":
            FlxTween.tween(lyricItself, {y: yValueText}, 3, {ease:FlxEase.quartOut});
            FlxTween.tween(icon, {y: yValue}, 3, {ease:FlxEase.quartOut});         
        case "goDownFast":
            FlxTween.tween(lyricItself, {y: yValueDpearText}, 1, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: yValueDpear}, 1, {ease:FlxEase.quartIn});
        case "goDownRlyFast":
            FlxTween.tween(lyricItself, {y: yValueDpearText}, 0.3, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: yValueDpear}, 0.3, {ease:FlxEase.quartIn});
        case "goDownSlow":
            FlxTween.tween(lyricItself, {y: yValueDpearText}, 3, {ease:FlxEase.quartIn});
            FlxTween.tween(icon, {y: yValueDpear}, 3, {ease:FlxEase.quartIn});

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


    /// █▀ █░░ ▄▀█ █▀ █░█   █▀▀ █▀▀ █▄░█
    /// ▄█ █▄▄ █▀█ ▄█ █▀█   █▄█ ██▄ █░▀█

    if (PlayState.SONG.meta.name == "slashgen") {
        switch(curStep) {
            case 1377:
                textState("popUpRlyFast");
                setTextShit("I'm chewing on...", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
            case 1387:
                setTextShit("hubba bubba max", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
            case 1398:
                lyricItself.scale.set(0.7, 0.7);
                setTextShit("hubba bubba max..,,.,..", "none", 0xFFFFFFFF, 0xFF000000, true);
            case 1410:
                FlxTween.tween(lyricItself, {alpha: 0}, 0.8, {ease: FlxEase.quartOut});
            case 1420:
                if (FlxG.save.data.subtitles == true) {
                    lyricItself.alpha = 1;
                    lyricItself.scale.set(1, 1); 
                }    
                setTextShit("I got 4 pieces in my mouth rn.", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
            case 1440:
                setTextShit("DAAAAAAAMAMMMMMNNN.,.,,.", "bf", 0xFFFF2D32, 0xFFFAE237, false);   
            case 1464:
                textState("goDownFast");
            case 1482:
                textState("popUpSlow");
                if (FlxG.save.data.subtitles == true) {
                    lyricItself.alpha = 0;
                    FlxTween.tween(lyricItself, {alpha: 1}, 4, {ease: FlxEase.quartOut});
                }
                setTextShit("*bubble gum blowing sounds*", "none", 0xFFFFFFFF, 0xFF000000, true); 
            case 1528:
                lyricItself.scale.set(1.5, 1.5);
                setTextShit("*EXPLOSION SOUND*", "none", 0xFFFFFFFF, 0xFF000000, true);  
            case 1535:
                lyricItself.scale.set(1, 1);
                setTextShit("*SCREAMING*", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
        }
    }

    // █▀▀ █▀█ █▀▄ █▀▀   █▀█ █▀▀   █▀▄▀█ █ █▀ █▀▀ █▀█ █▄░█ █▀▄ █░█ █▀▀ ▀█▀
    // █▄▄ █▄█ █▄▀ ██▄   █▄█ █▀░   █░▀░█ █ ▄█ █▄▄ █▄█ █░▀█ █▄▀ █▄█ █▄▄ ░█░

    if (PlayState.SONG.meta.name == "misconduct") {
        switch(curStep) {
            case 288:
                textState("popUpFast");
                setTextShit("NahNahNahNah", "lute", 0xFF5CFC50, 0xFF2ADD65, false);
            case 295:
                setTextShit("Booo booooo !!", "lute", 0xFF5CFC50, 0xFF2ADD65, false);
            case 303:
                setTextShit("hey, thats mean !", "melty", 0xFFFF84A6, 0xFFFF4577, false);
            case 313:
                setTextShit("grrrrrrrrrr", "lute", 0xFF5CFC50, 0xFF2ADD65, false);
            case 320:
                textState("goDownSlow");
            case 562:
                textState("popUpRlyFast");
                setTextShit("GET OUT OF MY STUDIO !", "melty", 0xFFFF84A6, 0xFFFF4577, false);
            case 579:
                textState("goDownFast");
        }
    }

    // █▀▄ █ █▀▀
    // █▄▀ █ ██▄

    if (PlayState.SONG.meta.name == "die") {
        switch(curStep) {
            case 1544:
                textState("popUpFast");
                setTextShit("GRAAAHH IM GONNA KILL YOU!!!!", "bear5", 0xFFB2A3DD, 0xFF544A72, false);
            case 1576:
                setTextShit("nuh uh", "dudeco", 0xFFDEE5E9, 0xFFF4504A, false);
            case 1608:
                setTextShit('FUCK YOU MEAN, "NUH UH"??', "bear5", 0xFFB2A3DD, 0xFF544A72, false);
            case 1640:
                setTextShit("nuh uh", "dudeco", 0xFFDEE5E9, 0xFFF4504A, false);
            case 1672:
                lyricItself.scale.set(1.5, 1.5);
                setTextShit("*EXPLOSION*", "bear5", 0xFFB2A3DD, 0xFF544A72, false);  
                textState("goDownSlow");

        }
    }

    // █░█░█ █░█ █▀█ █▀█ █▀█ █▀▀ █▀█
    // ▀▄▀▄▀ █▀█ █▄█ █▀▀ █▀▀ ██▄ █▀▄

    if (PlayState.SONG.meta.name == "whopper") {
        switch(curStep) {
            case 864:
                textState("popUpFast");
                setTextShit("STOP.", "anty", 0xFFFF234F, 0xFF23FF6B, false);

            case 869:
                setTextShit("STOP POSTING.", "anty", 0xFFFF234F, 0xFF23FF6B, false);

            case 874:
                setTextShit("STOP POSTING ABOUT.", "anty", 0xFFFF234F, 0xFF23FF6B, false);

            case 878:
                setTextShit("pingas", "pingas", 0xFF923145, 0xFFFE7C1E, false);

            case 880:
                textState("goDownINSTANT");

        }
    }

}