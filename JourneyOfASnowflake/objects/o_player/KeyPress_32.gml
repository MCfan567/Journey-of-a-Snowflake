/// @description Shoot Projectile
// You can write your code in this editor

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
