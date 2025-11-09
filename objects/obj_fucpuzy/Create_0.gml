alvo_y = 200;
vel_descida = 0.6;
entrou = false;

global.congelado = true;
global.boss_congelando = true;

morreu = false;
hp = 200;
hp_max = hp;
tempo_pos_morte = -1;

estado = "normal";
timer_estado = 0;
intervalo_estado = room_speed * 10;

fire_timer = 0;
fire_rate_normal = 40;
fire_rate_rajada = 5;
rajada_duracao = room_speed * 2.5;
rajada_ativa = false;
rajada_timer = 0;

ataque_executado = false;
fila_kamikks = [];
indice_kamikks = 0;
timer_kamikks = 0;
intervalo_kamikks = room_speed * 1.5;

tipo_ataque = ""; // "kamikks" ou "laser"
