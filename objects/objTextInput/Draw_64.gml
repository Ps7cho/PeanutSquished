/// @description Insert description here
// You can write your code in this editor

var xDrawPosition = room_width / 2;
var yDrawPosition = room_height / 4 * 3;

draw_set_halign(fa_center);
draw_text(xDrawPosition, yDrawPosition, "Enter name: ");
draw_text(xDrawPosition, yDrawPosition + 30, keyboard_string);

if error != noone {
	draw_set_color(c_red);
	draw_text(xDrawPosition, yDrawPosition + 60, error);
}

draw_set_color(c_white);