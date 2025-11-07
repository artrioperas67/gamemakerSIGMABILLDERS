y += vspd;

// Destroi se sair da tela
if (y > room_height + sprite_height) {
    instance_destroy();
    exit;
}

// Garante que o jogador existe
if (!instance_exists(obj_auro)) exit;

// --- Colisão apenas com o jogador ---
if (place_meeting(x, y, obj_auro)) {
    var alvo = instance_place(x, y, obj_auro);
    if (alvo != noone) {
        with (alvo) {
            poder_atual = clamp(poder_atual + 10, 0, poder_max);
        }
        instance_destroy();
    }
}
