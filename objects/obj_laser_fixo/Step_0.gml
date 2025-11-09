tempo_ativo--;

if (tempo_ativo <= 0) {
    instance_destroy();
}

// Dano ao jogador
if (instance_exists(obj_nave)) {
    if (collision_rectangle(x - 50, 0, x + 50, room_height, obj_nave, false, true)) {
        with (obj_nave) {
            if (!is_dead && !invincible) {
                hp -= 1;
                invincible = true;
                inv_timer = room_speed;
                blink_timer = 0;

                if (hp <= 0) {
                    is_dead = true;
                    global.jogador_morrendo = true;
                    sprite_index = spr_nave_explosao;
                    image_index = 0;
                    image_speed = 0.3;
                }
            }
        }
    }
}