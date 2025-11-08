// se o diálogo ainda nem começou, garante que o mentor existe
if (!instance_exists(obj_mentor_fim)) exit;

// só roda se houver falas válidas
if (dialogue_index >= array_length(dialogues)) {
    exit;
}

var frase = dialogues[dialogue_index];

// ====================
// DIGITAÇÃO DO TEXTO
// ====================
if (!finished) {
    if (text_timer <= 0) {
        if (string_length(current_text) < string_length(frase)) {
            current_text = string_copy(frase, 1, string_length(current_text) + 1);
            text_timer = text_speed;
        } else {
            finished = true;
        }
    } else {
        text_timer--;
    }
}

// ====================
// INPUT DO JOGADOR
// ====================
if (keyboard_check_pressed(vk_space)) {
    // se ainda não terminou de digitar, completa na hora
    if (!finished) {
        current_text = frase;
        finished = true;
    } else {
        dialogue_index++;
        // se acabou todas as falas
        if (dialogue_index >= array_length(dialogues)) {
            global.congelado = false;

            // destrói o mentor se ele existir
            if (instance_exists(obj_mentor_fim)) {
                instance_destroy(obj_mentor_fim);
            }

            // vai pra cutscene
            room_goto(rm_primeira_cutscene);
            
            // destrói o objeto de diálogo
            instance_destroy();
        } else {
            // prepara próxima fala
            current_text = "";
            finished = false;
            text_timer = 0;
        }
    }
}