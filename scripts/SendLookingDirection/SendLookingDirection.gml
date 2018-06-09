///SendLookingDirection();

buffer_seek(objClient.buffer, buffer_seek_start, 0);
buffer_write(objClient.buffer, buffer_u8, networkEvents.lookingDirection); //message ID
buffer_write(objClient.buffer, buffer_u8, image_index); //player direction
network_send_packet(objClient.socket, objClient.buffer, buffer_tell(objClient.buffer));