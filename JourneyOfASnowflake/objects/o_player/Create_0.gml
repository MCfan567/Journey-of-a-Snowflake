Xspd = 4;
Yspd = 10;
Hover = 10;

HP = 50;
HPMAX = HP;

hBarWidth = 100;
hBarHeight = 12;
hBarX = 50;
hBarY = 25;

directionX = 0;

dashcount = 0;
dashing = false;
dashinterval = 0

timer = 0;
JumpLimit = 2;
LastFloor = 0;
phy_fixed_rotation=true;  


spikeDamage = 5;



image_speed = 0;
image_index = 0;

/* Gamepad Support */
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
	if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
	
}