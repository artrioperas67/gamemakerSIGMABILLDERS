if (is_dead) exit;

// Movimento diagonal
x += dir_x * spd;
y += dir_y * spd;

// Ricochete nas bordas
var half_w = sprite_width*0.5;
var half_h = sprite_height*0.5;
if (x-half_w <= left_bound){ x=left_bound+half_w; dir_x*=-1; }
if (x+half_w >= right_bound){ x=right_bound-half_w; dir_x*=-1; }
if (y-half_h <= top_bound){ y=top_bound+half_h; dir_y*=-1; }
if (y+half_h >= bottom_bound){ y=bottom_bound-half_h; dir_y*=-1; }

// Atacar
fire_timer--;
if (fire_timer <= 0 && instance_exists(obj_auro)) {
    var dist = point_distance(x,y,obj_auro.x,obj_auro.y);
    if (dist >= shoot_distance) {
        var b;

        b = instance_create_layer(x,y,"Instances",obj_balainimiga); b.hspd=6;  b.vspd=0;
        b = instance_create_layer(x,y,"Instances",obj_balainimiga); b.hspd=-6; b.vspd=0;
        b = instance_create_layer(x,y,"Instances",obj_balainimiga); b.hspd=0;  b.vspd=6;
        b = instance_create_layer(x,y,"Instances",obj_balainimiga); b.hspd=0;  b.vspd=-6;

        // Define limites da área jogável para as balas
        with(obj_balainimiga){
            left_bound = 435; right_bound = 1205;
            top_bound = 0; bottom_bound = 1492;
        }
    }
    fire_timer = fire_rate;
}