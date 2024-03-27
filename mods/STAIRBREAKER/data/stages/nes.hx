import flixel.addons.display.FlxBackdrop;

var beatTime = 8;
var tween:FlxTween;
var shader:CustomShader = null;
var shader2:CustomShader = null;
var shader3:CustomShader = null;
var dddPart = false;
var time = 0;
var coolBackdrop = FlxBackdrop;
function create() {
	coolBackdrop = new FlxBackdrop(Paths.image('stages/bloader/cool')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.velocity.x = 1200; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 0;
	coolBackdrop.active = true;
	coolBackdrop.visible = false;
	insert(members.indexOf(dad), coolBackdrop);
	insert(members.indexOf(boyfriend), coolBackdrop);

	trace("ok");
	ddd = new Character(dad.x - 200, dad.y - 100, "ddd");
	ddd.scale.x = ddd.scale.y = dad.scale.x;
	ddd.flipX = dad.flipX;
	ddd.alpha = 0;
	add(ddd);
    	box = new FlxSprite();
	box.makeGraphic(10, 10, FlxColor.WHITE);
	box.x = 0;
	box.y = 0;
	box.camera = camGame;
	add(box);
	black();
	tween = FlxTween.tween(box, {x: 0}, 0.2 * beatTime, {ease:FlxEase.backOut});
	tween.cancel();
	shader = new CustomShader("bloom");
	shader2 = new CustomShader("bgGlitch");
	shader3 = new CustomShader("effect weird");
	if (FlxG.save.data.flights == true) {
		camGame.addShader(shader2);
		camGame.addShader(shader3);
	}
	boyfriend.shader = shader;
	dad.shader = shader;
	ddd.shader = dad.shader;
	shader.iOn = 0.0;
	shader.iAmount = 0.75;
	shader2.iAmt = 0;
	shader3.iAmt = 40000;
	shader3.offsetIntensity = 5;
}
function update(elapsed) {
	defaultCamZoom = FlxMath.remapToRange(camGame.scroll.x, 300, 0, 1.2, 0.9);
	camGame.zoom = defaultCamZoom + box.x / 100;
	camHUD.zoom = 1 + box.x / 800;
	if (dddPart == true) {
		camGame.scroll.x = ddd.x - 600;
		camGame.scroll.y = ddd.y + 100;
	}
	time += 0.05 * 60 * elapsed;
	shader2.iTime = time;
	shader3.iTime = time;
	shader3.Amt = (box.y / 1000);
}

function onDadHit(event) {
	ddd.playSingAnim(event.direction);
}
function dee() {
	ddd.alpha = 1;
	dad.alpha = 0;
	dad.scale.y /= 2;
	dad.scale.x /= 1.5;
	dad.y += 100;
	bg.color = FlxColor.fromRGB(255, 100, 100, 0);
	stageFront.color = FlxColor.fromRGB(200, 50, 50, 0);
	box.y = 500;
	shader2.iAmt = 0.5;
}
function k() {
	ddd.alpha = 0;
	dad.alpha = 1;
	dad.scale.y *= 2;
	dad.scale.x *= 1.5;
	dad.y -= 100;
	box.y = 750;
	shader2.iAmt = 1;
}
function flash() {
	camHUD.flash(FlxColor.fromRGB(255,255,255), 0.5);
}
function black() {
	camGame.alpha = 0;
}
function unblack() {
	camGame.alpha = 1;
	flash();
}

function beatHit(curBeat) {
	if (curBeat < 2) {
		tween.cancel();
		tween = FlxTween.tween(box, {x: 0}, 0.2 * beatTime, {ease:FlxEase.quartOut});
		camGame.alpha = 1;
		camHUD.alpha = 1;
		camGame.angle = 0;
		camHUD.angle = 0;
		shader2.iAmt = 0;
		shader3.iAmt = 0;
		shader3.offsetIntensity = 0;
		dad.color = FlxColor.fromRGB(255, 255, 255, 0);
		dad.scale.y = 10;
		dad.scale.x = 10;
		dad.x = 1300;
		dad.y = 350;
		bg.color = FlxColor.fromRGB(255, 255, 255, 0);
		stageFront.color = FlxColor.fromRGB(255, 255, 255, 0);
		box.y = 0;
		ddd.scale.x = ddd.scale.y = dad.scale.x;
		ddd.color = FlxColor.fromRGB(255, 255, 255, 0);
		ddd.flipX = dad.flipX;
		ddd.x = dad.x - 200;
		ddd.y = dad.y - 100;
		ddd.alpha = 0;
		dddPart = false;
		coolBackdrop.visible = false;
		boyfriend.color = FlxColor.fromRGB(255, 255, 255, 0);
	}
	if (curBeat > 4 && curBeat < 32) {
		camGame.alpha = 1;
	}
	if (curBeat % beatTime == 0) {
		tween.cancel();
		box.x = 20;
		tween = FlxTween.tween(box, {x: 0}, 0.2 * beatTime, {ease:FlxEase.quartOut});
	}
}

function bt(num) {
	beatTime = num;
}

function zoom() {
	tween.cancel();
	box.x = 20;
	tween = FlxTween.tween(box, {x: 0}, 0.2, {ease:FlxEase.quartOut});
}

function scary() {
	shader2.iAmt = 1;
	shader3.iAmt = 1;
	shader3.offsetIntensity = 1;
	dad.color = FlxColor.fromRGB(15, 0, 0, 0);
	dad.scale.y *= 2;
	dad.scale.x *= 1.5;
	dad.y -= 100;
	bg.color = FlxColor.fromRGB(200, 50, 50, 0);
	stageFront.color = FlxColor.fromRGB(150, 25, 25, 0);
	box.y = 1000;
}
function thatonedddpart() {
	coolBackdrop.visible = true;
	shader.iOn = 1.0;
	flash();
}
function notthatonedddpart() {
	shader.iOn = 0.0;
	flash();
}

function almostend() {
	coolBackdrop.visible = true;
	ddd.alpha = 1;
	ddd.x += 0;
	ddd.y -= 100;
	ddd.color = FlxColor.fromRGB(5, 0, 0, 0);
	dad.color = FlxColor.fromRGB(5, 0, 0, 0);
	dad.x -= 0;
	dad.y -= 0;
	ddd.scale.y *= 1.25;
	ddd.scale.x *= 1.5;
	dad.scale.x *= 1.75;
	dad.scale.y *= 1.15;
	dad.alpha = 1;
	boyfriend.color = FlxColor.fromRGB(150, 100, 100, 0);
}

function THEEND() {
	dddPart = true;
	boyfriend.color = FlxColor.fromRGB(75, 50, 50, 0);
}

function end() {
	FlxTween.tween(camGame, {alpha:0, angle:1440}, 8, {ease: FlxEase.quadOut});
}