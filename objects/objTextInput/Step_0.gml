/// @description Insert description here
// You can write your code in this editor
text = keyboard_string;

var textLength = string_length(text);

if keyboard_check_pressed(vk_enter) {
	
	if textLength > 0 {
		error = noone;
		var roomIndex = room_next(room);
		if roomIndex != -1 {

			room_goto_next();
		
			var client = room_instance_add(roomIndex, 0, 0, objClient);
			with client {
				self.playerName = text;
			}
		}
	} else {
		error = "Name is required"
	}
}