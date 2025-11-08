// Se o jogo congelar OU boss estiver congelando, a bala morre
if (global.congelado) {
    instance_destroy();
    exit;
}

// Se o jogador morreu, não fica bala bugada na tela
if (global.jogador_morrendo) {
    instance_destroy();
    exit;
}

// Sai da tela → destrói
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}