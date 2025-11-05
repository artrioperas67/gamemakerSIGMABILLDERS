// Movimento
spd = 3;

// Ataque
fire_rate = 60; // a cada 60 frames (1 segundo)
fire_timer = irandom_range(0, fire_rate); // aleatório para não atirar tudo junto

// Vida
hp = 3;

// Sprite inicial
sprite_index = spr_birdboy;
image_speed = 1;

// Status
is_dead = false;
