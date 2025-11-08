if (global.congelado) exit;

if (!global.tutorial_finished) exit;

if (!wave_ativa) {
    tempo_wave++;

    if (tempo_wave >= intervalo_wave && wave <= max_waves) {
        wave_ativa = true;
        inimigos_spawnados = 0;
        tempo_wave = 0;
    }
}

if (wave_ativa && wave <= max_waves) {

    var bird_target = birdboys_por_wave[wave - 1];
    var fire_target = fireboys_por_wave[wave - 1];

    // **Se ainda não nasceu tudo**
    if (inimigos_spawnados < bird_target + fire_target) {

        var pos_x, pos_y, safe;
        repeat(40) { // até 40 tentativas para achar um espaço sem colisão
            safe = true;
            pos_x = random_range(left_spawn, right_spawn);
            pos_y = top_spawn;

            with (obj_birdboy) if (point_distance(x, y, pos_x, pos_y) < 32) safe = false;
            with (obj_fireboy) if (point_distance(x, y, pos_x, pos_y) < 32) safe = false;

            if (safe) break;
        }

        // Decide se vai spawnar Birdboy ou Fireboy
        if (inimigos_spawnados < bird_target) {
            instance_create_layer(pos_x, pos_y, "Instances", obj_birdboy);
        } else {
            instance_create_layer(pos_x, pos_y, "Instances", obj_fireboy);
        }

        inimigos_spawnados++;
    }
    else {
        // WAVE ACABOU
        wave_ativa = false;
        wave++;
    }
}

if (wave > max_waves && !boss_spawned) {

    boss_delay_timer++;

    if (boss_delay_timer >= boss_delay_max) {
        var boss = instance_create_layer(835, -120, "Instances", obj_guimbos);
        boss.alvo_y = 300; // <<< altura final do boss (ajustável)

        boss_spawned = true;
        global.congelado = true;
    }
}