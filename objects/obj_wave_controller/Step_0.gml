if (global.congelado) exit;
if (!global.tutorial_finished) exit;

// --- 2️⃣ CHECAR SE TODOS OS INIMIGOS MORRERAM ---
if (!instance_exists(obj_birdboy) && !instance_exists(obj_fireboy) && !wave_ativa) {
    tempo_wave++;
} else {
    tempo_wave = 0;
}

// --- 3️⃣ INICIAR UMA NOVA WAVE ---
if (tempo_wave >= intervalo_wave && wave <= max_waves) {
    wave_ativa = true;
    inimigos_spawnados = 0;
    tempo_wave = 0;
}

// --- 4️⃣ CRIAR INIMIGOS DA WAVE ATUAL ---
if (wave_ativa && wave <= max_waves) {

    var bird_target = birdboys_por_wave[wave - 1];
    var fire_target = fireboys_por_wave[wave - 1];

    // Número total de inimigos dessa wave
    var total_alvo = bird_target + fire_target;

    if (inimigos_spawnados < total_alvo) {

        var pos_x, pos_y, seguro;
        repeat (40) {
            seguro = true;
            pos_x = random_range(left_spawn, right_spawn);
            pos_y = top_spawn;

            // Evita sobreposição entre inimigos
            with (obj_birdboy)
                if (point_distance(x, y, pos_x, pos_y) < 32)
                    seguro = false;

            with (obj_fireboy)
                if (point_distance(x, y, pos_x, pos_y) < 32)
                    seguro = false;

            if (seguro) break;
        }

        // Decide o tipo de inimigo a spawnar
        if (inimigos_spawnados < bird_target) {
            instance_create_layer(pos_x, pos_y, "Instances", obj_birdboy);
        } else {
            instance_create_layer(pos_x, pos_y, "Instances", obj_fireboy);
        }

        inimigos_spawnados++;
    }
    else {
        // Todos os inimigos dessa wave nasceram
        wave_ativa = false;
        wave++;
    }
}

// --- 5️⃣ SPAWN DO BOSS DEPOIS DA ÚLTIMA WAVE ---
if (wave > max_waves && !boss_spawned) {
    // Espera até não existir nenhum inimigo na tela
    if (!instance_exists(obj_birdboy) && !instance_exists(obj_fireboy)) {
        boss_delay_timer++;

        if (boss_delay_timer >= boss_delay_max) {
            var boss = instance_create_layer(835, -120, "Instances", obj_guimbos);
            boss.alvo_y = 300; // posição final do boss

            boss_spawned = true;
            global.congelado = true;
        }
    }
}