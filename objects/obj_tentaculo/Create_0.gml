// Se nasceu na esquerda (444), vai pra direita
if (x <= 444) {
    dir = 1;
    image_xscale = 1;  // normal
    x_alvo = x + 10;  // até onde ele avança
}
// Se nasceu na direita (1215), vai pra esquerda
else {
    dir = -1;
    image_xscale = -1; // espelha sprite
    x_alvo = x - 10;  // até onde ele avança
}

vel = 2;         // velocidade do avanço/retorno
avancando = true;
timer = 0;
tempo_parado = 50; // tempo que fica "estendido" antes de voltar
voltando = false;
