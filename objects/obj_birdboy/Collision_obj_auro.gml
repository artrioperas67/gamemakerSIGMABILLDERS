hp -= 1;
instance_destroy(other);

if (hp <= 0 && !is_dead) {
    is_dead = true;
    image_speed = 0.3;
}