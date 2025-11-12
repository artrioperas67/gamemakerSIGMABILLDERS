spd = 6;
dir_x = choose(-1,1);
dir_y = choose(-1,1);

hp = 3;
is_dead = false;

left_bound = 435;
right_bound = 1205;
top_bound = 0;
bottom_bound = 1492;

drop_chance = 0.25;

fire_rate = room_speed * 2; // 2 segundos
fire_timer = fire_rate;
shoot_distance = 150;