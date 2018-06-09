var rel_y = y - mouse_y
var rel_x = mouse_x - x
    
if rel_y > 2 * rel_x {
    if rel_y > rel_x / -2 {
        if rel_y > -2 * rel_x {
			image_index = 4;
        } else {
            image_index = 5;
        }
    } else {
        if rel_y > rel_x / 2 {
            image_index = 6;
        } else {
            image_index = 7;
        }
    }
} else {
    if rel_y < rel_x / -2 {
        if rel_y < -2 * rel_x {
            image_index = 0;
        } else {
            image_index = 1;
        }
    } else {
        if rel_y < rel_x / 2 {
            image_index = 2;
        } else {
            image_index = 3;
        }
    }
}