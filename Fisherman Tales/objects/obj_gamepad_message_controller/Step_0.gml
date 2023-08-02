// Verificar se o gamepad foi conectado
if (gamepad_is_connected(global.controle) && !is_gamepad_connected && !string_pos("Gamepad Conectado", gamepad_message_text)) {
    gamepad_message_timer = gamepad_message_duration;
    gamepad_message_text = "Gamepad Conectado";
    is_gamepad_connected = true;
}

// Verificar se o gamepad foi desconectado
if (!gamepad_is_connected(global.controle) && is_gamepad_connected && !string_pos("Gamepad Desconectado", gamepad_message_text)) {
    gamepad_message_timer = gamepad_message_duration;
    gamepad_message_text = "Gamepad Desconectado";
    is_gamepad_connected = false;
}

// Contagem regressiva para ocultar a mensagem
if (gamepad_message_timer > 0) {
    gamepad_message_timer--;
} else {
    // Limpar a mensagem quando o timer acabar
    gamepad_message_text = "";
}
