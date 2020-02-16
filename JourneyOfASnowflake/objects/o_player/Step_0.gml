left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
float_key_down = keyboard_check(vk_lcontrol) || gamepad_button_check_pressed(0,gp_face3);

left_dpad = gamepad_button_check(0, gp_padl);
right_dpad = gamepad_button_check(0, gp_padr);
up_dpad = gamepad_button_check(0, gp_padu);
down_dpad = gamepad_button_check(0, gp_padd);

var moveX = right_key - left_key;
var moveXG = right_dpad - left_dpad;

var moveY = down_key - up_key;
var moveYG = down_dpad - up_dpad;

if (moveX != 0)
{
	phy_speed_x = moveX*Xspd;	
}
else if (moveXG != 0)
{
	phy_speed_x = moveXG*Xspd;	
}

if (moveY != 0 && !float_key_down)
{
	phy_speed_y = moveY*Yspd;
}
else if (moveYG != 0 && float_key_down)
{
	phy_speed_y = moveYG*Yspd;	
}

if (float_key_down)
{

	if (phy_position_y < LastFloor - Hover)
	{
		phy_speed_y = +Yspd;
	}
	else
	{
		phy_position_y = LastFloor - Hover;
	}
}