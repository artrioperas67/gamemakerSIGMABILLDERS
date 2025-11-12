draw_set_font(font_dialogo); // coloca sua fonte aqui
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Fundo escuro
draw_set_alpha(0.7);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Título
draw_text(display_get_gui_width() / 2, 100, "------------------------ CRÉDITOS ------------------------");

// Texto do corpo
var texto =
"Programação: Arthur Rios e Davi Medeiros\n\n" +
"Sprites (inimigos e protagonistas): Filippo Pyloridis e Henry Michel\n\n" +
"Sprites de background: Isaac Batista\n\n"+
"Site: Isaac Batista\n\n"+
"Musica: Filippo Pyloridis\n\n";

draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, texto);

// Instrução
draw_text(display_get_gui_width() / 2, display_get_gui_height() - 80, "[Aperte ESPAÇO para voltar]");
