with (other) instance_destroy(); // destroi o tiro do auro
hp -= 1;

if (hp <= 0) {
    instance_destroy(); // só morre na 2ª hit
}