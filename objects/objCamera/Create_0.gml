/// @description 

follow = objBread;

xTo = x;
yTo = y;

camera = camera_create();


var vm = matrix_build_lookat(x, y,-10, x, y, 0, 0, 1,0);
var pm = matrix_build_projection_ortho(1920, 1080, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;


view_w = camera_get_view_width(camera);
view_h = camera_get_view_height(camera);
