if (is_dead) exit;

with (other) {
    if (!is_dead && !invincible) {
        hp -= 1;

        if (hp <= 0) {
            is_dead = true;
            global.jogador_morrendo = true;
            sprite_index = spr_nave_explosao;
            image_index = 0;
            image_speed = 0.3;
        } else {
            invincible = true;
            inv_timer = 60;
            blink_timer = 0;
        }
    }
}

destruir();
instance_destroy();
