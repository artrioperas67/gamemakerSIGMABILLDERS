// Entrada do boss
if (!entrou) {
    global.congelado = true;
    y += vel_descida;

    if (y >= alvo_y) {
        y = alvo_y;
        entrou = true;
        global.congelado = false;
    }
    exit;
}

// Morte do boss
if (entrou && hp <= 0 && !morreu) {
    morreu = true;

    effect_create_above(ef_explosion, x, y, 2, c_blue);
    image_alpha = 0;

    global.congelado = true;
    global.boss_morreu = true;

    tempo_pos_morte = room_speed * 2;
    exit;
}

// Ciclo de estado
timer_estado++;

if (timer_estado >= intervalo_estado) {
    timer_estado = 0;

    if (estado == "normal") {
        estado = "invulneravel";
        ataque_executado = true;

        if (irandom(1) == 0) {
            tipo_ataque = "kamikks";
            fila_kamikks = [4, 4, 4, 4];
            indice_kamikks = 0;
            timer_kamikks = intervalo_kamikks;
        } else {
            tipo_ataque = "laser";

            // Cria avisadores de laser
            instance_create_layer(515, 0, "Instances", obj_laser_avisador);
            instance_create_layer(835, 0, "Instances", obj_laser_avisador);
            instance_create_layer(1115, 0, "Instances", obj_laser_avisador);

            timer_kamikks = room_speed * 5;
        }
    }
}

// Execução dos ataques invulneráveis
if (estado == "invulneravel" && ataque_executado) {
    if (tipo_ataque == "kamikks" && indice_kamikks < array_length(fila_kamikks)) {
        timer_kamikks--;

        if (timer_kamikks <= 0) {
            var qtd = fila_kamikks[indice_kamikks];

            for (var i = 0; i < qtd; i++) {
                var px = x + irandom_range(-200, 200);
                var py = y + 50;
                instance_create_layer(px, py, "Instances", obj_kamikk);
            }

            indice_kamikks++;
            timer_kamikks = intervalo_kamikks;
        }
    }
    else if (tipo_ataque == "laser") {
        timer_kamikks--;
    }
}

// Fim do ataque invulnerável
if (estado == "invulneravel") {
    var fim_kamikks = (tipo_ataque == "kamikks" && indice_kamikks >= array_length(fila_kamikks));
    var fim_laser   = (tipo_ataque == "laser" && timer_kamikks <= 0);

    if (fim_kamikks || fim_laser) {
        estado = "normal";
        rajada_ativa = true;
        rajada_timer = rajada_duracao;
        ataque_executado = false;
        tipo_ataque = "";
    }
}

// Rajada temporária
if (rajada_ativa) {
    rajada_timer--;
    if (rajada_timer <= 0) {
        rajada_ativa = false;
    }
}

// Tiros padrão e rajada
if (estado == "normal") {
    fire_timer--;

    var taxa = rajada_ativa ? fire_rate_rajada : fire_rate_normal;

    if (fire_timer <= 0) {
        fire_timer = taxa;
        instance_create_layer(x, y + 40, "Instances", obj_tiro_fucpuzy);
    }
}
