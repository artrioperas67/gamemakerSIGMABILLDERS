if (is_dead) exit;

// Dano seguro
if (variable_instance_exists(other, "damage")) {
    hp -= other.damage;
} else {
    hp -= 1;
}

// Destrói o objeto que colidiu
instance_destroy(other);

// Verifica morte
if (hp <= 0) {
    is_dead = true;
}