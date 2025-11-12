// Verifica se a variável de diálogos existe
if (!variable_instance_exists(id, "dialogues")) exit;

// Pega a frase atual
var frase = dialogues[dialogue_index];

// Efeito de digitação letra por letra
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

// Avançar com espaço
if (keyboard_check_pressed(vk_space)) {
    if (!finished) {
        // Mostra o texto completo imediatamente
        current_text = frase;
        finished = true;
    } else {
        // Passa para o próximo diálogo
        dialogue_index++;

        // Fim do diálogo
        if (dialogue_index >= array_length(dialogues)) {
            // Atualiza estado do mentor, se existir
            if (instance_exists(obj_mentor_final_boss)) {
                with (obj_dialogue_final_boss) {
                    estado = "finalizando";
                }
            }

            // Vai para a room final
            room_goto(rm_final_do_game);

            // Remove o objeto de diálogo
            instance_destroy();
        } else {
            // Prepara próxima frase
            current_text = "";
            finished = false;
        }
    }
}
