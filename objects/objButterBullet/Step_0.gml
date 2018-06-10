/// @description 

var inst = instance_place(x,y, bullet_collisions);
if inst = noone return;
if inst == ID return;

partSplat = part_type_create();
part_type_shape(partSplat, pt_shape_disk);
part_type_size(partSplat, 0.1, 0.3, -0.01, 0);
part_type_color1(partSplat, make_color_rgb(109, 83, 61));
part_type_alpha2(partSplat, 0.8, 0.2);
part_type_speed(partSplat, 1, 3, 0, 0);
part_type_direction(partSplat, 0, 359, 0, 0);
part_type_gravity(partSplat, 0.3, 270);
part_type_blend(partSplat, 1);
part_type_life(partSplat, 15, 30);

part_emitter_region(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, x - 5, x + 5, y - 5, y + 5, 1, 1);
part_emitter_burst(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, partSplat, 20);

instance_destroy();

