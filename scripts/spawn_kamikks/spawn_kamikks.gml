function spawn_kamikks(x_base, y_base) {
    for (var i = 0; i < 6; i++) {
        var px = x_base + irandom_range(-200, 200);
        var py = y_base + 50;
        instance_create_layer(px, py, "Instances", obj_kamikk);
    }
}