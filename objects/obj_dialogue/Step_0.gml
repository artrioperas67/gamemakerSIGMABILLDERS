if (!finished) {
    if (text_timer <= 0) {
        if (string_length(current_text) < string_length(dialogues[dialogue_index])) {
            current_text = string_copy(dialogues[dialogue_index], 1, string_length(current_text) + 1);
            text_timer = text_speed;
        } else {
            finished = true;
        }
    } else {
        text_timer--;
    }
} else {
    // Quando o jogador pressiona espaço, avança diálogo
    if (keyboard_check_pressed(vk_space)) {
        dialogue_index++;
        if (dialogue_index >= array_length(dialogues)) {
            // Acabou o diálogo
            instance_destroy();
        } else {
            current_text = "";
            finished = false;
        }
    }
}

if (dialogue_index >= array_length(dialogues)) {
    // Acabou o diálogo
    // avisa o mentor
    with (obj_mentor) {
        dialogue_finished = true;
    }
    instance_destroy();
}