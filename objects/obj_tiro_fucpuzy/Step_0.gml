if (global.congelado) {
    instance_destroy();
    exit;
}

if (global.congelado) {
    exit;
}

// Se o player morreu, para o tiro
if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
    exit;
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (x < 0 || x > room_width || y < 0 || y > room_height)
    instance_destroy();
	
	if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
    exit;
}