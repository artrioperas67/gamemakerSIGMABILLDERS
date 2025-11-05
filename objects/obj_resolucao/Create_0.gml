// Dimensões base
global.base_w = 1280;
global.base_h = 720;

// Ajusta a resolução da janela
window_set_size(global.base_w, global.base_h);
window_center();

// Redefine o tamanho da application surface
surface_resize(application_surface, global.base_w, global.base_h);

// Ajusta a câmera se existir
if (view_enabled && view_camera[0] != noone) {
    camera_set_view_size(view_camera[0], global.base_w, global.base_h);
}