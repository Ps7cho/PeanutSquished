/// @description 

move_speed = 600;
dir = 0;

//Game Variables
alarm[0] = 60;
shooting = false;
bulletSpeed = 4000;
hp = 300;
maxHealth = hp;
creator = id;
dmgModifier = 1;
attack_cooldown = 20;
team = -1;

movement_inputs[0] = ord("D");
movement_inputs[1] = ord("W");
movement_inputs[2] = ord("A");
movement_inputs[3] = ord("S");

shootingParticle = part_type_create();