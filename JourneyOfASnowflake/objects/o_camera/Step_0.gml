targetPos[0] = o_player.x - (0.5 * camera_get_view_width(cam));
targetPos[1] = o_player.y - (0.5 * camera_get_view_height(cam));

if (mouse_check_button(1)) {
	targetPos[0] = mouse_x;
	targetPos[1] = mouse_y;
}

currentPos[0] = lerp(currentPos[0], targetPos[0], 0.5);
currentPos[1] = lerp(currentPos[1], targetPos[1], 0.5);
camera_set_view_pos(cam, currentPos[0], currentPos[1]);

