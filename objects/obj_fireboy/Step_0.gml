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

if (shot_timer <= 0) {
    shot_timer = shot_cooldown;

    // Cria o tiro apontando pra baixo (ou na direção do jogador se quiser depois)
    var t = instance_create_layer(x, y + 10, "Instances", obj_ultimatefireball);
    t.vspd = 6; // velocidade do projétil
}

if (global.jogador_morrendo) {
    hspd = 0;
    image_speed = 0;
	shot_cooldown = 329749234;
	vspd = 0
    exit;
}
