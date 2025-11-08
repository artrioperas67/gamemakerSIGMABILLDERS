// Se não recebeu as falas via criação, define um fallback
if (!variable_instance_exists(id, "dialogues")) {
    dialogues = [
        "Você surpreendentemente conseguiu.",
        "Agora entre em sua nave e vá atrás do núcleo de tudo isso.",
        "Se esse planeta ainda tem esperança... ela é você.",
        "AURO!"
    ];
}

dialogue_index = 0;
text_timer = 0;
if (!variable_instance_exists(id, "text_speed")) text_speed = 1; // frames entre letras (padrão)
current_text = "";
finished = false;

global.boss_morreu = false;
global.congelado = false;
