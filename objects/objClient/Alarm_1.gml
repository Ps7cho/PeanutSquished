/// @description Shoot!

if (shooting == true){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.shoot); //message ID
		buffer_write(buffer, buffer_bool, 1); //True
		buffer_write(buffer, buffer_u16, mouse_x);
		buffer_write(buffer, buffer_u16, mouse_y);
		network_send_packet(socket, buffer, buffer_tell(buffer));
}

alarm[1] = 3;
