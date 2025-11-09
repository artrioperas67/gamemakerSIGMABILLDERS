sprite_index = spr_bebab;
image_speed = 0.5;

// Patrulha aérea
hspd = 5;             // velocidade horizontal
vspd = 0;             // sem gravidade
amplitude = 20;       // "altura" da flutuação
freq = 0.05;          // velocidade da flutuação
start_y = y;          // salva a altura inicial

momento_descida = true;
altura_target = 58; // altura onde ele vai parar e começar a patrulhar
vspd = 3; // velocidade que ele vai descer

left_bound = 444;
right_bound = 1215;
top_bound = 0;
bottom_bound = room_height;
// Status
hp = 6;
is_dead = false;

visible = true;
image_alpha = 1;

// Sistema de tiro
shot_cooldown = room_speed * 2.5; // 1.5s entre tiros
shot_timer = irandom_range(30, 90); // começa aleatório pra não atirar tudo junto

rajada_contador = 0;
rajada_max = 7; // número de tiros por rajada
rajada_intervalo = 4; // tempo entre cada tiro da rajada
rajada_timer = 0;