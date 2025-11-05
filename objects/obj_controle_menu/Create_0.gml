menu_itens = ["jogar", "opcoes", "sair", "creditos"];
selecionado = -1;
fonte_menu = font_menu_inicial; // usa a fonte que tu criou no editor

var largura = 1280;
var altura = 720;

// Define o tamanho da janela
window_set_size(largura, altura);

// Centraliza a janela
window_center();

// Garante que a câmera exista antes de usar
var cam = view_camera[0];

if (cam != noone) {
    camera_set_view_size(cam, largura, altura);
}

