// ================= ENTRADA =================
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

// ================= MORTE =================
if (entrou && hp <= 0 && !morreu) {
    morreu = true;

    effect_create_above(ef_explosion, x, y, 2, c_red);
    image_alpha = 0;

    global.congelado = true;
    global.boss_morreu = true;
	global.krankus_morto = true;
    // Começa timer de pós-morte igual boss 1
    tempo_pos_morte = room_speed * 2;
}

// Espera 2 segundos, spawn mentor + diálogo e destrói o boss
if (tempo_pos_morte > 0) {
    tempo_pos_morte--;

    if (tempo_pos_morte == 0) {
        instance_create_layer(x, y - 80, "Instances", obj_mentor_final_boss);
        instance_create_layer(50, 500, "Instances", obj_dialogue_final_boss);

        instance_destroy(); // apaga o boss
    }

    exit;
}

// ================= TIMER DO ESTADO =================
timer_estado++;

// ─────────────────────────────────────────────
// 🐙 ESTADO GRANDE (PARADO + ONDA)
// ─────────────────────────────────────────────
if (estado == "grande") {

    if (!onda_ativa) {
        onda = instance_create_layer(x, y, "Instances", obj_poopety);
        onda_ativa = true;
    }

    if (timer_estado >= tempo_grande) {
        estado = "pequeno";
        sprite_index = spr_boss_pequeno;
        timer_estado = 0;
    }
}

// ─────────────────────────────────────────────
// ⚡ ESTADO PEQUENO (QUICANDO NA ARENA)
// ─────────────────────────────────────────────
else if (estado == "pequeno") {

    if (timer_estado == 1) {
        speed = 20;
        direction = irandom_range(0, 360);
    }

    if (bbox_left <= lim_esq || bbox_right >= lim_dir) direction = 180 - direction;
    if (bbox_top <= lim_top || bbox_bottom >= lim_bot) direction = 360 - direction;

    if (timer_estado >= tempo_pequeno) {
        estado = "wave";
        timer_estado = 0;
        speed = 0;
        sprite_index = spr_krunkas;
    }
}

// ─────────────────────────────────────────────
// 🌊 ESTADO WAVE + TENTÁCULOS
// ─────────────────────────────────────────────
else if (estado == "wave") {

    if (timer_estado % 40 == 0) {
        var py = irandom_range(150, room_height - 150);

        if (choose(true, false))
            instance_create_layer(1410, py, "Instances_1", obj_tentaculo);
        else
            instance_create_layer(250, py, "Instances_1", obj_tentaculo);
    }

    if (timer_estado >= tempo_wave) {
        estado = "grande";
        timer_estado = 0;
        onda_ativa = false;
        if (instance_exists(onda)) instance_destroy(onda);
        sprite_index = spr_krunkas;
    }
}
