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

// Ataque normal
fire_timer--;
if (fire_timer <= 0) {
    fire_timer = fire_rate;
    instance_create_layer(x, y, "Instances", obj_tiro_guimbos);
}

// Morte do boss (só após entrada)
if (entrou && hp <= 0 && !morreu) {
    morreu = true;

    effect_create_above(ef_explosion, x, y, 2, c_blue);
    image_alpha = 0;

    global.congelado = true;
    global.boss_morreu = true;

    tempo_pos_morte = room_speed * 2; // começa contagem de 2 segundos
}

// Espera 2 segundos após a morte
if (tempo_pos_morte > 0) {
    tempo_pos_morte--;

    if (tempo_pos_morte == 0) {
        var m = instance_create_layer(x, y - 80, "Instances", obj_mentor_fim);
        show_debug_message("Mentor criado em: " + string(m.x) + ", " + string(m.y));

        var d = instance_create_layer(50, 500, "GUI", obj_dialogue_fim);

        instance_destroy(); // destrói o boss depois de tudo
    }
}
