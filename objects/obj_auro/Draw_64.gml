// Barra de poder
draw_set_color(c_dkgray);
draw_rectangle(50, 50, 250, 80, false);
draw_set_color(c_aqua);
var largura = lerp(0, 200, poder_atual / poder_max);
draw_rectangle(50, 50, 50 + largura, 80, false);

draw_set_color(c_white);
draw_text(60, 55, "Poder: " + string(floor(poder_atual)) + " / " + string(poder_max));