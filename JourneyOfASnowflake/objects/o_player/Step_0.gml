/* Control Variables */
left_key = keyboard_check(ord("A")) || gamepad_button_check(1, gp_padl);
right_key = keyboard_check(ord("D")) || gamepad_button_check(1, gp_padr);
up_key = keyboard_check(ord("W")) || gamepad_button_check(1, gp_padu);
down_key = keyboard_check(ord("S")) || gamepad_button_check(1, gp_padd);
float_key = keyboard_check(vk_lcontrol) || gamepad_button_check(1,gp_face3);
shoot_key = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(1,gp_face2);
dash_key = 	keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(1,gp_face4);

/* Movement Controls start here */ 
var moveX = right_key - left_key;
var moveY = down_key - up_key;
directionX = moveX;

if (moveX != 0)
{
	phy_speed_x = moveX*Xspd;
	Dir = sign(moveX); // Used for projectile aiming
}
else
{
	phy_linear_velocity_x = 0;
}

if (moveY != 0 && !float_key)
{
	if (moveY < 0 && JumpLimit > 0)
	{
		JumpLimit--;
		phy_speed_y = moveY*(Yspd);
	}
}
/* Movement Controls End Here */

/* Float Mechanics Start Here */
if (float_key)
{
	
	if (phy_position_y > LastFloor - Hover)
	{
		phy_position_y = LastFloor - Hover;
	}
}
/* Float Mechanics End Here */

/* Dashing Mechanics Start Here */
if (dash_key){
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
/* Dashing Mechanics End Here */

/* Projectile Mechanics Start Here */
if(shoot_key) {
	var proj = instance_create_depth(x,y,-10000, o_projectile);
	with (proj) {
	
		if (keyboard_check(ord("P")) && keyboard_check(ord("L"))) {
			physics_apply_local_impulse(0, 10, 0, -200);
		}
		else if (keyboard_check(ord("S"))) {
			physics_apply_local_impulse(0, 10, 0, 200);
		}
		else if (keyboard_check(ord("L"))) {
			physics_apply_local_impulse(0, 10, o_player.Dir * 200, 200);
		}
		else if (keyboard_check(ord("P"))) {
			physics_apply_local_impulse(0, 10, o_player.Dir * 200, -200);
		}
		else {
			physics_apply_local_impulse(0, 10, o_player.Dir * 200, 0);
		}
	}
}
/* Projectile Mechanics End Here */

/* Water Mechanics Start Here */
if (place_meeting(phy_position_x, phy_position_y, o_water)) {
	phy_linear_velocity_x /= 2;
	if (moveY <= 0) {
		phy_speed_y = -Yspd*0.2;	
	} else {
		phy_speed_y = Yspd*0.1;
	}
}
/* Water Mechanics End Here */

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



