// Movimento
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destrói se sair da área jogável
if (x < left_bound || x > right_bound || y < top_bound || y > bottom_bound) {
    instance_destroy();
}
