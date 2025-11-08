vspeed += gravidade;

// Limita velocidade vertical
vspeed = clamp(vspeed, -velocidade_max, velocidade_max);

// Oscilação horizontal leve
hspeed += random_range(-0.05, 0.05);

// Limita movimento lateral
hspeed = clamp(hspeed, -limite_horizontal, limite_horizontal);

// Atualiza posição
x += hspeed;
y += vspeed;

// Faz girar como meteoro
image_angle += 5;

// Detecta chão via código
if (y >= chao_y) {
    // Garante que pare exatamente no chão
    y = chao_y;

    // Destroi o meteoro
    instance_destroy();
}

// Se sair da tela (caso falhe o chão)
if (y > room_height + 100) {
    instance_destroy();
}