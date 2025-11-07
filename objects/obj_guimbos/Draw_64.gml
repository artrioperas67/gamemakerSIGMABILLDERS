var largura = 300;
var altura = 18;
var x_gui = display_get_gui_width()/2 - largura/2;
var y_gui = 40;

draw_set_color(c_black);
draw_rectangle(x_gui-2, y_gui-2, x_gui+largura+2, y_gui+altura+2, false);

draw_set_color(c_blue);
draw_rectangle(x_gui, y_gui, x_gui + (largura * hp / hp_max), y_gui + altura, false);