if (global.congelado) exit;

// ⏳ Espera todos morrerem pra contar tempo da próxima wave
if (!instance_exists(obj_kamikk) && !instance_exists(obj_bebab) && !wave_ativa) {
    tempo_wave++;
} else {
    tempo_wave = 0;
}

// ✅ Começa nova wave
if (tempo_wave >= intervalo_wave && wave <= max_waves) {
    wave_ativa = true;
    inimigos_spawnados = 0; // <<< reset importante
    tempo_wave = 0;
}

// 🚀 SPAWN DA WAVE
if (wave_ativa && wave <= max_waves) {

    var kamikk_target = kamikks_por_wave[wave - 1];
    var bebab_target = bebabs_por_wave[wave - 1];
    var total_alvo  = kamikk_target + bebab_target;

    if (inimigos_spawnados < total_alvo) {

        var pos_x = random_range(left_spawn, right_spawn);
        var pos_y = top_spawn;

        // Decide quem spawnar baseado na ordem da wave
        if (inimigos_spawnados < kamikk_target) {
            instance_create_layer(pos_x, pos_y, "Instances", obj_kamikk);
        }
        else {
            instance_create_layer(pos_x, pos_y, "Instances", obj_bebab);
        }

        inimigos_spawnados++;
    }
    else {
        wave_ativa = false;
        wave++;
        inimigos_spawnados = 0; // <<< reset obrigatório antes da próxima wave
    }
}

// 👹 SPAWN DO BOSS
if (wave > max_waves && !boss_spawned) {
    if (!instance_exists(obj_kamikk) && !instance_exists(obj_bebab)) {
        boss_delay_timer++;

        if (boss_delay_timer >= boss_delay_max) {
            var boss = instance_create_layer(835, -120, "Instances", obj_fucpuzy);
            boss.alvo_y = 300;

            boss_spawned = true;
            global.congelado = true;
        }
    }
}
