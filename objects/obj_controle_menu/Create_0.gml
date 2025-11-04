// Ativa o modo tela cheia
window_set_fullscreen(true);

// Define a resolução lógica (GUI)
display_set_gui_size(1280, 720);

menu_itens = ["jogar", "opcoes", "sair", "creditos"];
selecionado = -1;
fonte_menu = font_menu_inicial; // usa a fonte que tu criou no editor