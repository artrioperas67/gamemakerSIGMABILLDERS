menu_itens = ["jogar", "sair", "creditos"];
selecionado = -1;
fonte_menu = font_menu_inicial;

menu_sprites = [
    spr_jogar,
    spr_sair,
	spr_creditos
];
var largura = 1280;
var altura = 720;

window_set_size(largura, altura);

window_center();

var cam = view_camera[0];

if (cam != noone) {
    camera_set_view_size(cam, largura, altura);
}

