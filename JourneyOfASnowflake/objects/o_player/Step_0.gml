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
	phy_position_x -= spd;	
}
//right movement
if (right_key || right_dpad) {
	image_xscale = 1;	
	phy_position_x += spd;	
}
//up movement
if (up_key || up_dpad) {	
	phy_position_y -= spd;	
		
}
//down movement
if (down_key || down_dpad) {
	vspd = -spd;
	phy_position_y -= vspd;
}

//hover
if (float_key_down) {
	phy_position_y -= 20;
}