// --- Pega dados atuais ---
var _vida_max = max_hp;
var _vida_atual = hp;
var _poder_max = poder_max;
var _poder_atual = poder_atual;

// --- Define posição na tela (Draw GUI usa coordenadas de tela, não da room) ---
var _vida_x1 = 1374;
var _vida_y1 = 558;
var _vida_x2 = 1645;
var _vida_altura = 50;

// --- Converte posição para resolução da janela ---
// Isso garante que funcione mesmo com fullscreen ou escalas diferentes.
var _sx = display_get_gui_width() / room_width;
var _sy = display_get_gui_height() / room_height;

// Ajusta coordenadas conforme a GUI
_vida_x1 *= _sx; _vida_x2 *= _sx; _vida_y1 *= _sy;

// --- Cores ---
var _cor_fundo = make_color_rgb(40, 40, 40);
var _cor_vida = make_color_rgb(255, 80, 80);

// --- Desenha VIDA ---
draw_set_color(_cor_fundo);
draw_rectangle(_vida_x1, _vida_y1, _vida_x2, _vida_y1 + _vida_altura, false);

var _vida_frac = clamp(_vida_atual / _vida_max, 0, 1);
var _vida_w = lerp(_vida_x1, _vida_x2, _vida_frac);

draw_set_color(_cor_vida);
draw_rectangle(_vida_x1, _vida_y1, _vida_w, _vida_y1 + _vida_altura, false);

// borda
draw_set_color(c_white);
draw_rectangle(_vida_x1, _vida_y1, _vida_x2, _vida_y1 + _vida_altura, true);


if (keyboard_check_pressed(vk_f3)) {
    global.debug_area = !global.debug_area;
}
