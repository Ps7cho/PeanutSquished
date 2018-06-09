/// @description 

x += (xTo - x)/25;
y += (yTo - y)/25

if (follow != noone)
{
	xTo = lerp(follow.x, mouse_x, 0.3)-(view_w/2);
	yTo = lerp(follow.y, mouse_y, 0.3)-(view_h/2);
}

var vm = matrix_build_lookat(x, y,-10, x, y, 0,0,1,0);
camera_set_view_mat(camera, vm);

if bounded {
	xTo = clamp(xTo, 0, room_width-view_w);	
	yTo = clamp(yTo, 0, room_height-view_h);	
}
