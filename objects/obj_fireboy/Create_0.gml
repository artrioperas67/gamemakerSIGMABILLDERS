vspeed = random_range(2, 5);
hspeed = random_range(-1.5, 1.5);

// Gravidade
gravidade = 0.25;

// Rotação inicial
image_angle = random(360);

// Limites
velocidade_max = 10;  // velocidade vertical máxima
limite_horizontal = 2; // limite de movimento lateral

// Posição do "chão"
chao_y = room_height - 64; // altura do chão (ajuste conforme sua room)