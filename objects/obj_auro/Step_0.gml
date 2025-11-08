if (!is_dead) {
    var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
    var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);
    x += hmove * move_speed;
    y += vmove * move_speed;
    if (hmove < 0) image_xscale = -1;
    if (hmove > 0) image_xscale = 1;
}

<<<<<<< Updated upstream
if (invincible) {
    inv_timer -= 1;
    blink_timer += 1;
    image_alpha = (blink_timer mod 10 < 5) ? 0.3 : 1;
    if (inv_timer <= 0) {
        invincible = false;
        image_alpha = 1;
    }
}

=======
>>>>>>> Stashed changes
var half_w = sprite_get_width(sprite_index) * 0.5;
var half_h = sprite_get_height(sprite_index) * 0.5;

x = clamp(x, left_bound + half_w, right_bound - half_w);
y = clamp(y, top_bound + half_h, bottom_bound - half_h);

if (invincible) {
    inv_timer -= 1;
    blink_timer += 1;
    image_alpha = (blink_timer mod 10 < 5) ? 0.3 : 1;

    if (inv_timer <= 0) {
        invincible = false;
        image_alpha = 1;
    }
}

if (is_dead) {
    invincible = true;
    move_speed = 0;
    if (image_index >= image_number - 1) {
        room_goto(rm_gameover);
    }
}

<<<<<<< Updated upstream
if (!poder_ativo && poder_atual >= poder_max) {
    // jogador pode ativar com a tecla X
    if (keyboard_check_pressed(ord("X"))) {
        poder_ativo = true;
        poder_atual = 0;

        // cria vários tornados
        for (var i = 0; i < 5; i++) {
            var pos_x = irandom_range(left_bound, right_bound);
            var pos_y = irandom_range(top_bound + 100, bottom_bound - 100);
            instance_create_layer(pos_x, pos_y, "Instances", obj_tornado);
        }
=======
if (!global.congelado && pode_atirar && keyboard_check(ord("Z"))) {
    if (alarm[0] <= 0) {
        instance_create_layer(x, y, "Instances", obj_tiro_auro);
        alarm[0] = 15; // tempo entre tiros (menor = atira mais rápido)
>>>>>>> Stashed changes
    }
}