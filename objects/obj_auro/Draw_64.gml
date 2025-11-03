
if (!is_dead) {
    draw_set_color(c_white);
    draw_text(20, 8, "Vida: " + string(hp) + " / " + string(max_hp));

    var bar_w = 120;
    var pct = hp / max_hp;
    draw_set_color(c_black);
    draw_rectangle(18, 28, 18 + bar_w, 44, false);
    draw_set_color(c_red);
    draw_rectangle(20, 30, 20 + floor(pct * bar_w), 42, false);
}
