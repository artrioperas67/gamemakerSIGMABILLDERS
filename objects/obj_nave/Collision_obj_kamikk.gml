if (!is_dead && !invincible) {
    hp -= 1;
    invincible = true;
    inv_timer = 60;
    blink_timer = 0;

    if (hp <= 0) {
        is_dead = true;
        sprite_index = spr_nave_explosao;
        image_index = 0;
        image_speed = 0.3;
    }
}
instance_destroy(other)