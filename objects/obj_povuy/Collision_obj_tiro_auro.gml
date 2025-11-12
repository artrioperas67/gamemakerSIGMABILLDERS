if (is_dead) exit;

// Dano
hp -= other.damage;
instance_destroy(other); // só uma vez

// Morre se HP acabar
if (hp <= 0) {
    is_dead = true;
    instance_destroy(); // destrói o próprio obj_povuy
}
