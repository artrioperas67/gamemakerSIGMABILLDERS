spd = 4;
alvo_y = irandom_range(200, 600); // altura onde ele para
parado = false;

// Status
hp = 4;
is_dead = false;
damage = 1
// Chance de drop (0 a 1)
drop_chance = random_range(0.3, 0.7);

// Área jogável
left_bound = 435;
right_bound = 1205;
top_bound = 0;
bottom_bound = 1492;

// Tiro
fire_rate = room_speed * 2.5; // a cada 2,5s
fire_timer = fire_rate;
