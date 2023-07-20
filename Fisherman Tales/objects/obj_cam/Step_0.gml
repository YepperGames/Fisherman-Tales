if (object_exists(follow)){
	targetX = follow.x;
	targetY = follow.y;
}

x+=(targetX - x)/spd;
y+=(targetY - y)/spd;

// posição da cam
camera_set_view_pos(cam, x-w_half, y-h_half);