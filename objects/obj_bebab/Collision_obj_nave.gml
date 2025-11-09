if (other.is_dead) exit; // se o player já estiver morrendo, ignora

// Aplica dano
if (!other.invincible) {
    other.hp -= 1;

    // Ativa invencibilidade temporária
    other.invincible = true;
    other.inv_timer = room_speed; // 1 segundo de invencibilidade

    // Faz o jogador piscar
    other.blink_timer = room_speed / 10;
}

// Destroi o Fireboy ao colidir
instance_destroy();