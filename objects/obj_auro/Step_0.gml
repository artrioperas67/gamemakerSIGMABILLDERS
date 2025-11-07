if (global.congelado) {
    hspeed = 0;
    vspeed = 0;
    move_speed = 0;
    pode_atirar = false;
    exit;
} else {
    move_speed = 10; 
    pode_atirar = true;
}

if (!is_dead) {
    var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
    var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);

    x += hmove * move_speed;
    y += vmove * move_speed;

    if (hmove < 0) image_xscale = -1;
    if (hmove > 0) image_xscale = 1;
}

// =======================
// LIMITES DA TELA
// =======================
var half_w = sprite_get_width(sprite_index) * 0.5;
var half_h = sprite_get_height(sprite_index) * 0.5;

x = clamp(x, left_bound + half_w, right_bound - half_w);
y = clamp(y, top_bound + half_h, bottom_bound - half_h);

// =======================
// INVENCIBILIDADE (piscar)
// =======================
if (invincible) {
    inv_timer--;
    blink_timer++;
    image_alpha = (blink_timer mod 10 < 5) ? 0.3 : 1;

    if (inv_timer <= 0) {
        invincible = false;
        image_alpha = 1;
    }
}

// =======================
// MORTE DO PLAYER
// =======================
if (is_dead) {
    invincible = true;
    move_speed = 0;
    pode_atirar = 0;

    if (image_index >= image_number - 1) {
        room_goto(rm_gameover);
    }
    exit;
}

// =======================
// TIRO SEGURANDO Z COM COOLDOWN
// =======================
if (!global.congelado && pode_atirar && keyboard_check(ord("Z"))) {
    if (alarm[0] <= 0) {
        instance_create_layer(x, y, "Instances", obj_tiro_auro);
        alarm[0] = 15; // tempo entre tiros (menor = atira mais rápido)
    }
}
