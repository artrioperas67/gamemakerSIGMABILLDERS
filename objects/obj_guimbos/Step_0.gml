// Se ainda não entrou na tela, desce e mantém o jogo congelado
if (!entrou) {
    global.congelado = true; // congela enquanto entra
    y += vel_descida;

    if (y >= alvo_y) {
        y = alvo_y;
        entrou = true;
        global.congelado = false; // libera o jogo quando chega
    }
    exit; // não faz mais nada até terminar de entrar
}

// Depois que entrou, atira normalmente
fire_timer--;
if (fire_timer <= 0) {
    fire_timer = fire_rate;
    instance_create_layer(x, y, "Instances", obj_tiro_guimbos);
}