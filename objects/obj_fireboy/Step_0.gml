if (is_dead) exit;

// Movimento com gravidade
vspd += gravidade;
y += vspd;
x += hspd;

// Destroi se sair da área jogável
if (y > bottom_bound + 50 || x < left_bound - 50 || x > right_bound + 50) {
    instance_destroy();
}