if (!is_dead && !invincible) {
    hp -= 1;

    if (hp <= 0) {
        is_dead = true;
        sprite_index = spr_auro_morrendo;
        image_speed = 0.4;
        image_alpha = 1;
        invincible = false;
    } else {
        invincible = true;
        inv_timer = 60;
        blink_timer = 0;
    }
}
