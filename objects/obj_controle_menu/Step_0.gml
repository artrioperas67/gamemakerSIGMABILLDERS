if (mouse_check_button_pressed(mb_left)) {
    switch (selecionado) {
        case 0:
            room_goto(rm_fase1);
            break;
        case 1:
            game_end();
            break;
        case 2:
			show_message("Opções ainda não disponíveis!");
            break;
    }
}