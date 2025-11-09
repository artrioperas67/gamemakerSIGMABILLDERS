// Supondo que o sprite da animação está nesse próprio objeto
if (!tempo_final && image_index >= image_number - 1) {
    tempo_final = true;

    // Espera 1 segundo antes de trocar de room (opcional)
    alarm[0] = room_speed;
}