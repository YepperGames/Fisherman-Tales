cam = view_camera[0];

follow = obj_player;

// pega o meio da câmera pra centralizar o boneco
w_half = camera_get_view_width(cam) / 2;
h_half = camera_get_view_height(cam) / 2;

// camera se move um pouco atras do jogador
targetX = xstart;
targetY = ystart;

spd = 20;