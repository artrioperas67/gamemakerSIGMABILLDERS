// FUNDO ESCURO (subido)
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(80, 350, 1200, 480, false);
draw_set_alpha(1);

// FOTO / SPRITE DE VOCÊS (subido)
draw_sprite(spr_eu_e_namorada, 0, 300, 100);

// TEXTO BONITÃO (subido)
draw_set_font(font_dialogo);
draw_set_color(c_white);
draw_text(400, 500, "Arthur:" );
draw_text(400, 540, "Eu te amo, mog_plog!" );
draw_text(400, 580, "você é a melhor parte do meu jogo <3");

// Dica pra sair da sala (subido)
draw_set_color(c_white);
draw_text(950, 620, "[APERTE ESPAÇO]");