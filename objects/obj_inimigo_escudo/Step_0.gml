timer_descida++;

if (timer_descida >= intervalo_descida) {
    y += velocidade;
    timer_descida = 0;
}

if (y >= altura_limite) {
    y = altura_limite;
}