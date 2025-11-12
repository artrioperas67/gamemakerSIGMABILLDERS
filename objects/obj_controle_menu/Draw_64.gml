var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var largura_gui = display_get_gui_width();
var altura_gui = display_get_gui_height();

// desenha botões (sprites do menu)
for (var i = 0; i < array_length(menu_sprites); i++) {
    var sprite_botao = menu_sprites[i];
    var spr_largura = sprite_get_width(sprite_botao);
    var spr_altura = sprite_get_height(sprite_botao);
    
    var pos_y = altura_gui / 2 + (i * (spr_altura + 20));
    var x1 = largura_gui / 2 - spr_largura / 2;
    var y1 = pos_y - spr_altura / 2;
    var x2 = largura_gui / 2 + spr_largura / 2;
    var y2 = pos_y + spr_altura / 2;

    if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
        draw_sprite_ext(sprite_botao, 0, largura_gui / 2, pos_y, 1.1, 1.1, 0, c_white, 1);
        selecionado = i;
    } else {
        draw_sprite(sprite_botao, 0, largura_gui / 2, pos_y);
    }
}

// FADE para sala secreta
if (global.fade_ativo) {
    global.fade_alpha = clamp(global.fade_alpha + 0.02, 0, 1);

    draw_set_color(c_black);
    draw_set_alpha(global.fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    if (global.fade_alpha >= 1) {
        room_goto(global.fade_room);
    }
}
