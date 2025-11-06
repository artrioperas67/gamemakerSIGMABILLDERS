x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (x < 0 || x > room_width || y < 0 || y > room_height)
    instance_destroy();
	
	if (global.jogador_morrendo) {
    spd = 0;
    image_speed = 0;
    exit;
}