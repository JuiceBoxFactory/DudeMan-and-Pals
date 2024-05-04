import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;

var mails = new FlxCamera();
var mail = new FlxCamera();

var mainTextColor = 0xFF000000;
var secondaryTextColor = 0xFF3F3F3F;
var otherTextColor = 0xFF5E5E5E;

function create() {

    coolBackdrop = new FlxBackdrop(Paths.image('dudeMail/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100;
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

//    makeMail(mail1, 100, dudeman, "dudeman", "whatveer", "whatever");


}

function makeMail(name, posY, icon, sender, subject, text) {



}

function makeMail2(info1name, text1name, icon1name, info1, text1, icon1) {


    
}