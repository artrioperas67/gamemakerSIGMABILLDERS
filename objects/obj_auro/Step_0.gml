var spd = 10;

var rightK = keyboard_check(vk_right) or keyboard_check(ord("D"));
var leftK  = keyboard_check(vk_left) or keyboard_check(ord("A"));
var upK    = keyboard_check(vk_up) or keyboard_check(ord("W"));
var downK  = keyboard_check(vk_down) or keyboard_check(ord("S"));

var xspd = (rightK - leftK);
var yspd = (downK - upK);

var len = point_distance(0, 0, xspd, yspd);
if (len > 0) 
{
    xspd /= len;
    yspd /= len;
}

var nx = x + xspd * spd;
var ny = y + yspd * spd;

if (!place_meeting(nx, y, obj_limite)) x = nx;
if (!place_meeting(x, ny, obj_limite)) y = ny;