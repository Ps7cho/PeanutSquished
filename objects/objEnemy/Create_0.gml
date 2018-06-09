/// @description Inherit create

name = "";
CharacterID = -1;
Team = -1;

Health = 100;
unitMaxHealth = Health;

move_speed = 600;

movement_inputs[0] = 0;
movement_inputs[1] = 0;
movement_inputs[2] = 0;
movement_inputs[3] = 0;

while !place_empty(x,y){
x++;
y++;
}

