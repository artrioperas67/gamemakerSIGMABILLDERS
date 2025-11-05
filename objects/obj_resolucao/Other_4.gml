// Reaplica a resolução toda vez que mudar de room
surface_resize(application_surface, global.base_w, global.base_h);

if (view_enabled && view_camera[0] != noone) {
    camera_set_view_size(view_camera[0], global.base_w, global.base_h);
}