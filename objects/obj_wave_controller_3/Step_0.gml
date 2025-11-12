if (global.congelado) exit;

// ================= WAVES NORMAIS =================

// reseta o timer se inimigos ainda existirem
if (instance_exists(obj_povuy) || instance_exists(obj_olho)) {
    tempo_wave = 0;
}

// se não tem inimigos vivos e a wave acabou, começa a contagem pra próxima
if (!instance_exists(obj_povuy) && !instance_exists(obj_olho) && !wave_ativa) {
    tempo_wave++;
}

// inicia próxima wave
if (tempo_wave >= intervalo_wave && wave <= max_waves) {
    wave_ativa = true;
    inimigos_spawnados = 0;
    tempo_wave = 0;
}

// spawn inimigos da wave atual
if (wave_ativa && wave <= max_waves) {
    var alvo_povuy = povuys_por_wave[wave-1];
    var alvo_olho  = olhos_por_wave[wave-1];
    var total_alvo = alvo_povuy + alvo_olho;

    if (inimigos_spawnados < total_alvo) {
        var pos_x, pos_y, seguro;
        repeat (40) {
            seguro = true;
            pos_x = random_range(left_bound + 64, right_bound - 64);
            pos_y = -64;

            with (obj_povuy) if (point_distance(x, y, pos_x, pos_y) < 64) seguro = false;
            with (obj_olho)  if (point_distance(x, y, pos_x, pos_y) < 64) seguro = false;

            if (seguro) break;
        }

        if (inimigos_spawnados < alvo_povuy) {
            instance_create_layer(pos_x, pos_y, "Instances", obj_povuy);
        } else {
            instance_create_layer(pos_x, pos_y, "Instances", obj_olho);
        }

        inimigos_spawnados++;
    } else {
        wave_ativa = false;
        wave++;
    }
}

// ================= SPAWN DO BOSS =================

if (wave > max_waves && !boss_spawned) {

    // só começa a contagem quando não existir mais inimigos
    if (!instance_exists(obj_povuy) && !instance_exists(obj_olho)) {
        boss_delay_timer++;

        if (boss_delay_timer >= boss_delay_max) {
            var boss = instance_create_layer(820, -120, "Instances", obj_krunkas);
            boss.alvo_y = 300;
            boss_spawned = true;

            // congela o jogo até o boss terminar a entrada
            global.congelado = true;
        }
    }
}
