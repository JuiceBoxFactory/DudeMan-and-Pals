import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxOutlineEffect;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import funkin.backend.utils.DiscordUtil;

var notifBanner:FlxTypedGroup<FlxSprite> = [];
var notifIcon:FlxTypedGroup<FlxSprite> = [];
var notifText:FlxTypedGroup<FlxText> = [];
var notificationQueue = [
    "question",
    "question",
    "question",
];
var notificationText = [
    "nothing to see here...",
    "nothing to see here...",
    "nothing to see here...",
];
var dam = false;
var amountOfNotifications = 0;
var length = 2;

function create() {

    if (FlxG.save.data.notificationLength != null) {
        length = FlxG.save.data.notificationLength;
    }

    FlxG.save.data.notificationLength = 0;

    if (FlxG.save.data.notificationType1 != "") {
        amountOfNotifications += 1;
    }
    if (FlxG.save.data.notificationType2 != "") {
        amountOfNotifications += 1;
    }
    if (FlxG.save.data.notificationType3 != "") {
        amountOfNotifications += 1;
    }

    trace(amountOfNotifications);

    notificationQueue[0] = FlxG.save.data.notificationType1;
    notificationQueue[1] = FlxG.save.data.notificationType2;
    notificationQueue[2] = FlxG.save.data.notificationType3;
    notificationText[0] = FlxG.save.data.notificationMessage1;
    notificationText[1] = FlxG.save.data.notificationMessage2;
    notificationText[2] = FlxG.save.data.notificationMessage3;
    FlxG.save.data.notificationType1 = "";
    FlxG.save.data.notificationMessage1 = "";
    FlxG.save.data.notificationType2 = "";
    FlxG.save.data.notificationMessage2 = "";
    FlxG.save.data.notificationType3 = "";
    FlxG.save.data.notificationMessage3 = "";


    notifCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(notifCam, false);
    notifCam.bgColor = 0x00000000;

    for (i in 0...amountOfNotifications)	{

        notificationBanner = new FlxSprite(1479, 64).loadGraphic(Paths.image('notificationSys/box'));
        notificationBanner.antialiasing = false;
        notificationBanner.updateHitbox();
        notificationBanner.y = (100 * i) + 64;
        notificationBanner.cameras = [notifCam];
        notifBanner.push(notificationBanner);
        add(notificationBanner);
    
        notificationTextSprite = new FlxText(1523, 70, 250);
        notificationTextSprite.setFormat(Paths.font("TwCen.ttf"), 30, FlxColor.BLACK, "right");           
        notificationTextSprite.text = notificationText[i];
        notificationTextSprite.y = 70 + (100 * i);
        notificationTextSprite.cameras = [notifCam];
        notificationTextSprite.antialiasing = false;
        notifText.push(notificationTextSprite);
        add(notificationTextSprite);
    
        notificationIcon = new FlxSprite(1479, 64).loadGraphic(Paths.image('notificationSys/'+notificationQueue[i]));
        notificationIcon.antialiasing = false;
        notificationIcon.y = 64 + (100 * i);
        notificationIcon.updateHitbox();
        notificationIcon.cameras = [notifCam];
        notifIcon.push(notificationIcon);
        add(notificationIcon);

    }

    animation();

}

function animation() {

    for (i in 0...amountOfNotifications) {

                    FlxTween.tween(notifIcon[i], {x: 979}, 1.5 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                    FlxTween.tween(notifBanner[i], {x: 979}, 1.5 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                    FlxTween.tween(notifText[i], {x: 1023}, 1.5 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                    new FlxTimer().start(0.5, function(timer) {
                        FlxG.sound.play(Paths.sound("confirm"));
                    });
                    new FlxTimer().start(length + 1, function(timer) {
                        FlxTween.tween(notifIcon[i], {x: 1479}, 1 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                        FlxTween.tween(notifBanner[i], {x: 1479}, 1 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                        FlxTween.tween(notifText[i], {x: 1523}, 1 + (i * 0.25), {ease:FlxEase.quartInOut}); 
                    });
                    new FlxTimer().start(length + 2.1, function(timer) {
                        close();
                    });
        
                }

}