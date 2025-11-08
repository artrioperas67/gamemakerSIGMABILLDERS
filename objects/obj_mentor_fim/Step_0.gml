// só checa espaço quando o diálogo atual estiver exibido
if (!dialogo_finalizado) {
    // Avança imediatamente para o próximo bloco quando apertar espaço
    if (keyboard_check_pressed(vk_space)) {
        index++;
        if (index < array_length(textos)) {
            texto_atual = textos[index];
        } else {
            dialogo_finalizado = true;
        }
    }
} else {
    // diálogo finalizado → se apertar espaço, vai pra cutscene
    if (keyboard_check_pressed(vk_space)) {
        global.congelado = false;
    }
}