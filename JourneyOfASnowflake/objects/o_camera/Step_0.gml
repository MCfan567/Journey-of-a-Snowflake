targetPos[0] = o_player.x - (0.5 * camera_get_view_width(cam));
targetPos[1] = o_player.y - (0.5 * camera_get_view_height(cam));

//Set target to mouse
if (mouse_check_button(2)) {
	targetPos = [mouse_x - (0.5 * camera_get_view_width(cam)), mouse_y - (0.5 * camera_get_view_height(cam))];
}

//Lerp current to target
currentPos[0] = lerp(currentPos[0], targetPos[0], 0.2);
currentPos[1] = lerp(currentPos[1], targetPos[1], 0.2);

//Set camera to current
camera_set_view_pos(cam, currentPos[0], currentPos[1]);

