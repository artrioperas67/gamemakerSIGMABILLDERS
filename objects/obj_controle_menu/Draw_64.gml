var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
draw_set_font(font_menu_inicial);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var largura_gui = display_get_gui_width();
var altura_gui = display_get_gui_height();

for (var i = 0; i < array_length(menu_itens); i++) {
    var texto = menu_itens[i];
    var pos_y = altura_gui / 2 + (i * 40);
    var largura_texto = string_width(texto);
    var altura_texto = string_height(texto);

    var x1 = largura_gui / 2 - largura_texto / 2;
    var y1 = pos_y - altura_texto / 2;
    var x2 = largura_gui / 2 + largura_texto / 2;
    var y2 = pos_y + altura_texto / 2;

    if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
        draw_set_color(c_yellow);
        draw_text_transformed(largura_gui / 2, pos_y, texto, 1.2, 1.2, 0);
        selecionado = i;
    } else {
        draw_set_color(c_white);
        draw_text_transformed(largura_gui / 2, pos_y, texto, 1, 1, 0);
    }
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
