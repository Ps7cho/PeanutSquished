

if (mouse_check_button(mb_left)) && (shooting = false)
{
var damage_modifier = dmgModifier;
var teams = team;
var mousex = mouse_x;
var mousey = mouse_y;
var move_speed_this_frame = bulletSpeed*global.seconds_passed;


	//state = state_bar.attack;
	shooting = true;
	bullet = instance_create_layer(x, y, "Instances", objButterBullet);
	
	with bullet {
		damage = (damage*damage_modifier);
		team = teams;
		travelDirection = point_direction(x, y, mousex, mousey);
		move_towards_point(mousex, mousey, move_speed_this_frame);
	}


	
	// Particle
	var particleDirection = point_direction(x, y, mouse_x, mouse_y);
	var particleVariation = 20;
	
	var darkBrownColor = make_color_rgb(173, 132, 71);
	var lightBrownColor = make_color_rgb(219, 204, 182);

	
	var darkGrayColor = make_color_rgb(201, 201, 201);
	var lightGrayColor = make_color_rgb(245, 245, 245);
	
	smokeParticle = part_type_create();
	part_type_shape(smokeParticle, pt_shape_smoke);
	part_type_scale(smokeParticle, 1, 1);
	part_type_size(smokeParticle, 0.1, 0.3, -0.005, 0);
	part_type_color2(smokeParticle, lightGrayColor, darkGrayColor);
	part_type_alpha2(smokeParticle, 1, 0.75);
	part_type_speed(smokeParticle, 0.25, 0.5, 0, 0);
	part_type_direction(smokeParticle, 75, 105, 0, 10);
	part_type_gravity(smokeParticle, 0.02, 90);
	part_type_life(smokeParticle, room_speed * 2, room_speed * 6);
	part_type_blend(smokeParticle, 1);


	var gunOffset = 32;
	var smokeOffset = 10;
	var smokeEmitterOffsetX = x;
	var smokeEmitterOffsetY = y;
	switch image_index {
		case 0:
			smokeEmitterOffsetX = x - gunOffset;
			smokeEmitterOffsetY = y - smokeOffset;
			break;
		case 1:
			smokeEmitterOffsetX = x - gunOffset / 2 - smokeOffset;
			smokeEmitterOffsetY = y + gunOffset / 2 - smokeOffset;
			break;
		case 2:
			smokeEmitterOffsetX = x - smokeOffset;
			smokeEmitterOffsetY = y + gunOffset / 2;
			break;
		case 3:
			smokeEmitterOffsetX = x + gunOffset / 2 - smokeOffset;
			smokeEmitterOffsetY = y + gunOffset / 2 + smokeOffset;
			break;
		case 4:
			smokeEmitterOffsetX = x + gunOffset;
			smokeEmitterOffsetY = y + smokeOffset;
			break;
		case 5:
			smokeEmitterOffsetX = x + smokeOffset;
			smokeEmitterOffsetY = y - gunOffset / 2 + smokeOffset;
			break;
		case 6:
			smokeEmitterOffsetX = x + smokeOffset;
			break;
		case 7:
			smokeEmitterOffsetX = x - gunOffset / 2 + smokeOffset;
			smokeEmitterOffsetY = y - gunOffset / 2 - smokeOffset;
			break;
	}
	/*
	part_type_shape(shootingParticle, pt_shape_disk);
	part_type_scale(shootingParticle, 1, 1);
	part_type_size(shootingParticle, 0.1, 0.3, -0.005, 0);
	part_type_color2(shootingParticle, darkBrownColor, lightBrownColor);
	part_type_alpha2(shootingParticle, 0.75, 0.25);
	part_type_speed(shootingParticle, room_speed / 2, room_speed, 0, 0);
	part_type_direction(shootingParticle, particleDirection - particleVariation, particleDirection + particleVariation, 0, 0);
	part_type_gravity(shootingParticle, 0.02, 0);
	part_type_life(shootingParticle, 1, 10);
	*/

	// Particle
	blastParticle = part_type_create();
	part_type_shape(blastParticle, pt_shape_flare);
	part_type_scale(blastParticle, 1, 1);
	part_type_size(blastParticle, 0.2, 0.5, -0.005, 0);
	part_type_color2(blastParticle, darkBrownColor, lightBrownColor);
	part_type_alpha2(blastParticle, 1, 0.75);
	part_type_speed(blastParticle, room_speed / 2, room_speed, 0, 0);
	part_type_direction(blastParticle, particleDirection - particleVariation, particleDirection + particleVariation, 0, 0);
	part_type_gravity(blastParticle, 0.02, 0);
	part_type_life(blastParticle, 1, 10);
	
	
	var blastOffset = 10;
	var blastEmitterOffsetX = x;
	var blastEmitterOffsetY = y;
	switch image_index {
		case 0:
			blastEmitterOffsetX = x - gunOffset;
			blastEmitterOffsetY = y + blastOffset;
			break;
		case 1:
			blastEmitterOffsetX = x - gunOffset / 2 + blastOffset;
			blastEmitterOffsetY = y + gunOffset / 2 + blastOffset;
			break;
		case 2:
			blastEmitterOffsetX = x + blastOffset;
			blastEmitterOffsetY = y + gunOffset / 2;
			break;
		case 3:
			blastEmitterOffsetX = x + gunOffset / 2 + blastOffset;
			blastEmitterOffsetY = y + gunOffset / 2 - blastOffset;
			break;
		case 4:
			blastEmitterOffsetX = x + gunOffset;
			blastEmitterOffsetY = y - blastOffset;
			break;
		case 5:
			blastEmitterOffsetX = x - blastOffset;
			blastEmitterOffsetY = y - gunOffset / 2 - blastOffset;
			break;
		case 6:
			blastEmitterOffsetX = x - blastOffset;
			break;
		case 7:
			blastEmitterOffsetX = x - gunOffset / 2 - blastOffset;
			blastEmitterOffsetY = y - gunOffset / 2 + blastOffset;
			break;
	}
	
	
	part_emitter_region(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, blastEmitterOffsetX - 5, blastEmitterOffsetX + 5, blastEmitterOffsetY - 5, blastEmitterOffsetY + 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, blastParticle, 10);
	
	
	part_emitter_region(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, smokeEmitterOffsetX - 10, smokeEmitterOffsetX + 10, smokeEmitterOffsetY - 5, smokeEmitterOffsetY + 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, smokeParticle, 10);
	

	alarm[0] = attack_cooldown;
}

