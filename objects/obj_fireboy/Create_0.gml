sprite_index = spr_fireboy;
image_speed = 0.5;

// Movimento inicial
vspd = irandom_range(8, 14);  // velocidade inicial de queda
hspd = irandom_range(-2, 2);  // leve desvio lateral
gravidade = 0.25;             // aceleração de queda

// Área jogável
left_bound   = 91;
right_bound  = 874;
top_bound    = 6;
bottom_bound = 1493;

// Status
hp = 1;          // caso queira dar vida pra ele
is_dead = false; // usado pra evitar múltiplas destruições