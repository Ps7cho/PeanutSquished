/// @description Insert description here
// You can write your code in this editor

counter++;
if (counter mod 10 == 0) {
	part_emitter_region(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, x - 5, x + 5, y - 5, y + 5, 1, 1);
	part_emitter_burst(objParticleSystems.backgroundSystem, objParticleSystems.backgroundEmitter, partBlackHole, 400);
} else if counter > 20 {
	instance_destroy()	
}
