if (global.congelado) exit;

// ⏳ Espera todos morrerem pra contar tempo da próxima wave
if (!instance_exists(obj_kamikk) && !instance_exists(obj_bebab) && !instance_exists(obj_inimigo_escudo) && !wave_ativa) {
    tempo_wave++;
} else {
    tempo_wave = 0;
}

// ✅ Começa nova wave
if (tempo_wave >= intervalo_wave && wave <= max_waves) {
    wave_ativa = true;
    inimigos_spawnados = 0;
    tempo_wave = 0;
}

// 🚀 SPAWN DA WAVE
if (wave_ativa && wave <= max_waves) {

    var escudo_target = escudos_por_wave[wave - 1];
    var kamikk_target = kamikks_por_wave[wave - 1];
    var bebab_target  = bebabs_por_wave[wave - 1];
    var total_alvo    = escudo_target + kamikk_target + bebab_target;

    if (inimigos_spawnados < total_alvo) {

        var pos_y = top_spawn;

        // ESCUDO
        if (inimigos_spawnados < escudo_target) {
            var tentativa = 0;
            var max_tentativas = 20;
            var distancia_minima = 64;
            var pos_x;

            repeat (max_tentativas) {
                tentativa++;
                pos_x = random_range(left_spawn, right_spawn);
                var sobreposto = false;

                with (obj_inimigo_escudo) {
                    if (point_distance(x, y, pos_x, pos_y) < distancia_minima) {
                        sobreposto = true;
                    }
                }

                if (!sobreposto) {
                    instance_create_layer(pos_x, pos_y, "Instances", obj_inimigo_escudo);
                    break;
                }
            }
        }

        // KAMIKK
        else if (inimigos_spawnados < escudo_target + kamikk_target) {
            var pos_x = random_range(left_spawn, right_spawn);
            instance_create_layer(pos_x, pos_y, "Instances", obj_kamikk);
        }

        // BEBAB
        else {
            var pos_x = random_range(left_spawn, right_spawn);
            instance_create_layer(pos_x, pos_y, "Instances", obj_bebab);
        }

        inimigos_spawnados++;
    }
    else {
        wave_ativa = false;
        wave++;
        inimigos_spawnados = 0;
    }
}

// 👹 SPAWN DO BOSS
if (wave > max_waves && !boss_spawned) {
    if (!instance_exists(obj_kamikk) && !instance_exists(obj_bebab) && !instance_exists(obj_inimigo_escudo)) {
        boss_delay_timer++;

        if (boss_delay_timer >= boss_delay_max) {
            var boss = instance_create_layer(835, -120, "Instances", obj_fucpuzy);
            boss.alvo_y = 150;

            boss_spawned = true;
            global.congelado = true;
        }
    }
}
