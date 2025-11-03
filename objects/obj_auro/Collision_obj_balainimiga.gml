

if (is_dead) {
    if (instance_exists(other)) with (other) instance_destroy();
    exit;
}

if (!invincible) {
    hp -= 1;
    hp = max(hp, 0);
    if (instance_exists(other)) with (other) instance_destroy();

    if (hp <= 0) {

        is_dead = true;
        invincible = false;
        sprite_index = sprite_explosion;
        image_speed = 1200;
        image_index = 0;
        exit;
    }

    invincible = true;
    inv_timer = 60; 
    blink_timer = 0;
    visible_for_blink = true;
}
else {
    if (instance_exists(other)) with (other) instance_destroy();
}
