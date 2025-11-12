if (is_dead || other.is_dead) exit;
if (invincible) exit;

hp=0;
is_dead=true;
global.jogador_morrendo=true;

sprite_index=spr_auro_morrendo;
image_index=0;
image_speed=0.4;

// Bloqueia movimento no Step
xspd=0;
yspd=0;

alarm[0] = room_speed*1.5;