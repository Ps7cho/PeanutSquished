/// @description Insert description here
// You can write your code in this editor

var gunOffset = 32;
switch image_index {
	case 0:
		draw_self();
		draw_sprite(sprBasicGun, image_index, x - gunOffset, y);
		break;
	case 1:
		draw_self();
		draw_sprite(sprBasicGun, image_index, x - gunOffset / 2, y + gunOffset / 2);
		break;
	case 2:
		draw_self();
		draw_sprite(sprBasicGun, image_index, x, y + gunOffset / 2);
		break;
	case 3:
		draw_self();
		draw_sprite(sprBasicGun, image_index, x + gunOffset / 2, y + gunOffset / 2);
		break;
	case 4:
		draw_sprite(sprBasicGun, image_index, x + gunOffset, y);
		draw_self();
		break;
	case 5:
		draw_sprite(sprBasicGun, image_index, x, y - gunOffset / 2);
		draw_self();
		break;
	case 6:
		draw_sprite(sprBasicGun, image_index, x, y);
		draw_self();
		break;
	case 7:
		draw_sprite(sprBasicGun, image_index, x - gunOffset / 2, y - gunOffset / 2);
		draw_self();
		break;
}