left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

var move = right_key - left_key;
var vmove = down_key - up_key;
if (left_key) {
	hspd = move * spd;
	image_xscale = -1;
	x += hspd;
}

if (right_key) {
	hspd = move * -spd;
	image_xscale = 1;
	x -= hspd;
}

if (up_key) {
	vspd = vmove * spd;
	y += vspd;
}

if (down_key) {
	vspd = vmove * -spd;
	y -= vspd;
}