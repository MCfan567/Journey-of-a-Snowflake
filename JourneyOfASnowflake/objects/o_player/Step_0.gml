left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
float_key = keyboard_check(vk_space);

var move = right_key - left_key;
var vmove = down_key - up_key;

//left movement
if (left_key) {
	hspd = move * spd;
	image_xscale = -1;
	x += hspd;
}
//right movement
if (right_key) {
	hspd = move * -spd;
	image_xscale = 1;
	x -= hspd;
}
//up movement
if (up_key) {
	vspd = vmove * spd;
	y += vspd;
}
//down movement
if (down_key) {
	if place_meeting(x, y + 1, o_wall) {
	gravity = 0;
}
else
{
vspd = vmove * -spd;
	y -= vspd;
}
	
}
//hover
if (keyboard_check_pressed(vk_lcontrol)) {
		y = y - 20;
}
if (keyboard_check_released(vk_lcontrol)) {
		y = y + 20;
}
//jumping and gravity
if !place_meeting(x, y + 1, o_wall) {
	gravity = 0;
}
