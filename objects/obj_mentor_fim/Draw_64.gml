draw_set_font(font_dialogo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// background semitransparente
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(40, room_height - 180, room_width - 40, room_height - 60, false);

// texto
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(60, room_height - 160, texto_atual);

// hint para avançar
if (!dialogo_finalizado) {
    draw_text(room_width - 260, room_height - 90, "[Pressione ESPAÇO para continuar]");
} else {
    draw_text(room_width - 260, room_height - 90, "[Pressione ESPAÇO para a cutscene]");
}
