var largura = 250;
var altura = 30;
var x_gui = 890;
var y_gui = 281;

draw_set_color(c_black);
draw_rectangle(x_gui-2, y_gui-2, x_gui+largura+2, y_gui+altura+2, false);

draw_set_color(c_red);
draw_rectangle(x_gui, y_gui, x_gui + (largura * hp/max_hp), y_gui + altura, false);
