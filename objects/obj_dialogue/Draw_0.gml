draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(80, room_height - 200, room_width - 80, room_height - 80, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_text(120, room_height - 170, "Mentor: " + current_text);

if (finished)
    draw_text(room_width - 220, room_height - 100, "[Aperte ESPAÇO]");