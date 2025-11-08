/// CONFIGURAÇÕES DAS WAVES ---------------------------------

wave = 1;            // onde começa
max_waves = 5;        // quantidade total de waves antes do boss

// CONFIG DAS WAVES (QUANTIDADE DE INIMIGOS)
birdboys_por_wave = [5, 7, 5, 5, 5];
fireboys_por_wave = [0, 0, 2, 3, 3];

// CONFIG DE TEMPO ENTRE WAVES
intervalo_wave = room_speed * 7; // <<< tempo entre waves (ajustável)

prox_wave_timer = 0;
delay_prox_wave = room_speed * 2;

global.boss_congelando = false;
wave_ativa = false;
inimigos_spawnados = 0;

boss_spawned = false;
boss_delay_timer = 7;
boss_delay_max = room_speed * 10;

tempo_wave = 0;

// ÁREAS DE SPAWN
left_spawn  = 444;
right_spawn = 1215;
top_spawn   = -100;

global.tutorial_finished = false;
global.congelado = false;
