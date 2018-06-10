/// @description 

global.seconds_passed = delta_time/1000000;

SendInputs();

//stop shooting
if mouse_check_button_released(mb_left){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.shoot); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
		shooting = false;
}
	
if mouse_check_button_pressed(mb_left){ //Shooting!
		shooting = true;
		alarm[1] = 1;
}

if keyboard_key_press("0"){
	debug = !debug;	
}