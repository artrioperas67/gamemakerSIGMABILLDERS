/// Create Event

// 🔸 Deixa o jogo em tela cheia
window_set_fullscreen(true);

// 🔸 Ajusta a resolução para o tamanho da tela do jogador
display_set_gui_maximize();

// 🔸 (Opcional) Ajusta para manter proporção original (sem distorcer)
var base_w = 1280; // largura base do seu jogo
var base_h = 720;  // altura base do seu jogo

var screen_w = display_get_width();
var screen_h = display_get_height();

var scale_x = screen_w / base_w;
var scale_y = screen_h / base_h;
var final_scale = min(scale_x, scale_y);

// Configura a view da câmera
camera_set_view_size(view_camera[0], base_w, base_h);
camera_set_view_pos(view_camera[0], 0, 0);

// Centraliza a imagem com barras pretas, se necessário
var offset_x = (screen_w - base_w * final_scale) * 0.5;
var offset_y = (screen_h - base_h * final_scale) * 0.5;

// Escala e posiciona a aplicação
window_set_size(screen_w, screen_h);
window_center();
display_set_gui_size(base_w, base_h);

// Escala a renderização mantendo proporção
matrix_set(matrix_projection, matrix_build_projection_ortho(base_w, base_h, 0, 10000));