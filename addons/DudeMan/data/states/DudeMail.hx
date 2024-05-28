import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.text.FlxText;

var mails = new FlxCamera(100, 100, 285, 10000);
var mail = new FlxCamera(450, 100, 770, 620);
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
var linkColor = 0xFF49AFFF;
var slot = 'dudeMail/ui/emailSlot';
var slotSelected = 'dudeMail/ui/emailSlot';
var selectedMail = 1;
var slotToBe = null;
var burgerToBe = null;
var themeScroll = 0;
var shit = new CustomShader("shit");

function create() {

    if (FlxG.save.data.mailTheme == null) {
        FlxG.save.data.mailTheme = "light";
        FlxG.resetState();
    }

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
        topBar1 = 0xFFFFB7D1;
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
    if (theme == "crescent") {
        mainTextColor = 0xFFFFFFFF;
        secondaryTextColor = 0xFFFFB7B7;
        otherTextColor = 0xFFB65353;
        coolBackdrop.loadGraphic(Paths.image('dudeMail/checkerboardbgCRESCENT'));
        slot = slot+'CRESCENT';
        slotSelected = slotSelected+'CRESCENTselected';        
        mailsBack = 0xFF5B2727;
        mailBack = 0xFF500F0F;
        topBar1 = 0xFFFFCECE;
        topBar2 = 0xFF2E0000;
        themeScroll = 4;
    }
    if (theme == "retro") {
        slot = slot+'LIGHT';
        slotSelected = slotSelected+'LIGHTselected';
        for (cameras in [camera, awesomeCam, cursorCam, mail, mails])
            cameras.addShader(shit);
        themeScroll = 5;
    }
    if (theme == "mrbeast") {
        mainTextColor = 0xFF25000C;
        secondaryTextColor = 0xFF00647A;
        otherTextColor = 0xFFE3447C;
        coolBackdrop.loadGraphic(Paths.image('dudeMail/backdropMrBeast'));
        slot = slot+'mrbeast';
        slotSelected = slotSelected+'mrbeastselected';        
        mailsBack = 0xFF41DFFE;
        mailBack = 0xFF08B0D5;
        topBar1 = 0xFF41DFFE;
        topBar2 = 0xFFE3447C;
        themeScroll = 6;
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

	mailsPos = new FlxSprite(100, 100).makeGraphic(285, 10000, mailsBack);
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
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        makeMail("5", 444, "icon5", "sender5", "subject5", "bee", "Bee", "Hey c:");
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        makeMail("6", 555, "icon6", "sender6", "subject6", "fruity", "FRUITY", "DONT IGNORE THIS MESSAGE.");
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        makeMail("7", 666, "icon7", "sender7", "subject7", "puzzle", "Puzzle", "Please");
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
    if (number == "5") {
        mailSlot5 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot5;
    }
    if (number == "6") {
        mailSlot6 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot6;
    }
    if (number == "7") {
        mailSlot7 = new FlxSprite(100, 100).loadGraphic(Paths.image(slot));
        slotToBe = mailSlot7;
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
    mailInfo5 = new FlxText(50, 50, 670, "placeholder", 0);
    mailInfo6 = new FlxText(50, 50, 670, "placeholder", 0);
    mailInfo7 = new FlxText(50, 50, 670, "placeholder", 0);

    for (mails in [mailInfo1, mailInfo2, mailInfo3, mailInfo4, mailInfo5, mailInfo6, mailInfo7]) {
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
    mailText5 = new FlxText(50, 50, 670, "placeholder", 0);
    mailText6 = new FlxText(50, 50, 670, "placeholder", 0);
    mailText7 = new FlxText(50, 50, 670, "placeholder", 0);
    
    for (mails in [mailText1, mailText2, mailText3, mailText4, mailText5, mailText6, mailText7]) {
        mails.setFormat(Paths.font("Bahnschrift.TTF"), 20, FlxColor.WHITE, "left");
        mails.color = mainTextColor;
        mails.antialiasing = false;
        mails.cameras = [mail];
        mails.alpha = 0;
        add(mails);
    }

    linkText1 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText2 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText3 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText4 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText5 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText6 = new FlxText(50, 50, 670, "placeholder", 0);
    linkText7 = new FlxText(50, 50, 670, "placeholder", 0);
    
    for (mails in [linkText1, linkText2, linkText3, linkText4, linkText5, linkText6, linkText7]) {
        mails.setFormat(Paths.font("Bahnschrift.TTF"), 20, linkColor, "left");
        mails.color = linkColor;
        mails.antialiasing = false;
        mails.cameras = [mail];
        mails.alpha = 0;
        mails.underline = true;
        add(mails);
    }

    if (FlxG.save.data.dudemailsUnlocked >= 1) {
        mailInfo1.text = "To: BeeFunk@dudemail.com\nFrom: dudemanwastakenwastaken@dudemail.com\nSubject: READ MY DUDEMAIL. NOW.";
        mailText1.text = "\n\n\n\nDear Bee Eff,\nHeyyyyyyyyyy howzit goin dood anyway guess what!??? I'm going to KILL YOU in 3.18 day z so WATCH YOUR BACK! AND ur FRONT! and ur balls. i'm also gonna STEAL ur GRILFEND. yeah. AND I'M GONNA DO DEVIOUS THINGS TO HER. LIKE MAKE HER WATCH THE ENTIRE bee movie including all of the bonus features. YES. ALL of the BONUS features. yes. THEN uhhhhh idk we'll play MARIOCART. yes. MARIOCART on the 64 on the swatch. yes. and ill do one of those speedrunskip things. yes. then we'lll uhhh uhm i forgor\n\ntdlr, i'm coming for you. get ready, you bisexual bitch.\n\nKer Blam,\nDude-Man\n\nPostScript: FUCK YOU";
        linkText1.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        mailInfo2.text = "To: BeeFunk@dudemail.com\nFrom: MYLITTLEPONYFAN1264901@dudemail.com\nSubject: HIIHIHIHIHIIHIHH\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n=======================\nTo: MYLITTLEPONYFAN1264901@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: but when\n\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: MYLITTLEPONYFAN1264901@dudemail.com\nSubject: REGARDING AWESOMENESS";
        mailText2.text = "\n\n\n\nDEAR THAT ONE GUY FROM THAT ONE TIME,\nHI AGAIN !!! THOSE 2 SONGS WE GOT TO SING TOGETHER WERE REALLY FUN AND I THINK WE SHOULD DO IT AGAIN SOMETIME X333 ALSO ALSO HAVE YOU WATCHED MY LITTLE PONY BEFORE ??? I THINK YOU'D LIKE IT ALOT ACTUALLY ITS REALLY GOOD WE COULD WATCH IT TOGETHER AND LIKE UHM UHMU UMHUHMUHMUHMUMU YEAH IT'LL BE AWESOME WE CAN WATCH ALL THE SEASONS AND ALL THE MOVIES !!\n\ni have nothing else to do.\n\nIM SO EXCITED I LOVE MY LITTLE PONY I HOPE YOU'LL LIKE IT :3\n\n- FRUITY !!!\n\n\n\n\n\n\nI'd be up for that maybe! but.. also when would we do it..?\ntime is a very important factor\n\n\n\n\n\n\nNEXT WEEK ON THIS EXACT DAY AT LIKE 2PM";
        linkText2.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        mailInfo3.text = "To: BeeFunk@dudemail.com\nFrom: HotSexyDemon972@dudemail.com\nSubject: My Game.";
        mailText3.text = "\n\n\n\nDid you like punching DudeMan. Like, did you enjoy my game, my game that I. The one where you punch him, did you like it?";
        linkText3.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 4) {
        mailInfo4.text = "To: BeeFunk@dudemail.com\nFrom: damieunderscorean@dudemail.com\nSubject: IT IS NOT ME";
        mailText4.text = "\n\n\n\nhello buddy\n\nI just wanna let you know\n\nif you see purple plastic bowls and giant blocks of green ham falling from the sky that is NOT ME\n\nso don't enter my house again\n\nP.S. you still owe me $20.50 from last time\n\n-damie_an from Twitter.com";
        linkText4.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 5) {
        mailInfo5.text = "To: SavingGracie@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: Hey c:\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: SavingGracie@dudemail.com\nSubject: Hi\n\n\n\n=========================\nTo: SavingGracie@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: <NO SUBJECT>\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: SavingGracie@dudemail.com\nSubject: <NO SUBJECT>\n\n\n\n=========================\nTo: SavingGracie@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: <NO SUBJECT>\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: SavingGracie@dudemail.com\nSubject: <NO SUBJECT>";
        mailText5.text = "\n\n\n\nHi Hun\n\n\n\n\n\n\nHey hunny! do you need something?\n\n\n\n\n\n\nGuess whaatt...\n\n\n\n\n\n\nHmmmm? what is it?\n\n\n\n\n\n\nI love you <33\n\n\n\n\n\n\nYou're such a dork, dear\n\nI love you too <3333";
        linkText5.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 6) {
        mailInfo6.text = "To: BeeFunk@dudemail.com\nFrom: MYLITTLEPONYFAN1264901@dudemail.com\nSubject: DONT IGNORE THIS MESSAGE\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n=======================\nTo: MYLITTLEPONYFAN1264901@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: uhm\n\n\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: MYLITTLEPONYFAN1264901@dudemail.com\nSubject: UHM ACTUALLY\n\n\n\n\n=========================\nTo:MYLITTLEPONYFAN1264901@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: oh";
        mailText6.text = '\n\n\n\nyou need to forward this message to 5 friends or you will DIE,\n\njust like distinguishable blue haired guy with pronouns, he finds himself in a white void, he can only walk forward, eventually he finds dudeman.exe, he touches him and he turns EVIL... and the screen turns black and and he says "PLAY MY GAME. NOW." then, the background turns into a weird fleshy moutain, and he walks right, again. and eventually, dudeman with blacked out, bleeding eyes starts chasing legally distinct blue haired child, eventually, since he cannot outrun dudeman.exe, he gets caught, which leads to him dying. dudeman then says "SO LITTLE GAMES TO PLAY, SO LITTLE TIME, WOULDNT YOU AGREE?"\n\ndont not heed these warnings. forward this message NOW.\n\n\n\n\n\n\nFruity, you do know those arent real.. right?\n\nalso that really sounds like its about me???\n\n\n\n\n\n\nTHATS NOT POSSIBLE !!! WHO WOULD EVER WRITE SOMETHING LIKE THIS IF IT ISNT TRUE ?? NOBODY IS THAT MESSED UP :c\n\n\n\n\n\n\n...Fruity, have you ever heard of 4chan?';
        linkText6.text = '';
    }
    if (FlxG.save.data.dudemailsUnlocked >= 7) {
        mailInfo7.text = "To: BeeFunk@dudemail.com\nFrom: HotSexyDemon972@dudemail.com\nSubject: Please\n\n\n\n\n\n\n\n=======================\nTo: HotSexyDemon972@dudemail.com\nFrom: BeeFunk@dudemail.com\nSubject: uhm\n\n\n\n=========================\nTo: BeeFunk@dudemail.com\nFrom: HotSexyDemon972@dudemail.com\nSubject: <NO SUBJECT>";
        mailText7.text = '\n\n\n\n>:] Hey..,., bee.,., can you forward this link to DudeMan? he has me blocked\n\n\n\nplease bee i need this\n\n\n\n\n\n\nthis is very clearly an ip grabber\n\n\n\n\n\n\n>:] no';
        linkText7.text = '\n\n\n\n\n\nhttps://puzzles-ip-grabber.com/pls\n\n';
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
    if (camera.scroll.y < 0) {
        camera.scroll.y = 0;
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
        themesTxt.x = 150;
        themesTxt.text = '< COTTON CANDY >';
        FlxG.save.data.mailTheme = "pink";
    }
    if (themeScroll == 3) {
        themesTxt.x = 190;
        themesTxt.text = '< CHEESE >';
        FlxG.save.data.mailTheme = "damie";
    }
    if (themeScroll == 4) {
        themesTxt.x = 155;
        themesTxt.text = '< CRESCENT RED >';
        FlxG.save.data.mailTheme = "crescent";
    }
    if (themeScroll == 5) {
        themesTxt.x = 196;
        themesTxt.text = '< RETRO >';
        FlxG.save.data.mailTheme = "retro";
    }
    if (themeScroll == 6) {
        themesTxt.x = 176;
        themesTxt.text = '< MR.BEAST >';
        FlxG.save.data.mailTheme = "mrbeast";
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
        themeScroll = 6;
    }
    if (themeScroll > 6) {
        themeScroll = 0;
    }



    if (FlxG.keys.justPressed.U) {
        FlxG.save.data.dudemailsUnlocked = 100;
        FlxG.resetState();
    }
    if (FlxG.keys.justPressed.PAGEUP) {
        selectedMail = 1;
    }
    if (FlxG.keys.justPressed.PAGEDOWN) {
        selectedMail = dudemailsUnlocked;
    }
    if (controls.BACK) {
        FlxG.switchState(new ModState("FreeplaySelector"));
    }

    if (FlxG.save.data.dudemailsUnlocked >= 1) {
        slotToBe.updateHitbox();
        slotToBe.offset.set(100, 100);
        if (FlxG.mouse.overlaps(mailSlot1) && FlxG.mouse.justPressed) {
            selectedMail = 1;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 2) {
        if (FlxG.mouse.overlaps(mailSlot2) && FlxG.mouse.justPressed) {
            selectedMail = 2;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 3) {
        if (FlxG.mouse.overlaps(mailSlot3) && FlxG.mouse.justPressed) {
            selectedMail = 3;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 4) {
        if (FlxG.mouse.overlaps(mailSlot4) && FlxG.mouse.justPressed) {
            selectedMail = 4;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 5) {
        if (FlxG.mouse.overlaps(mailSlot5) && FlxG.mouse.justPressed) {
            selectedMail = 5;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 6) {
        if (FlxG.mouse.overlaps(mailSlot6) && FlxG.mouse.justPressed) {
            selectedMail = 6;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }
    if (FlxG.save.data.dudemailsUnlocked >= 7) {
        if (FlxG.mouse.overlaps(mailSlot7) && FlxG.mouse.justPressed) {
            selectedMail = 7;
            FlxG.sound.play(Paths.sound('dudemailClick'), 0.5);
            mail.scroll.y = 0;
        }
    }

    
    if (selectedMail == 1) {
        mailInfo1.alpha = 1;
        mailText1.alpha = 1;
        linkText1.alpha = 1;
        mailSlot1.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo1.alpha = 0;
        mailText1.alpha = 0;
        linkText1.alpha = 0;
        mailSlot1.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 2) {
        mailInfo2.alpha = 1;
        mailText2.alpha = 1;
        linkText2.alpha = 1;
        mailSlot2.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo2.alpha = 0;
        mailText2.alpha = 0;
        linkText2.alpha = 0;
        mailSlot2.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 3) {
        mailInfo3.alpha = 1;
        mailText3.alpha = 1;
        linkText3.alpha = 1;
        mailSlot3.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo3.alpha = 0;
        mailText3.alpha = 0;
        linkText3.alpha = 0;
        mailSlot3.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 4) {
        mailInfo4.alpha = 1;
        mailText4.alpha = 1;
        linkText4.alpha = 1;
        mailSlot4.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo4.alpha = 0;
        mailText4.alpha = 0;
        linkText4.alpha = 0;
        mailSlot4.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 5) {
        mailInfo5.alpha = 1;
        mailText5.alpha = 1;
        linkText5.alpha = 1;
        mailSlot5.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo5.alpha = 0;
        mailText5.alpha = 0;
        linkText5.alpha = 0;
        mailSlot5.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 6) {
        mailInfo6.alpha = 1;
        mailText6.alpha = 1;
        linkText6.alpha = 1;
        mailSlot6.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo6.alpha = 0;
        mailText6.alpha = 0;
        linkText6.alpha = 0;
        mailSlot6.loadGraphic(Paths.image(slot));
    }
    if (selectedMail == 7) {
        mailInfo7.alpha = 1;
        mailText7.alpha = 1;
        linkText7.alpha = 1;
        mailSlot7.loadGraphic(Paths.image(slotSelected));
    }
    else {
        mailInfo7.alpha = 0;
        mailText7.alpha = 0;
        linkText7.alpha = 0;
        mailSlot7.loadGraphic(Paths.image(slot));
    }
}