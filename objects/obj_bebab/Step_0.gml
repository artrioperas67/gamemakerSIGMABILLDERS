if (is_dead) exit;

// Se estiver descendo para a posição de combate
if (momento_descida) {
    y += vspd;
    if (y >= altura_target) {
        y = altura_target;
        momento_descida = false;
    }
    exit;
}

// Patrulha (só acontece depois que ele desce)
x += hspd;

if (x <= left_bound || x >= right_bound) {
    hspd = -hspd;
    image_xscale = sign(hspd);
}
// Mantém ele voando em linha reta (sem quicar)
vspd = 0;

// Timer do tiro
shot_timer--;

if (shot_timer <= 0 && rajada_contador == 0) {
    rajada_contador = rajada_max;
    rajada_timer = rajada_intervalo;
}

if (rajada_contador > 0) {
    rajada_timer--;

    if (rajada_timer <= 0) {
        // Cria o projétil numa posição simples abaixo do inimigo
        var t = instance_create_layer(x, y + 10, "Instances", obj_tiro_bebab);
        t.vspd = 8;

        rajada_contador--;
        rajada_timer = rajada_intervalo;

        if (rajada_contador == 0) {
            shot_timer = shot_cooldown;
        }
    }
}

if (global.jogador_morrendo) {
    hspd = 0;
    image_speed = 0;
	shot_cooldown = 329749234;
	vspd = 0
    exit;
}
