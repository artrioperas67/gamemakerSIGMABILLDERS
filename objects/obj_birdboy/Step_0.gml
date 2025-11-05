if (is_dead) exit;

// Garante que o jogador existe
if (!instance_exists(obj_auro)) exit;

// Direção até o jogador
var dir = point_direction(x, y, obj_auro.x, obj_auro.y);
var dist = point_distance(x, y, obj_auro.x, obj_auro.y);

// Movimenta em direção ao jogador (mas para se estiver muito perto)
if (dist > 100) {
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
}

// Atira periodicamente
fire_timer--;
if (fire_timer <= 0) {
    fire_timer = fire_rate;
    instance_create_layer(x, y, "Instances", obj_balainimiga);
}
