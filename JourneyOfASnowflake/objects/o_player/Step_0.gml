left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
float_key = keyboard_check(vk_space);

left_dpad = gamepad_button_check(0, gp_padl);
right_dpad = gamepad_button_check(0, gp_padr);
up_dpad = gamepad_button_check(0, gp_padu);
down_dpad = gamepad_button_check(0, gp_padd);

//left movement
if (left_key || left_dpad) {
	image_xscale = -1;
	x -= spd;
}
//right movement
if (right_key || right_dpad) {
	image_xscale = 1;
	x += spd;
}
//up movement
if (up_key || up_dpad) {
	y -= spd;
}
//down movement
if (down_key || down_dpad) {
	y += spd;
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
	y += grv;
}
else {
	grv = 0; 
}
