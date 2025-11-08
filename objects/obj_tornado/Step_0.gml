y += vspd;

// Destroi se sair da área
if (y > bottom_bound) {
    instance_destroy();
}

// Timer de vida
vida_timer--;
if (vida_timer <= 0) instance_destroy();

// Colisão com inimigos
with (obj_birdboy) {
    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, other, false, false)) {
        hp -= other.dano;
        if (hp <= 0) {
            instance_destroy();
            // o jogador ganha poder ao matar inimigo
            with (obj_auro) {
                poder_atual = clamp(poder_atual + 20, 0, poder_max);
            }
        }
    }
}