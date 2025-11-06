switch (state) {

    case "enter":
        var dir = point_direction(x, y, target_x, target_y);
        var dist = point_distance(x, y, target_x, target_y);

        if (dist > spd) {
            x += lengthdir_x(spd, dir);
            y += lengthdir_y(spd, dir);
        } else {
            // Chegou ao centro → começa o diálogo
            state = "talk";
            instance_create_layer(x, y - 80, "Instances", obj_dialogue);
            image_speed = 0;
        }
    break;

    case "talk":
        // Fica parado durante o diálogo
        if (dialogue_finished) {
            state = "explode";
            image_speed = 0.5;
        }
    break;

    case "explode":
        // Depois da animação, ele desaparece
        if (image_index >= image_number - 1) {
            global.tutorial_finished = true;
            instance_destroy();
        }
    break;
}
