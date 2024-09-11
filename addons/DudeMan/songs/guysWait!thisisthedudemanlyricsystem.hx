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
    lyricItself.scale.x = 1.26;
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
    
    if (FlxG.save.data.subtitles == true) {
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

        // ░░▄▀ ░░█
        // ▄▀░░ █▄█

        
        if (PlayState.SONG.meta.name == "slashjay") {
            switch(curStep) {

                case 272:
                    textState("popUpINSTANT");
                    setTextShit("Spit on that thang!", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 278:
                    textState("goDownINSTANT");

                case 551:
                    textState("popUpFast");
                    setTextShit("HOLD ON, WAIT", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 560:
                    setTextShit("I have to connect with the youth,.,.,", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 569:
                    setTextShit("that are...", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 574:
                    setTextShit("playing this mod", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 585:
                    setTextShit("*AHEM*", "dudeman", 0xFFFFFFFF, 0xFF484848, true);

                case 594:
                    textState("goDownINSTANT");

                case 604:
                    textState("popUpINSTANT");
                    setTextShit("skib", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 605:
                    setTextShit("skibi", "dudeman", 0xFFFFFFFF, 0xFF484848, false);

                case 606:
                    setTextShit("skibidi", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 607:
                    setTextShit("gyatt", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 609:
                    setTextShit("o", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 610:
                    setTextShit("ohi", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 611:
                    setTextShit("ohio", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 612:
                    setTextShit("rizz", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 614:
                    setTextShit("duke", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 616:
                    setTextShit("duke den", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 617:
                    setTextShit("duke dennis", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 618:
                    setTextShit("did", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 619:
                    setTextShit("did you", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 620:
                    setTextShit("did you pray", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 621:
                    setTextShit("did you pray to", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 622:
                    setTextShit("did you pray today?", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 624:
                    setTextShit("liv", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 625:
                    setTextShit("livvy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 626:
                    setTextShit("livvy dunne", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 628:
                    setTextShit("livvy dunne rizz", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 629:
                    setTextShit("livvy dunne rizzing", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 630:
                    setTextShit("livvy dunne rizzing up", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 632:
                    setTextShit("livvy dunne rizzing up ba", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 633:
                    setTextShit("livvy dunne rizzing up baby", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 634:
                    setTextShit("livvy dunne rizzing up baby gronk", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 636:
                    setTextShit("sus", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 637:
                    setTextShit("sussy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 638:
                    setTextShit("sussy imp", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 639:
                    setTextShit("sussy impost", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 641:
                    setTextShit("sussy imposter", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 642:
                    setTextShit("pi", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 643:
                    setTextShit("pibby", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 644:
                    setTextShit("pibby glitch", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 646:
                    setTextShit("in", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 647:
                    setTextShit("in real", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 648:
                    setTextShit("in reallife", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 652:
                    setTextShit("sig", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 653:
                    setTextShit("sigma", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 654:
                    setTextShit("sigma al", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 655:
                    setTextShit("sigma alpha", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 656:
                    setTextShit("sigma alpha o", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 657:
                    setTextShit("sigma alpha ome", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 658:
                    setTextShit("sigma alpha omega", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 660:
                    setTextShit("sigma alpha omega male", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 664:
                    setTextShit("sigma alpha omega male grind", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 666:
                    setTextShit("sigma alpha omega male grindset", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 668:
                    setTextShit("an", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 669:
                    setTextShit("andrew", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 672:
                    setTextShit("andrew tate", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 676:
                    setTextShit("goon", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 678:
                    setTextShit("goon cave!", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 680:
                    setTextShit("fre", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 681:
                    setTextShit("freddy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 682:
                    setTextShit("freddy faz", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 684:
                    setTextShit("freddy fazbear", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 686:
                    setTextShit("coll", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 687:
                    setTextShit("colleen", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 689:
                    setTextShit("colleen ba", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 690:
                    setTextShit("colleen balling", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 691:
                    setTextShit("colleen ballinger", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 692:
                    setTextShit("smurf", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 694:
                    setTextShit("smurf cat", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 696:
                    setTextShit("smurf cat v", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 697:
                    setTextShit("smurf cat vs", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 698:
                    setTextShit("smurf cat vs straw", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 699:
                    setTextShit("smurf cat vs strawberry", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 700:
                    setTextShit("smurf cat vs strawberry el", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 701:
                    setTextShit("smurf cat vs strawberry ele", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 702:
                    setTextShit("smurf cat vs strawberry elephant", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 704:
                    setTextShit("blud", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 706:
                    setTextShit("blud thought!", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 708:
                    setTextShit("shlong.", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 710:
                    setTextShit("i", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 711:
                    setTextShit("ishow", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 712:
                    setTextShit("ishowspeed", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 715:
                    setTextShit("a", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 716:
                    setTextShit("a whole", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 718:
                    setTextShit("a whole bunch", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 719:
                    setTextShit("a whole bunch of", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 720:
                    setTextShit("a whole bunch of tur", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 721:
                    setTextShit("a whole bunch of turbu", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 722:
                    setTextShit("a whole bunch of turbulance", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 724:
                    setTextShit("IM", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 726:
                    setTextShit("IM BOUT", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 727:
                    setTextShit("IM BOUTA", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 728:
                    setTextShit("IM BOUTA CUM", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 730:
                    setTextShit("bro", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 732:
                    setTextShit("bro real", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 733:
                    setTextShit("bro really", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 734:
                    setTextShit("bro really think", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 735:
                    setTextShit("bro really think he", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 736:
                    setTextShit("bro really think he car", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 738:
                    setTextShit("bro really think he carti", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 739:
                    setTextShit("li", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 740:
                    setTextShit("liter", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 741:
                    setTextShit("literally", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 742:
                    setTextShit("literally hit", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 743:
                    setTextShit("literally hitting", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 744:
                    setTextShit("literally hitting the", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 745:
                    setTextShit("literally hitting the griddy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 747:
                    setTextShit("the", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 748:
                    setTextShit("the oc", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 750:
                    setTextShit("the ocky", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 752:
                    setTextShit("the ocky way", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 756:
                    setTextShit("kai", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 758:
                    setTextShit("kai cen", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 759:
                    setTextShit("kai cenat", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 761:
                    setTextShit("fa", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 762:
                    setTextShit("fanum", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 763:
                    setTextShit("fanum tax", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 764:
                    setTextShit("gar", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 765:
                    setTextShit("garten", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 766:
                    setTextShit("garten of", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 768:
                    setTextShit("garten of ban", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 770:
                    setTextShit("garten of banban", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 772:
                    setTextShit("no", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 774:
                    setTextShit("no edge", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 775:
                    setTextShit("no edging", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 776:
                    setTextShit("no edging in", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 778:
                    setTextShit("no edging in class", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 780:
                    setTextShit("not", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 781:
                    setTextShit("not the", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 782:
                    setTextShit("not the mos", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 783:
                    setTextShit("not the mosqu", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 784:
                    setTextShit("not the mosqutio a", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 786:
                    setTextShit("not the mosqutio again", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 788:
                    setTextShit("*buzz*", "dudeman", 0xFFFFFFFF, 0xFF484848, true);
                case 789:
                    setTextShit("*buzzing*", "dudeman", 0xFFFFFFFF, 0xFF484848, true);
                case 790:
                    setTextShit("ax", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 791:
                    setTextShit("axel", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 792:
                    setTextShit("axel in", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 793:
                    setTextShit("axel in har", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 794:
                    setTextShit("axel in harl", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 795:
                    setTextShit("axel in harlem", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 796:
                    setTextShit("who", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 797:
                    setTextShit("whopper", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 798:
                    setTextShit("who", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 799:
                    setTextShit("whopper", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 800:
                    setTextShit("who", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 801:
                    setTextShit("whopper", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 802:
                    setTextShit("who", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 803:
                    setTextShit("whopper", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 804:
                    setTextShit("one", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 806:
                    setTextShit("one two", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 808:
                    setTextShit("one two buckle", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 809:
                    setTextShit("one two buckle my", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 810:
                    setTextShit("one two buckle my shoe", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 812:
                    setTextShit("goo", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 813:
                    setTextShit("goofy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 814:
                    setTextShit("goofy ahh", "dudeman", 0xFFFFFFFF, 0xFF484848, false);   
                case 816:
                    setTextShit("pib", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 817:
                    setTextShit("pibby", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 818:
                    setTextShit("ai", "dudeman", 0xFFFFFFFF, 0xFF484848, false);   
                case 819:
                    setTextShit("aiden", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 820:
                    setTextShit("aiden ross", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 822:
                    setTextShit("sin", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 824:
                    setTextShit("sin cit", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 825:
                    setTextShit("sin city", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 826:
                    setTextShit("sin cit", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 827:
                    setTextShit("sin city", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 828:
                    setTextShit("mon", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 829:
                    setTextShit("monday", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 830:
                    setTextShit("monday lef", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 831:
                    setTextShit("monday left me", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 832:
                    setTextShit("monday left me bro", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 834:
                    setTextShit("monday left me broken", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 836:
                    setTextShit("quirked", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 838:
                    setTextShit("quirked up", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 840:
                    setTextShit("quirked up white", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 842:
                    setTextShit("quirked up white boy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 844:
                    setTextShit("bust", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 845:
                    setTextShit("busting", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 846:
                    setTextShit("busting it", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 847:
                    setTextShit("busting it down", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 848:
                    setTextShit("busting it down s", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 849:
                    setTextShit("busting it down se", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 850:
                    setTextShit("busting it down sex", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 851:
                    setTextShit("busting it down sexu", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 852:
                    setTextShit("busting it down sexual", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 853:
                    setTextShit("busting it down sexual style", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 854:
                    setTextShit("goa", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 855:
                    setTextShit("goated", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 856:
                    setTextShit("goated with", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 857:
                    setTextShit("goated with the", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 858:
                    setTextShit("goated with the SAUCE.", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 860:
                    setTextShit("john", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 862:
                    setTextShit("john pork", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 864:
                    setTextShit("grim", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 865:
                    setTextShit("grimace", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 866:
                    setTextShit("grimace shake", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 868:
                    setTextShit("ki", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 869:
                    setTextShit("kiki", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 870:
                    setTextShit("do", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 871:
                    setTextShit("do you", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 872:
                    setTextShit("do you love", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 874:
                    setTextShit("do you love me?", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 876:
                    setTextShit("hug", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 877:
                    setTextShit("huggy", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 878:
                    setTextShit("huggy wuggy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 879:
                    setTextShit("na", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 880:
                    setTextShit("nathan", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 881:
                    setTextShit("nathaniel", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 882:
                    setTextShit("nathaniel B", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 884:
                    setTextShit("light", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 886:
                    setTextShit("light-skin", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 888:
                    setTextShit("light-skin stare.", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 892:
                    setTextShit("big", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 893:
                    setTextShit("biggest", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 894:
                    setTextShit("biggest bird", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 896:
                    setTextShit("big", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 897:
                    setTextShit("biggest", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 898:
                    setTextShit("biggest bird", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 900:
                    setTextShit("o", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 902:
                    setTextShit("omar", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 903:
                    setTextShit("omar the", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 904:
                    setTextShit("omar the re", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 905:
                    setTextShit("omar the refer", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 906:
                    setTextShit("omar the referee", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 907:
                    setTextShit("a", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 908:
                    setTextShit("amo", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 910:
                    setTextShit("amogus", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 912:
                    setTextShit("un", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 914:
                    setTextShit("uncan", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 915:
                    setTextShit("uncanny", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 916:
                    setTextShit("whole", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 917:
                    setTextShit("wholesome", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 918:
                    setTextShit("wholesome red", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 919:
                    setTextShit("wholesome reddit", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 920:
                    setTextShit("wholesome reddit chung", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 922:
                    setTextShit("wholesome reddit chungus", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 924:
                    setTextShit("ke", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 926:
                    setTextShit("keanu", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 927:
                    setTextShit("keanu", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 928:
                    setTextShit("keanu reeves", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 930:
                    setTextShit("pi", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 931:
                    setTextShit("pizza", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 932:
                    setTextShit("pizzato", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 933:
                    setTextShit("pizzatower", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 934:
                    setTextShit("zes", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 935:
                    setTextShit("zesty", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 936:
                    setTextShit("zesty pog", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 938:
                    setTextShit("zesty poggers", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 940:
                    setTextShit("kum", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 941:
                    setTextShit("kuma", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 942:
                    setTextShit("kumala", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 943:
                    setTextShit("kumalala", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 945:
                    setTextShit("sav", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 946:
                    setTextShit("saves", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 947:
                    setTextShit("savesta", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 948:
                    setTextShit("quan", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 950:
                    setTextShit("quandale", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 952:
                    setTextShit("quandale ding", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 954:
                    setTextShit("quandale dingle", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 956:
                    setTextShit("gli", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 957:
                    setTextShit("glizzy", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 958:
                    setTextShit("glizzy wizzy", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 960:
                    setTextShit("rose", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 962:
                    setTextShit("rose toy", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 964:
                    setTextShit("an", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 965:
                    setTextShit("ankha", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 966:
                    setTextShit("ankha zone", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 968:
                    setTextShit("thug", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 970:
                    setTextShit("thug shake", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 971:
                    setTextShit("thug shaker", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 972:
                    setTextShit("mor", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 973:
                    setTextShit("morbin'", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 974:
                    setTextShit("morbin' time", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 976:
                    setTextShit("D", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 977:
                    setTextShit("DJ", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 978:
                    setTextShit("DJ Kha'", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 979:
                    setTextShit("DJ Khaled", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 980:
                    setTextShit("sha", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 981:
                    setTextShit("shadow", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 982:
                    setTextShit("shadow wiz", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 983:
                    setTextShit("shadow wizard", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 984:
                    setTextShit("shadow wizard mon", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 985:
                    setTextShit("shadow wizard money", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 986:
                    setTextShit("shadow wizard money gang", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 989:
                    textState("goDownINSTANT");


                case 992:
                    textState("popUpINSTANT");
                    setTextShit("I think i just gave myself", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 1000:
                    setTextShit("a psuedo lobotomy.", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 1013:
                    textState("goDownSlow");
                      
                case 1312:
                    textState("popUpINSTANT");
                    setTextShit("Lets go!", "dudeman", 0xFFFFFFFF, 0xFF484848, false);  
                case 1320:
                    textState("goDownINSTANT");

                case 1370:
                    textState("popUpFast");
                    setTextShit("SHUT", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 1376:
                    setTextShit("SHUT UP", "dudeman", 0xFFFFFFFF, 0xFF484848, false); 
                case 1380:
                    setTextShit("SHUT UP, BITCH!", "dudeman", 0xFFFFFFFF, 0xFF484848, false);
                case 1384:
                    textState("goDownFast");

                case 1487:
                    textState("popUpFast");
                    setTextShit("dude.", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1494:
                    setTextShit("fuck this", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1500:
                    setTextShit("im", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1502:
                    setTextShit("im going", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1505:
                    setTextShit("im going to", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1507:
                    setTextShit("im going to bed", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1510:
                    setTextShit("je", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                    FlxTween.tween(lyricItself, {y: yValueDpearText - 800, angle: 40}, 5);
                    FlxTween.tween(lyricItself, {alpha: 0}, 6);
                    FlxTween.tween(icon, {y: yValueDpear - 800, angle: 4, alpha: 0}, 5); 
                case 1512:
                    setTextShit("jesus", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1516:
                    setTextShit("jesus christ", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1521:
                    setTextShit("jesus christ i", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1524:
                    setTextShit("jesus christ i need some", "BF", 0xFFFF2D32, 0xFFFAE237, false); 
                case 1529:
                    setTextShit("sleep.", "shesnotthere", 0xFFFF2D32, 0xFFFAE237, false); 
        
            }
        }

    }

}