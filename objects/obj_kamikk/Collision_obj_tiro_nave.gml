if (is_dead) exit;

hp -= 1;
instance_destroy(other); // destrói a bala

if (hp <= 0) {
    is_dead = true;
    destruir();
    instance_destroy();
}
