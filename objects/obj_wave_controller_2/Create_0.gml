wave = 1;
max_waves = 5;
wave_ativa = false;
inimigos_spawnados = 0;

// --- TEMPO ENTRE WAVES ---
tempo_wave = 0;
intervalo_wave = room_speed * 2.5; // 5 segundos entre waves

// --- QUANTIDADE DE INIMIGOS POR WAVE ---
kamikks_por_wave = [1, 1, 1, 1, 1];
bebabs_por_wave = [0, 0, 0, 0, 0];

// --- LIMITES DE SPAWN ---
left_spawn = 444;
right_spawn = 1215;
top_spawn = -100;

// --- CHEFE ---
boss_spawned = false;
boss_delay_timer = 0;
boss_delay_max = room_speed * 4; // 7 segundos depois da última wave

// --- FLAGS GLOBAIS ---
global.congelado = false;          // pausa geral