switch (state) {
    case "enter":
        // Move até o ponto desejado
        var dir = point_direction(x, y, target_x, target_y);
        var dist = point_distance(x, y, target_x, target_y);

        if (dist > spd) {
            x += lengthdir_x(spd, dir);
            y += lengthdir_y(spd, dir);
        } else {
            // Chegou no meio → inicia diálogo
            state = "talk";
            instance_create_layer(x, y - 80, "Instances", obj_dialogue);
            image_speed = 0;
        }
    break;

    case "talk":
        // Parado durante o diálogo
        hspeed = 0;
        vspeed = 0;
    break;
}
