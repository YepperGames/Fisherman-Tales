/// Step Event of obj_gamepad_message

// Verificar se há uma mensagem para ser exibida
if (gamepad_message_timer > 0) {
    gamepad_message_timer--;
    
    // Exibir a mensagem
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(font); // Defina aqui a fonte que você está usando para o texto
    draw_set_color(c_white); // Defina aqui a cor do texto
    draw_text(10, 10, gamepad_message_text); // Defina aqui a posição do texto na tela
} else {
    // Limpar a mensagem quando o timer acabar
    gamepad_message_text = "";
}
