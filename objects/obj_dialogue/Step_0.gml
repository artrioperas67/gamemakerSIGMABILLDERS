var frase = dialogues[dialogue_index];

// DIGITAÇÃO DO TEXTO
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

// APERTAR ESPAÇO
if (keyboard_check_pressed(vk_space)) {
    if (!finished) {
        current_text = frase;
        finished = true;
    }
    else {
        dialogue_index++;

        if (dialogue_index >= array_length(dialogues)) {
            with (obj_mentor) dialogue_finished = true;
            instance_destroy();
        } else {
            current_text = "";
            finished = false;
        }
    }
}
