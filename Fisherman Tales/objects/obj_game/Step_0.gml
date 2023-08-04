/// Step Event (obj_game)

fps_frame_count++; // Incrementar o contador de frames a cada frame renderizado

// Verificar se o tempo de atualização do FPS foi alcançado
if (fps_frame_count >= fps_update_timer * room_speed) {
    fpsa = fps_frame_count / fps_update_timer; // Calcular o FPS
    fps_frame_count = 0; // Reiniciar o contador de frames
}
