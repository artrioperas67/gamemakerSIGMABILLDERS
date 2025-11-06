if (falling) {
    y += 4; // ou qualquer valor que você quiser
    if (y >= 350) { // ponto onde ele deve parar
        falling = false;
    }
}

if (y < alvo_y) {
    y += 1; // velocidade de descida
} else {
    global.congelado = false; // libera o jogo quando o boss termina de descer
}

if (y < alvo_y) {
    y += 2; // velocidade de descida
} else {
    global.congelado = false; // libera o jogo quando o boss termina de descer
}

y = lerp(y, alvo_y, 0.05); // suaviza a descida
if (abs(y - alvo_y) < 1) {
    y = alvo_y;
    global.congelado = false;
}

// Direção até o jogador
var dir = point_direction(x, y, obj_auro.x, obj_auro.y);
var dist = point_distance(x, y, obj_auro.x, obj_auro.y);

// Atira periodicamente
fire_timer--;
if (fire_timer <= 0) {
    fire_timer = fire_rate;
    instance_create_layer(x, y, "Instances", obj_tiro_guimbos);
}
