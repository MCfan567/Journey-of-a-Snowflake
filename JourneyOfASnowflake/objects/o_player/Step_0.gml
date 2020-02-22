left_key = keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl);
right_key = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr);
up_key = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
down_key = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd);;
float_key_down = keyboard_check(vk_lcontrol) || gamepad_button_check_pressed(0,gp_face3);

var moveX = right_key - left_key;
var moveY = down_key - up_key;

if (moveX != 0)
{
	phy_speed_x = moveX*Xspd;	
}
else
{
	phy_linear_velocity_x = 0;
}

if (moveY != 0 && !float_key_down)
{
	if (moveY < 0 && JumpLimit > 0)
	{
		JumpLimit--;
		phy_speed_y = moveY*Yspd;
	}
}

if (float_key_down)
{
	
	if (phy_position_y > LastFloor - Hover)
	{
		phy_position_y = LastFloor - Hover;
	}
}
if (keyboard_check_pressed(vk_shift)){
	dashcount++;
	dashinterval = 0;
}
else {
	dashinterval++;

if (dashinterval >= 60 && dashing == false) {
	dashcount = 0;
	dashinterval = 0;
	}
}
if (dashcount >= 1) {
	dashing = true;
}

if (dashing) {
	if (left_key) || (right_key) {
		Xspd = 20;
		dashcount = 0;
		dashinterval = 0;
		timer++;
	}
}
if (timer >= 4 ) {
	Xspd = 3;
	dashing = false;
	timer = 0;
}

//Below Here are the Animation Functions. The PlayerLimbs
//Object is a child object of this one. As so long as the frames
//On both sprite sheets correspond, we do not need to animate them both
//seperately.
xVel = phy_linear_velocity_x;
yVel = phy_linear_velocity_y;
if (xVel == 0)
{
	image_index = 0;
}

sideToSide = 1;
goingUp = 3;
comingDown = 4;
if(xVel != 0)
{
	image_index = sideToSide;
	image_xscale = 1*sign(xVel);
}
else if(yVel != 0)
{
	if (yVel < 0)
	{
		image_index = goingUp;
	}
	else
	{
		if (!place_free(phy_position_x,phy_position_y+yVel))
		{
			image_index = comingDown;
		}
	}
}



