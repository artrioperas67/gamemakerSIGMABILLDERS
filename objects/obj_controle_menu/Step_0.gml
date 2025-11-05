<<<<<<< HEAD
=======
if (mouse_check_button_pressed(mb_left)) {
    switch (selecionado) {
        case 0:
            room_goto(rm_fase1);
            break;
        case 1:
            show_message("Opções ainda não disponíveis!");
            break;
        case 2:
            game_end();
            break;
    }
}
>>>>>>> ee9d86f411a05c616fb30adc6957826ea4dc8953
