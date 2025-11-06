wave = 1;
max_waves = 5;
boss_spawned = false;

tempo_wave = 0;
intervalo_wave = room_speed * 5; // tempo de espera entre waves (5 segundos)

inimigos_por_wave = 5;
inimigos_spawnados = 0;
wave_ativa = false;

left_spawn = 444;
right_spawn = 1215;
top_spawn = -100;

global.congelado = false

boss_delay_timer = 0;
boss_delay_max = room_speed * 7; // 3 segundos de espera (room_speed = 60 → 180 frames)
