import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.text.FlxText;

var mails = new FlxCamera(100, 100, 285, 10000);
var mail = new FlxCamera(450, 100, 770, 20000);
var cursorCam = new FlxCamera(0, 0, 1280, 720);
var awesomeCam = new FlxCamera(0, 0, 1280, 720);

var theme = FlxG.save.data.mailTheme;
var mainTextColor = 0xFF000000;
var secondaryTextColor = 0xFF3F3F3F;
var otherTextColor = 0xFF5E5E5E;
var mailsBack = 0xFFD2D2D2;
var mailBack = 0xFFEEEEEE;
var topBar1 = 0xFFD2D2D2;
var topBar2 = 0xFF747474;
var slot = 'dudeMail/ui/emailSlot';
var slotSelected = 'dudeMail/ui/emailSlot';
var selectedMail = 1;
var burgerToBe = null;
var themeScroll = 0;

// i give up lol
// btw some of this code is gonna look bleh or like "that is NOT the right code"
// thats just the result of me giving up before i went back and fixed/finsihed it
// - Twix

var mailSlots:Array<Dynamic> = [
    // Sender Name, Subject, Icon, Locked?
    ['Sender', 'example dudemail', 'dudeman', false]
];

var mailText:Array<Dynamic> = [
    // Reciever's email, Sender's email, Text
    ['reciever', 'sender', 'this is an example']
];

