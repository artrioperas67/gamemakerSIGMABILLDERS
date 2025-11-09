if (instance_exists(obj_guimbos)) {
    draw_set_color(c_red);
    draw_rectangle(40, 40, 300, 60, false);

    draw_set_color(c_blue);
    var barra = (hp / hp_max) * 260;
    draw_rectangle(40, 40, 40 + barra, 60, false);
}