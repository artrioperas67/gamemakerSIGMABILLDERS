// ===== ENTRADA =====
alvo_y = 300;
vel_descida = 1;
entrou = false;

global.congelado = true;
global.krankus_morto = false
// ===== STATUS =====
hp = 2;
hp_max = hp;
morreu = false;
tempo_pos_morte = -1; // mesmo sistema do boss 1

// ===== MOVEMENT STATES =====
estado = "grande";
timer_estado = 0;
tempo_grande = room_speed * 4;
tempo_pequeno = room_speed * 3;
tempo_wave = room_speed * 6;

// ===== ATAQUES =====
onda_ativa = false;
onda = noone;

// ==== LIMITES DA ARENA ====
lim_esq = 444;
lim_dir = 1215;
lim_top = 100;
lim_bot = room_height - 100;
