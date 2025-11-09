if (is_dead) exit;

hp -= other.damage;

if (hp <= 0) {
    is_dead = true;

    // Drop de energia (50%)
    if (random_range(0, 1) < drop_chance) {
        instance_create_layer(x, y, "Instances", obj_energia);
    }

    instance_destroy();
}

with (other) instance_destroy();