if (!is_dead) {
    var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
    var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);

    x += hmove * move_speed;
    y += vmove * move_speed;

    if (hmove < 0) image_xscale = -1; 
    if (hmove > 0) image_xscale = 1;  
}

// Normalize diagonal movement
if (move_x != 0 && move_y != 0) {
    var diagonal = 1 / sqrt(2);
    move_x *= diagonal;
    move_y *= diagonal;
}

// Move player
x += move_x * move_speed;
y += move_y * move_speed;
// 🧭 Keep player inside playable area
var half_w = sprite_get_width(sprite_index) * 0.5;
var half_h = sprite_get_height(sprite_index) * 0.5;
x = clamp(x, left_bound + half_w, right_bound - half_w);
y = clamp(y, top_bound + half_h, bottom_bound - half_h);

// 🛡 Handle invincibility blinking
if (invincible) {
    inv_timer--;
    blink_timer++;

    if (blink_timer mod 10 < 5)
        image_alpha = 0.3;
    else
        image_alpha = 1;

    if (inv_timer <= 0) {
        invincible = false;
        image_alpha = 1;
    }
} else {
    visible_for_blink = true;
}


if (is_dead) {

    if (image_index >= image_number - 1) {
        room_goto(rm_gameover);
    }
}

if (room == rm_gameover && keyboard_check_pressed(vk_enter)) {
    game_restart();
}