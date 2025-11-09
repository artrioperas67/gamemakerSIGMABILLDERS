wave = 1;
max_waves = 5;
wave_ativa = true; // começa imediatamente
inimigos_spawnados = 0;

tempo_wave = 0;
intervalo_wave = room_speed * 5; // tempo entre waves

left_bound = 435;
right_bound = 1205;
top_bound = 0;
bottom_bound = 1492;

boss_spawned = false;
boss_delay_timer = 0;
boss_delay_max = room_speed * 6;

global.congelado = false;

// quantidade de inimigos por wave
povuys_por_wave = [1, 2, 3, 4, 5];
olhos_por_wave  = [0, 1, 2, 3, 4];