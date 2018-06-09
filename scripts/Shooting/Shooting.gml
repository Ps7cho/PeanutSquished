

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
		move_towards_point(mousex, mousey, move_speed_this_frame);
	}
	alarm[0] = attack_cooldown;
}

