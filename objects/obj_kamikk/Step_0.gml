if (global.congelado || is_dead) exit;

// Limites horizontais
var half_w = sprite_get_width(sprite_index) * 0.5;
x = clamp(x, left_bound + half_w, right_bound - half_w);

// Verifica se o jogador existe
if (!instance_exists(obj_nave)) exit;

// Movimento em direção ao jogador
var alvo_x = obj_nave.x;
var alvo_y = obj_nave.y;
var dir = point_direction(x, y, alvo_x, alvo_y);
var dist = point_distance(x, y, alvo_x, alvo_y);

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// Se o jogador estiver morrendo, para tudo
if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
    fire_rate = 0;
    exit;
}

// Colisão com o jogador
if (place_meeting(x, y, obj_nave)) {
    var alvo = instance_place(x, y, obj_nave);
    if (alvo != noone && !alvo.is_dead && !alvo.invincible) {
        alvo.hp -= 1;
        alvo.invincible = true;
        alvo.inv_timer = room_speed;
        alvo.blink_timer = 0;

        if (alvo.hp <= 0) {
            alvo.is_dead = true;
            global.jogador_morrendo = true;
            alvo.sprite_index = spr_nave_explosao;
            alvo.image_index = 0;
            alvo.image_speed = 0.3;
        }

        destruir();
        instance_destroy();
    }
}
