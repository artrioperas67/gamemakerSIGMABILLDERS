// ---- AVANÇANDO PARA O CENTRO ----
if (avancando) {
    x += vel * dir;
    if ((dir == 1 && x >= x_alvo) || (dir == -1 && x <= x_alvo)) {
        x = x_alvo;
        avancando = false;
    }
}

// ---- SEGURA NO LUGAR UM TEMPO ----
if (!avancando && !voltando) {
    timer++;
    if (timer >= tempo_parado) {
        voltando = true;
    }
}

// ---- VOLTANDO PARA A PAREDE ----
if (voltando) {
    x -= vel * dir;
    if ((dir == 1 && x <= 444) || (dir == -1 && x >= 1215)) {
        instance_destroy();
    }
}
