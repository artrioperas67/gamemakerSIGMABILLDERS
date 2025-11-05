x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// Destroi se sair da tela
if (x < 0 || x > room_width || y < 0 || y > room_height)
    instance_destroy();