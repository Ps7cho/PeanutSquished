/// @description Insert description here
// You can write your code in this editor
backgroundSystem = part_system_create();
part_system_depth(backgroundSystem, 0);

var darkBrownColor = make_color_rgb(125, 76, 58);
var lightBrownColor = make_color_rgb(181, 118, 87);
	
// Particle
basicShot = part_type_create();
part_type_shape(basicShot, pt_shape_disk);
part_type_scale(basicShot, 1, 1);
part_type_size(basicShot, 0.1, 0.3, -0.005, 0);
part_type_color2(basicShot, darkBrownColor, lightBrownColor);
part_type_alpha2(basicShot, 0.75, 0.25);
part_type_speed(basicShot, room_speed / 2, room_speed, 0, 0);
part_type_gravity(basicShot, 0.02, 0);
part_type_life(basicShot, 1, 10);

backgroundEmitter = part_emitter_create(objParticleSystems.backgroundSystem);