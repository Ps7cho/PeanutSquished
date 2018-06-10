/// @description 

if follow != noone{
var ran_x = choose(-100,100);
var ran_y = choose(-100,100);

	x += (xTo - x)/25;
	y += (yTo - y)/25


	xTo = lerp(follow.x, mouse_x, 0.5);
	yTo = lerp(follow.y, mouse_y, 0.5);
if shooting{
	xTo = xTo+ran_x;
	yTo = yTo+ran_y;
}

xTo = clamp(xTo, 1000, room_width-1000);	
yTo = clamp(yTo, 570, room_height-500);	


var vm = matrix_build_lookat(x, y,-10, x, y, 0,0,1,0);
camera_set_view_mat(camera, vm);



}
