// Movimento e estados
spd = 4;
is_dead = false;
state = "descendo";
stop_y = irandom_range(150, 400); // ponto onde ele para dentro da área

// HP e chance de drop
hp = 5;
drop_chance = 0.5;

// Disparo
fire_rate = room_speed * 2;
fire_timer = fire_rate;

// Área jogável
left_bound = 435;
right_bound = 1205;
top_bound = 0;
bottom_bound = 1492;

// Garante que nasça dentro da área horizontal e acima do topo
x = clamp(x, left_bound, right_bound);
y = top_bound - 100; // sempre começa um pouco acima da tela