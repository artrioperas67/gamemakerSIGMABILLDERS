if (is_dead) exit;
instance_destroy(other)

if (!is_dead && !invincible) {
    hp -= 3; // dano de 3

    if (hp <= 0) {
        is_dead = true;
		global.jogador_morrendo = true;
		sprite_index = spr_auro_morrendo;
		image_index = 0;
		image_speed = 0.3;
    } else {
        invincible = true;
        inv_timer = 60;
        blink_timer = 0;
    }
}