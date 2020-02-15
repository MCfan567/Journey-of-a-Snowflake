left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

var move = right_key - left_key;
var vmove = down_key - up_key;
if (left_key) {
	horizontal = move * spd;
	x += horizontal;
}

if (right_key) {
	horizontal = move * -spd;
	x -= horizontal;
}

if (up_key) {
	vertical = vmove * spd;
	y += vertical;
}

if (down_key) {
	vertical = vmove * -spd;
	y -= vertical;
}