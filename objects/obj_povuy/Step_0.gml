
if (is_dead) exit;

// Movimento: desce até a altura alvo
if (!parado) {
    y += spd;
    if (y >= alvo_y) {
        y = alvo_y;
        parado = true;
    }
} 

// Atira quando parado
if (parado) {
    fire_timer--;
    if (fire_timer <= 0) {

        // Cria balas nas 8 direções
        var dirs = [0, 45, 90, 135, 180, 225, 270, 315];
        for (var i = 0; i < array_length(dirs); i++) {
            var b = instance_create_layer(x, y, "Instances", obj_balapovuy);
            b.direction = dirs[i];
            b.speed = 6;
            b.left_bound = left_bound;
            b.right_bound = right_bound;
            b.top_bound = top_bound;
            b.bottom_bound = bottom_bound;
        }

        fire_timer = fire_rate;
    }
}

// Mantém o Povuy dentro da área jogável
var half_w = sprite_width * 0.5;
var half_h = sprite_height * 0.5;
x = clamp(x, left_bound + half_w, right_bound - half_w);
y = clamp(y, top_bound + half_h, bottom_bound - half_h);
