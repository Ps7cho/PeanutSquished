/// ShootParticle(xx,yy);
var xx = argument0;
var yy = argument1;

	var particleDirection = point_direction(x, y, xx, yy);
	var particleVariation = 20;
	
	var darkBrownColor = make_color_rgb(125, 76, 58);
	var lightBrownColor = make_color_rgb(181, 118, 87);
	
	part_type_shape(shootingParticle, pt_shape_disk);
	part_type_scale(shootingParticle, 1, 1);
	part_type_size(shootingParticle, 0.1, 0.3, -0.005, 0);
	part_type_color2(shootingParticle, darkBrownColor, lightBrownColor);
	part_type_alpha2(shootingParticle, 0.75, 0.25);
	part_type_speed(shootingParticle, room_speed / 2, room_speed, 0, 0);
	part_type_direction(shootingParticle, particleDirection - particleVariation, particleDirection + particleVariation, 0, 0);
	part_type_gravity(shootingParticle, 0.02, 0);
	part_type_life(shootingParticle, 1, 10);
	
	part_emitter_region(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, x - 5, x + 5, y - 5, y + 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, shootingParticle, 10);
	