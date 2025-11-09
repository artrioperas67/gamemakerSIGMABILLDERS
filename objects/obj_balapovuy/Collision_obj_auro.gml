if (!other.is_dead && !global.jogador_morrendo) {
    other.hp -= 1;

    if (other.hp <= 0) {
        other.is_dead = true;
        global.jogador_morrendo = true;
    }

    instance_destroy(); // destrói a bala
}