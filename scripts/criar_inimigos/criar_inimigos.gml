function criar_inimigos(wave) {
    var qtd = 3 + wave;

    var area_esquerda = 444;
    var area_direita = 1215;

    for (var i = 0; i < qtd; i++) {
        var pos_x = irandom_range(area_esquerda, area_direita);
        var pos_y = -50;
        instance_create_layer(pos_x, pos_y, "Instances", obj_birdboy);
    }
}