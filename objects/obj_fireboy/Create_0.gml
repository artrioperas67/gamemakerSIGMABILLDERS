// velocidade de movimento lateral
spd = 1; 
hp = 3;

// direção inicial (1 = direita, -1 = esquerda)
dir = choose(1, -1); 

// até onde ele pode ir na tela
left_bound = 444;
right_bound = 1215;

fall_speed = 6;

// ele começa caindo
caindo = true;
alvo_y = 150;
vel_descida = 0.02;
entrou = false;

fire_delay = 120; 
fire_timer = fire_delay;
left_bound = 444;  // limite esquerdo do mapa
right_bound = 1215; // limite direito do mapa