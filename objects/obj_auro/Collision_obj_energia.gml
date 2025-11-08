if (poder_atual < poder_max) {
    poder_atual += 10; // recupera energia
    poder_atual = clamp(poder_atual, 0, poder_max);
}
instance_destroy(other); // destrói o item após coletar
