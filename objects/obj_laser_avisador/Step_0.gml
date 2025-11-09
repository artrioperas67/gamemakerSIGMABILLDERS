tempo_espera--;

if (tempo_espera <= 0) {
    instance_create_layer(pos_laser_x, 0, "Instances", obj_laser_fixo);
    instance_destroy();
}