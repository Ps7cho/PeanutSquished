/// @description Insert description here
// You can write your code in this editor
counter = 0;

// Particle
partBlackHole = part_type_create();
part_type_shape(partBlackHole, pt_shape_disk);
part_type_size(partBlackHole, 0.2, 0.4, -0.01, 0);
part_type_color1(partBlackHole, c_black);
part_type_speed(partBlackHole, 3, 5, 0, 0);
part_type_direction(partBlackHole, 0, 359, 0, 0);
part_type_life(partBlackHole, 15, 30);
