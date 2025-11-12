// clique do menu normal
if (mouse_check_button_pressed(mb_left)) {
    switch (selecionado) {
        case 0:
            room_goto(rm_fase1);
            break;
        case 1:
            game_end();
            break;
        case 2:
            room_goto(rm_creditos);
            break;
    }
}

// SEGREDO: ativa fade segurando M + O + G
if (!global.fade_ativo) {
    if (keyboard_check(ord("M")) && keyboard_check(ord("O")) && keyboard_check(ord("G"))) {
        global.fade_ativo = true;
        global.fade_room  = rm_secret;
    }
}
