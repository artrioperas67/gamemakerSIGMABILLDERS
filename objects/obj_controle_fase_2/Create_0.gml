var largura = 1280;
var altura = 720;

window_set_size(largura, altura);

camera_set_view_size(view_camera[0], 1280, 720);
camera_set_view_pos(view_camera[0], 0, 0);

view_set_wport(0, largura);
view_set_hport(0, altura);
view_set_xport(0, 0);
view_set_yport(0, 0);

display_set_gui_size(1280, 720);

global.boss_morreu = false;
global.congelado = false;