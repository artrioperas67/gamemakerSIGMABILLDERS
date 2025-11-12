if (global.krankus_morto)
{
	instance_destroy()	
}

if (instance_exists(obj_auro)) {
    direction = point_direction(x, y, obj_auro.x, obj_auro.y);
}
