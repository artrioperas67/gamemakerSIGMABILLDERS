if (global.congelado) exit;

if (is_dead) exit;

var half_w = sprite_get_width(sprite_index) * 0.5;
var half_h = sprite_get_height(sprite_index) * 0.5;

x = clamp(x, left_bound + half_w, right_bound - half_w);

if (!instance_exists(obj_nave)) exit;

// Direção até o jogador
var dir = point_direction(x, y, obj_nave.x, obj_nave.y);
var dist = point_distance(x, y, obj_nave.x, obj_nave.y);

if (dist > 100) {
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
}

if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
	fire_rate = 0;
    exit;
}

