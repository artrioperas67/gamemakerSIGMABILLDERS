// Só desenha se o mentor final estiver ativo na room
if (instance_exists(obj_mentor_fim)) {

    // FUNDO DO DIÁLOGO
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(80, room_height - 200, room_width - 80, room_height - 80, false);

    // TEXTO
    draw_set_font(font_dialogo);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(200, room_height - 170, "Mentor: " + current_text);

    // DICA DE AVANÇAR
    if (finished) {
        draw_text(room_width - 275, room_height - 120, "[Aperte ESPAÇO]");
    }
}