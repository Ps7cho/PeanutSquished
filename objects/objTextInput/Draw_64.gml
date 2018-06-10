/// @description Insert description here
// You can write your code in this editor

var xDrawPosition = room_width / 2;
var yDrawPosition = room_height / 4 * 3;

draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(xDrawPosition, yDrawPosition, "Enter name: ");


draw_set_color(c_gray);
var nameFieldHeight = string_height(text);
var nameFieldWidth = 400;
draw_rectangle(
	xDrawPosition - nameFieldWidth / 2 - 10, 
	yDrawPosition + 30 - 5, 
	xDrawPosition + nameFieldWidth / 2 + 10,
	yDrawPosition + 30 + nameFieldHeight + 5,
	false);
	
draw_set_color(c_white);
draw_text(xDrawPosition, yDrawPosition + 30, text);

if error != noone {
	draw_set_color(c_red);
	draw_text(xDrawPosition, yDrawPosition + 60, error);
}

draw_set_color(c_white);