if (global.congelado) {
    speed = 0;
    exit;
}
if (!entrou) {
    y = lerp(y, alvo_y, vel_descida);

    if (abs(y - alvo_y) < 1) {
        y = alvo_y;
        entrou = true;
    }

    exit; // não faz mais nada até terminar a entrada
}

// === MOVIMENTO LATERAL (Direita ↔ Esquerda) ===
x += spd * dir;

x += 1 * dir; // velocidade do andar dele
if (x < left_bound || x > right_bound) {
    dir *= -1;
}

fire_timer--;
if (fire_timer <= 0) {
    fire_timer = fire_delay;

    var t = instance_create_layer(x, y, "Instances", obj_ultimatefireball);
    t.direction = 270;  // 270 = para baixo
    t.speed = 6;        // velocidade fixa
}

if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
	fire_delay = 0;
	vel_descida = 0;
	dir = 0;
	fall_speed = 0;
	caindo = false;
    exit;
}