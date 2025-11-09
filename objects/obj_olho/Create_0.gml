spd = 6;
dir_x = choose(-1, 1);
dir_y = choose(-1, 1);

// Vida e estado
hp = 2;
is_dead = false;

// Área jogável
left_bound = 435;
right_bound = 1205;
top_bound = 0;
bottom_bound = 1492;

// Chance de dropar energia
drop_chance = 0.25;

// Ataque
fire_rate = room_speed * 2; // atira a cada 2 segundos
fire_timer = fire_rate;
shoot_distance = 150; // se o jogador estiver mais próximo que isso, não atira