// Script: destruir
function destruir() {
    if (irandom(1) == 0) {
        instance_create_layer(x, y, "Instances", obj_energia);
    }
    effect_create_above(ef_explosion, x, y, 2, c_orange);
}