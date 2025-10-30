if (pode_atirar == 1) {
    instance_create_layer(x, y, "Instances_1", obj_tiro_auro);
    pode_atirar = 0;
    alarm[0] = 15;
}
