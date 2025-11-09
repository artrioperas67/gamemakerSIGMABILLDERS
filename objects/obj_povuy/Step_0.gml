if (is_dead) exit;

// Movimento de descida até o ponto escolhido
if (state == "descendo") {
    y += spd;

    if (y >= stop_y) {
        y = stop_y;
        state = "atacando";
    }
}

// Atira quando está atacando
if (state == "atacando") {
    fire_timer--;

    if (fire_timer <= 0) {
        fire_timer = fire_rate;

        // 8 direções (horizontal, vertical, diagonais)
        for (var dir = 0; dir < 360; dir += 45) {
            var b = instance_create_layer(x, y, "Instances", obj_balapovuy);
            b.direction = dir;
            b.speed = 6;
        }
    }
}

// Mantém dentro da área jogável
x = clamp(x, left_bound, right_bound);
y = clamp(y, top_bound, bottom_bound);