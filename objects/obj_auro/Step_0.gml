if (!is_dead) {
    var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
    var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);

    x += hmove * move_speed;
    y += vmove * move_speed;

    if (hmove < 0) image_xscale = -1; 
    if (hmove > 0) image_xscale = 1;  
}

if (invincible && !is_dead) {
    inv_timer -= 1;

    blink_timer++;
    if (blink_timer >= blink_speed) {
        blink_timer = 0;
        visible_for_blink = !visible_for_blink;
    }

    if (inv_timer <= 0) {
        invincible = false;
        visible_for_blink = true;
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