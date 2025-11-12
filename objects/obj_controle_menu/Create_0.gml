menu_itens = ["jogar", "sair", "creditos"];
selecionado = -1;
fonte_menu = font_menu_inicial;

menu_sprites = [
    spr_jogar,
    spr_sair,
    spr_creditos
];

// fade secreto (começa desligado)
global.fade_ativo = false;
global.fade_alpha = 0;
global.fade_room  = noone;
