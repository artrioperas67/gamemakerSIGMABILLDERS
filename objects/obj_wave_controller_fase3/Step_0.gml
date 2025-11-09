/// STEP EVENT - obj_wavecontroller_fase3

if (global.congelado) exit;

// Se todos morreram e a wave não está ativa, começa contagem para próxima
if (!instance_exists(obj_povuy) && !instance_exists(obj_olho) && !wave_ativa) {
    tempo_wave++;
} else if (instance_exists(obj_povuy) || instance_exists(obj_olho)) {
    tempo_wave = 0;
}

// Inicia nova wave
if (tempo_wave >= intervalo_wave && wave <= max_waves) {
    wave_ativa = true;
    inimigos_spawnados = 0;
    tempo_wave = 0;
}

// Controle de spawn
if (wave_ativa && wave <= max_waves) {
    var alvo_povuy = povuys_por_wave[wave - 1];
    var alvo_olho  = olhos_por_wave[wave - 1];
    var total_alvo = alvo_povuy + alvo_olho;

    if (inimigos_spawnados < total_alvo) {
        var pos_x, pos_y, seguro;
        repeat (40) {
            seguro = true;

            // posição X aleatória dentro da área
            pos_x = random_range(left_bound + 64, right_bound - 64);
            // o inimigo vem de cima da área
            pos_y = -64;

            // evita overlap
            with (obj_povuy)
                if (point_distance(x, y, pos_x, pos_y) < 64) seguro = false;
            with (obj_olho)
                if (point_distance(x, y, pos_x, pos_y) < 64) seguro = false;

            if (seguro) break;
        }

        // Decide se cria povuy ou olho
        if (inimigos_spawnados < alvo_povuy) {
            instance_create_layer(pos_x, pos_y, "Instances", obj_povuy);
        } else {
            instance_create_layer(pos_x, pos_y, "Instances", obj_olho);
        }

        inimigos_spawnados++;
    } else {
        // wave acabou
        wave_ativa = false;
        wave++;
    }
}

// Spawna o boss após as waves
if (wave > max_waves && !boss_spawned) {
    if (!instance_exists(obj_povuy) && !instance_exists(obj_olho)) {
        boss_delay_timer++;

        if (boss_delay_timer >= boss_delay_max) {
            var boss = instance_create_layer(820, -120, "Instances", obj_boss_fase3);
            boss.alvo_y = 300;
            boss_spawned = true;
            global.congelado = true;
        }
    }
}