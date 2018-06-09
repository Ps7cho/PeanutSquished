/// @description 

var inst = instance_place(x,y, bullet_collisions);
if inst = noone return;
if team == inst.team {
	return
}else{
inst.hp -= damage;
instance_destroy();
}
