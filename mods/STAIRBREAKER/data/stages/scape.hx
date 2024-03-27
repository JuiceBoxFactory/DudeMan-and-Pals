import funkin.utils.CoolUtil;

sclr = 0;
spd = 0.01;

function postCreate() {
	scare.alpha = 0;
	scare.scale.x = scare.scale.y = 1.2;
}

function update() {
	if (scare.alpha > 0) {
		scare.alpha -= spd;
	}
	if (sclr > 0) {
		sclr -= spd / 2;
	}
	scare.scale.x = scare.scale.y = 1.2 + sclr;
}

function jump() {
	scare.alpha = 1;
	sclr = 0.5;
}

function j() {
	jump();
}

function myFunc() {
	jump();
}

function longscare() {
	spd *= 0.2;
	jump();
}

function beatHit(curBeat) {
	if (curBeat < 4) {
		trace(inst.pitch);
		spd = 0.01 * inst.pitch * inst.pitch;
	}
}