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
var slotToBe = null;
var burgerToBe = null;
var themeScroll = 0;

function create() {

    coolBackdrop = new FlxBackdrop().loadGraphic(Paths.image('dudeMail/checkerboardbgLIGHT'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 50;
	coolBackdrop.velocity.y = 50;
	coolBackdrop.active = true;
	add(coolBackdrop);

    if (theme == "light") {
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
    }
    if (theme == "dark") {
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
    }
    if (theme == "pink") {
        mainTextColor = 0xFF4D0014;
        secondaryTextColor = 0xFF66001B;
        otherTextColor = 0xFF940027;
        coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgPINK'));
        slot = slot+'PINK';
        slotSelected = slotSelected+'PINKselected';        
        mailsBack = 0xFFFFB7D1;
        mailBack = 0xFFFFC3DF;
        topBar1 = 0xFFF2AEC6;
        topBar2 = 0xFFFE0059;
        themeScroll = 2;
    }
    if (theme == "damie") {
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
    }

    logoPt1 = new FlxText(1015, 15, 400, 'dudemail', 0);
    logoPt1.setFormat(Paths.font("COMIC.TTF"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    logoPt1.color = topBar1;
    logoPt1.borderColor = topBar2;
    logoPt1.antialiasing = false;
    logoPt1.borderSize = 4;
    add(logoPt1);

    logoPt2 = new FlxText(915, 40, 400, 'ur using', 0);
    logoPt2.setFormat(Paths.font("COMIC.TTF"), 25, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    logoPt2.color = topBar1;
    logoPt2.borderColor = topBar2;
    logoPt2.antialiasing = false;
    logoPt2.borderSize = 4;
    add(logoPt2);

	mailsPos = new FlxSprite(100, 100).makeGraphic(285, 620, mailsBack);
	add(mailsPos);

	mailScreenPos = new FlxSprite(450, 100).makeGraphic(770, 20000, mailBack);
	add(mailScreenPos);

    themesTitle = new FlxText(110, 15);
    themesTitle.text = 'Theme:\n\nPRESS ENTER TO CHANGE';
    themesTitle.setFormat(Paths.font("COMIC.TTF"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    themesTitle.color = topBar1;
    themesTitle.borderColor = topBar2;
    themesTitle.antialiasing = false;
    themesTitle.borderSize = 2;
    add(themesTitle);

    themesTxt = new FlxText(195, 42);
    themesTxt.text = '< LIGHT >';
    themesTxt.setFormat(Paths.font("COMIC.TTF"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    themesTxt.color = topBar1;
    themesTxt.borderColor = topBar2;
    themesTxt.antialiasing = false;
    themesTxt.borderSize = 2;
    add(themesTxt);

    mails.bgColor = 0x00000000;
    FlxG.cameras.add(mails, false);

    mail.bgColor = mailBack;
    FlxG.cameras.add(mail, false);


    if (FlxG.save.data.dudemailsUnlocked >= 1) {
        makeMail("1", 0, "icon1", "sender1", "subject1", "dudeman", "DudeMan", "READ MY DUDEMAIL. NOW.");
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        makeMail("2", 111, "icon2", "sender2", "subject2", "fruity", "FRUITY", "HIIHIHIHIHIIHIHH");
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        makeMail("3", 222, "icon3", "sender3", "subject3", "puzzle", "Puzzle", "My Game.");
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        makeMail("4", 333, "icon4", "sender4", "subject4", "damie", "damie_an", "IT IS NOT ME");
    }

    makeMailScreen();

    cursorCam.bgColor = 0x00000000;
    FlxG.cameras.add(cursorCam, false);
    
    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

}

function makeMail(number, posY, iconName, senderName, subjectName, icon, sender, subject) {

    if (number == "1") {
        mailSlot1 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot1;
    }
    if (number == "2") {
        mailSlot2 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot2;
    }
    if (number == "3") {
        mailSlot3 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot3;
    }
    if (number == "4") {
        mailSlot4 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot4;
    }

    slotToBe.antialiasing = false;
    slotToBe.cameras = [mails];
    slotToBe.updateHitbox();
    slotToBe.offset.set(100, 100);
    add(slotToBe);

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

    for (mailShit in [slotToBe, iconName, senderName, subjectName]) {
        mailShit.y += posY;       
        mailShit.x -= 1;
    }

}

function makeMailScreen() {

    mailInfo1 = new FlxText(50, 50, 670, "placeholder", 0);
    mailInfo2 = new FlxText(50, 50, 670, "placeholder", 0);
    mailInfo3 = new FlxText(50, 50, 670, "placeholder", 0);
    mailInfo4 = new FlxText(50, 50, 670, "placeholder", 0);

    for (mails in [mailInfo1, mailInfo2, mailInfo3, mailInfo4]) {
        mails.setFormat(Paths.font("Bahnschrift.TTF"), 20, FlxColor.WHITE, "left");
        mails.color = secondaryTextColor;
        mails.antialiasing = false;
        mails.cameras = [mail];
        mails.alpha = 0;
        add(mails);
    }

    mailText1 = new FlxText(50, 50, 670, "placeholder", 0);
    mailText2 = new FlxText(50, 50, 670, "placeholder", 0);
    mailText3 = new FlxText(50, 50, 670, "placeholder", 0);
    mailText4 = new FlxText(50, 50, 670, "placeholder", 0);
    
    for (mails in [mailText1, mailText2, mailText3, mailText4]) {
        mails.setFormat(Paths.font("Bahnschrift.TTF"), 20, FlxColor.WHITE, "left");
        mails.color = mainTextColor;
        mails.antialiasing = false;
        mails.cameras = [mail];
        mails.alpha = 0;
        add(mails);
    }

    if (FlxG.save.data.dudemailsUnlocked >= 1) {
        mailInfo1.text = "To: BeeFunk@dudemail.com\nFrom: dudemanwastakenwastaken@dudemail.com\nSubject: READ MY DUDEMAIL. NOW.";
        mailText1.text = "\n\n\n\nDear Bee Eff,\nHeyyyyyyyyyy howzit goin dood anyway guess what!??? I'm going to KILL YOU in 3.18 day z so WATCH YOUR BACK! AND ur FRONT! and ur balls. i'm also gonna STEAL ur GRILFEND. yeah. AND I'M GONNA DO DEVIOUS THINGS TO HER. LIKE MAKE HER WATCH THE ENTIRE bee movie including all of the bonus features. YES. ALL of the BONUS features. yes. THEN uhhhhh idk we'll play MARIOCART. yes. MARIOCART on the 64 on the swatch. yes. and ill do one of those speedrunskip things. yes. then we'lll uhhh uhm i forgor\n\ntdlr, i'm coming for you. get ready, you bisexual bitch.\n\nKer Blam,\nDude-Man\n\nPostScript: FUCK YOU";
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        mailInfo2.text = "To: BeeFunk@dudemail.com\nFrom: MYLITTLEPONYFAN1264901@dudemail.com\nSubject: HIIHIHIHIHIIHIHH";
        mailText2.text = "\n\n\n\nDear Bee Eff,\naw man creeper";
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        mailInfo3.text = "To: BeeFunk@dudemail.com\nFrom: HotSexyDemon972@dudemail.com\nSubject: My Game.";
        mailText3.text = "\n\n\n\nDid you like punching DudeMan. Like, did you enjoy my game, my game that I. The one where you punch him, did you like it?";
    }
    if (FlxG.save.data.dudemailsUnlocked >= 4) {
        mailInfo4.text = "To: BeeFunk@dudemail.com\nFrom: damieunderscorean@dudemail.com\nSubject: IT IS NOT ME";
        mailText4.text = "\n\n\n\nhello buddy\n\nI just wanna let you know\n\nif you see purple plastic bowls and giant blocks of green ham falling from the sky that is NOT ME\n\nso don't enter my house again\n\nP.S. you still owe me $20.50 from last time\n\n-damie_an from Twitter.com";
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
        }
        if (FlxG.mouse.wheel < 0) {
            mails.scroll.y += 20;
        }
    }
    if (mails.scroll.y < 0) {
        mails.scroll.y = 0;
    }
    if (mail.scroll.y < 0) {
        mail.scroll.y = 0;
    }

    if (themeScroll == 0) {
        themesTxt.x = 195;
        themesTxt.text = '< LIGHT >';
        FlxG.save.data.mailTheme = "light";
    }
    if (themeScroll == 1) {
        themesTxt.x = 200;
        themesTxt.text = '< DARK >';
        FlxG.save.data.mailTheme = "dark";
    }
    if (themeScroll == 2) {
        themesTxt.x = 203;
        themesTxt.text = '< PINK >';
        FlxG.save.data.mailTheme = "pink";
    }
    if (themeScroll == 3) {
        themesTxt.x = 175;
        themesTxt.text = '< DAMIE_AN >';
        FlxG.save.data.mailTheme = "damie";
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

    if (FlxG.save.data.dudemailsUnlocked >= 1) {
        if (FlxG.mouse.overlaps(mailSlot1) && FlxG.mouse.justPressed) {
            selectedMail = 1;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        if (FlxG.mouse.overlaps(mailSlot2) && FlxG.mouse.justPressed) {
            selectedMail = 2;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        if (FlxG.mouse.overlaps(mailSlot3) && FlxG.mouse.justPressed) {
            selectedMail = 3;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 4) {
        if (FlxG.mouse.overlaps(mailSlot4) && FlxG.mouse.justPressed) {
            selectedMail = 4;
        }
    }

    if (selectedMail == 1) {
        mailInfo1.alpha = 1;
        mailText1.alpha = 1;
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
    }
}