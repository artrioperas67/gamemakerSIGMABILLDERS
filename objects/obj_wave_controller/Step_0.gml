if (!wave_ativa == 1) {
    tempo_wave++;

    if (tempo_wave >= intervalo_wave && wave <= max_waves) {
        wave_ativa = true;
        inimigos_spawnados = 0;
        tempo_wave = 0;
    }
}

if (wave_ativa) {
    if (inimigos_spawnados < inimigos_por_wave) {
        var pos_x = irandom_range(left_spawn, right_spawn);
        var pos_y = top_spawn;
        instance_create_layer(pos_x, pos_y, "Instances", obj_birdboy);
        inimigos_spawnados++;
    } else {
        wave_ativa = false;
        wave++;
    }
}

if (wave > max_waves && !boss_spawned) {
    boss_delay_timer++;

    if (boss_delay_timer >= boss_delay_max) {
        var boss = instance_create_layer(800, -100, "Instances", obj_guimbos);
        boss.alvo_y = 200;
        global.congelado = true;
        boss_spawned = true;
    }
}	
