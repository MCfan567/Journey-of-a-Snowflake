left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
float_key_down = keyboard_check_pressed(vk_lcontrol) || gamepad_button_check_pressed(0,gp_face3);
float_key_up = keyboard_check_released(vk_lcontrol) || gamepad_button_check_released(0,gp_face3);

left_dpad = gamepad_button_check(0, gp_padl);
right_dpad = gamepad_button_check(0, gp_padr);
up_dpad = gamepad_button_check(0, gp_padu);
down_dpad = gamepad_button_check(0, gp_padd);

//left movement
if (left_key || left_dpad) {
	image_xscale = -1;
	if (!place_meeting(x - 5, y, o_wall)) {
		x -= spd;
	}
}
//right movement
if (right_key || right_dpad) {
	image_xscale = 1;
	if (!place_meeting(x + 5, y, o_wall)) {
		x += spd;
	}
}
//up movement
if (up_key || up_dpad) {
	if (!place_meeting(x, y - 5, o_wall)) {
		y -= spd;
	}
}
//down movement
if (down_key || down_dpad) {
	if place_meeting(x, y + 5, o_wall) {
	gravity = 0;
	}
	else
	{
		vspd = -spd;
		y -= vspd;
	}
}
//hover
if (float_key_down) {
		y -= 20;
}
if (float_key_up) {
		y += 20;
}
//jumping and gravity
if !place_meeting(x, y + 1, o_wall) {
	gravity = 0;
}
