if (is_dead || other.is_dead) exit;

// Se o jogador estiver invencível, ignora
if (invincible) exit;

// Mata o jogador
hp = 0;
is_dead = true;
global.jogador_morrendo = true;

// Toca animação de morte
sprite_index = spr_auro_morrendo;
image_index = 0;
image_speed = 0.4;

// Impede movimento: no Step do jogador, use 'if is_dead exit;' para não mover
xspd = 0;
yspd = 0;

// Alarme para trocar de room/game over
alarm[0] = room_speed * 1.5; // 1.5 segundos de delay