function create() {

    FlxG.sound.playMusic(Paths.music('dudemailTunes'), 1, true);

    FlxG.cameras.add(awesomeCam, false);

    coolBackdrop = new FlxBackdrop().loadGraphic(Paths.image('dudeMail/checkerboardbgLIGHT'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 50;
	coolBackdrop.velocity.y = 50;
	coolBackdrop.active = true;
    coolBackdrop.cameras = [awesomeCam];
	add(coolBackdrop);

    switch (theme)
    {
        case "light":
            mainTextColor = 0xFF000000;
            secondaryTextColor = 0xFF3F3F3F;
            otherTextColor = 0xFF5E5E5E;
            coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgLIGHT'));
            slot = slot+'LIGHT';
            slotSelected = slotSelected+'LIGHTselected';
            mailsBack = 0xFFD2D2D2;
            mailBack = 0xFFEEEEEE;
            topBar1 = 0xFFD2D2D2;
            topBar2 = 0xFF747474;
            themeScroll = 0;

        case "dark":
            mainTextColor = 0xFFFFFFFF;
            secondaryTextColor = 0xFFC5C5C5;
            otherTextColor = 0xFF999999;
            coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgDARK'));
            slot = slot+'DARK';
            slotSelected = slotSelected+'DARKselected';
            mailsBack = 0xFF444444;
            mailBack = 0xFF222222;
            topBar1 = 0xFFFFFFFF;
            topBar2 = 0xFF000000;
            themeScroll = 1;

        case "pink":
            mainTextColor = 0xFF4D0014;
            secondaryTextColor = 0xFF66001B;
            otherTextColor = 0xFF940027;
            coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgPINK'));
            slot = slot+'PINK';
            slotSelected = slotSelected+'PINKselected';        
            mailsBack = 0xFFFFB7D1;
            mailBack = 0xFFFFC3DF;
            topBar1 = 0xFFFFB7D1;
            topBar2 = 0xFFFE0059;
            themeScroll = 2;

        case "damie":
            mainTextColor = 0xFF331B00;
            secondaryTextColor = 0xFF723E00;
            otherTextColor = 0xFFB66300;
            coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgDAMIE'));
            slot = slot+'DAMIE';
            slotSelected = slotSelected+'DAMIEselected';        
            mailsBack = 0xFFF9E982;
            mailBack = 0xFFFEB55E;
            topBar1 = 0xFFFAEA82;
            topBar2 = 0xFFFEB55E;
            themeScroll = 3;

        default:
            mainTextColor = 0xFFFFFFFF;
            secondaryTextColor = 0xFFC5C5C5;
            otherTextColor = 0xFF999999;
            coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgDARK'));
            slot = slot+'DARK';
            slotSelected = slotSelected+'DARKselected';
            mailsBack = 0xFF444444;
            mailBack = 0xFF222222;
            topBar1 = 0xFFFFFFFF;
            topBar2 = 0xFF000000;
            themeScroll = 0;
    }

    logoPt1 = new FlxText(1015, 15, 400, 'dudemail', 0);
    logoPt1.setFormat(Paths.font("COMIC.TTF"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    logoPt1.color = topBar1;
    logoPt1.borderColor = topBar2;
    logoPt1.antialiasing = false;
    logoPt1.borderSize = 4;
    logoPt1.cameras = [awesomeCam];
    add(logoPt1);

    logoPt2 = new FlxText(915, 40, 400, 'ur using', 0);
    logoPt2.setFormat(Paths.font("COMIC.TTF"), 25, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    logoPt2.color = topBar1;
    logoPt2.borderColor = topBar2;
    logoPt2.antialiasing = false;
    logoPt2.borderSize = 4;
    logoPt2.cameras = [awesomeCam];
    add(logoPt2);

	mailsPos = new FlxSprite(100, 100).makeGraphic(245, 620, mailsBack);
    mailsPos.cameras = [awesomeCam];
	add(mailsPos);

	mailScreenPos = new FlxSprite(450, 100).makeGraphic(770, 20000, mailBack);
    mailScreenPos.cameras = [awesomeCam];
	add(mailScreenPos);

    themesTitle = new FlxText(110, 15);
    themesTitle.text = 'Theme:\n\nPRESS ENTER TO CHANGE';
    themesTitle.setFormat(Paths.font("COMIC.TTF"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    themesTitle.color = topBar1;
    themesTitle.borderColor = topBar2;
    themesTitle.antialiasing = false;
    themesTitle.borderSize = 2;
    themesTitle.cameras = [awesomeCam];
    add(themesTitle);

    themesTxt = new FlxText(195, 42);
    themesTxt.text = '< LIGHT >';
    themesTxt.setFormat(Paths.font("COMIC.TTF"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    themesTxt.color = topBar1;
    themesTxt.borderColor = topBar2;
    themesTxt.antialiasing = false;
    themesTxt.borderSize = 2;
    themesTxt.cameras = [awesomeCam];
    add(themesTxt);

    mails.bgColor = 0x00000000;
    FlxG.cameras.add(mails, false);

    mail.bgColor = mailBack;
    FlxG.cameras.add(mail, false);



    makeMailScreen();

    cursorCam.bgColor = 0x00000000;
    FlxG.cameras.add(cursorCam, false);
    
    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

}

    // i know the shit here is kinda fucked
    // i was just tryna figure out how the fuck i was gonna execute this from here (coding is hard)
    // i think you can see where i was going with this tho
    // - Twix

function makeMail(number, posY, iconName, senderName, subjectName, icon, sender, subject) {

    for (i in mailSlots)
    {
        mailSlot = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
    
        iconName = new FlxSprite(200, 0).loadGraphic(Paths.image('dudeMail/icons/'+icon));
        iconName.antialiasing = false;
        iconName.cameras = [mails];
        add(iconName);
    
        senderName = new FlxText(10, 0, 200, sender, 0);
        senderName.setFormat(Paths.font("Bahnschrift.TTF"), 30, FlxColor.WHITE, "left");
        senderName.color = mainTextColor;
        senderName.antialiasing = false;
        senderName.cameras = [mails];
        add(senderName);
    
        subjectName = new FlxText(10, 27, 200, subject, 0);
        subjectName.setFormat(Paths.font("Bahnschrift.TTF"), 25, FlxColor.WHITE, "left");
        subjectName.color = secondaryTextColor;
        subjectName.antialiasing = false;
        subjectName.cameras = [mails];
        add(subjectName);

        for (mailShit in [slot, iconName, senderName, subjectName]) {
            mailShit.y += posY;       
            mailShit.x -= 1;
        }
    }

}

function makeMailScreen() {

    mailInfo = new FlxText(50, 50, 670, "placeholder", 0);

    mailText = new FlxText(50, 50, 670, "placeholder", 0);

}

function unlockCheck(mailNum:Int) {
    if (FlxG.save.data.dudemailsUnlocked >= mailNum) {
        mailSlots[mailNum][2] == false;
    }

    if (FlxG.save.data.dudemailsUnlocked <= mailNum) {
        mailSlots[mailNum][2] != true;
    }
}

function update() {

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

    if (FlxG.mouse.overlaps(mailScreenPos)) {
        if (FlxG.mouse.wheel > 0) {
            mail.scroll.y -= 20;
        }
        if (FlxG.mouse.wheel < 0) {
            mail.scroll.y += 20;
        }
    }
    if (FlxG.mouse.overlaps(mailsPos)) {
        if (FlxG.mouse.wheel > 0) {
            mails.scroll.y -= 20;
            camera.scroll.y -= 20;
        }
        if (FlxG.mouse.wheel < 0) {
            mails.scroll.y += 20;
            camera.scroll.y += 20;
        }
    }
    if (mails.scroll.y < 0) {
        mails.scroll.y = 0;
    }
    if (mail.scroll.y < 0) {
        mail.scroll.y = 0;
    }

    switch (themeScroll)
    {
        case 0:
            themesTxt.x = 195;
            themesTxt.text = '< LIGHT >';
            FlxG.save.data.mailTheme = "light";

        case 1:
            themesTxt.x = 200;
            themesTxt.text = '< DARK >';
            FlxG.save.data.mailTheme = "dark";
        
        case 2:
            themesTxt.x = 146;
            themesTxt.text = '< COTTON CANDY >';
            FlxG.save.data.mailTheme = "pink";
        
        case 3:
            themesTxt.x = 170;
            themesTxt.text = '< DAMIE_AN >';
            FlxG.save.data.mailTheme = "damie";
     
        default:
            themesTxt.x = 212;
            themesTxt.text = '< ??? >';
    }

    if (controls.ACCEPT) {
        FlxG.resetState();
    }
    if (controls.LEFT_P) {
        themeScroll -= 1;
    }
    if (controls.RIGHT_P) {
        themeScroll += 1;
    }
    if (themeScroll < 0) {
        themeScroll = 3;
    }
    if (themeScroll > 3) {
        themeScroll = 0;
    }



    if (FlxG.keys.justPressed.U) {
        FlxG.save.data.dudemailsUnlocked = 100;
    }
    if (FlxG.keys.justPressed.PAGEUP) {
        selectedMail = 1;
    }
    if (FlxG.keys.justPressed.PAGEDOWN) {
        dudemailsUnlocked = 1;
    }
    if (controls.BACK) {
        FlxG.switchState(new ModState("FreeplaySelector"));
    }

    /*if (FlxG.save.data.dudemailsUnlocked >= 1) {
        slotToBe.updateHitbox();
        slotToBe.offset.set(100, 100);
        if (FlxG.mouse.overlaps(mailSlot1) && FlxG.mouse.justPressed) {
            selectedMail = 1;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        if (FlxG.mouse.overlaps(mailSlot2) && FlxG.mouse.justPressed) {
            selectedMail = 2;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        if (FlxG.mouse.overlaps(mailSlot3) && FlxG.mouse.justPressed) {
            selectedMail = 3;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 4) {
        if (FlxG.mouse.overlaps(mailSlot4) && FlxG.mouse.justPressed) {
            selectedMail = 4;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
        }
    }

    if (selectedMail == 1) {
        mailInfo.alpha = 1;
        mailText.alpha = 1;
        mailSlot1.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo1.alpha = 0;
        mailText1.alpha = 0;
        mailSlot1.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 2) {
        mailInfo2.alpha = 1;
        mailText2.alpha = 1;
        mailSlot2.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo2.alpha = 0;
        mailText2.alpha = 0;
        mailSlot2.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 3) {
        mailInfo3.alpha = 1;
        mailText3.alpha = 1;
        mailSlot3.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo3.alpha = 0;
        mailText3.alpha = 0;
        mailSlot3.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 4) {
        mailInfo4.alpha = 1;
        mailText4.alpha = 1;
        mailSlot4.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo4.alpha = 0;
        mailText4.alpha = 0;
        mailSlot4.loadGraphic(Paths.image(slot));
    }*/
}