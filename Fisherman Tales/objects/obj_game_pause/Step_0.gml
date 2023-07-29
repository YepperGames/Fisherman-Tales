script_execute(get_input);

// Step Event 0 do obj_game_pause
if key_pause {
    if (room != rm_pause) {
        // Entrar no menu de pausa
        obj_player.persistent = false;
        instance_activate_all();
        game_room = room; // Armazena a room do jogo
        room_goto(rm_pause);
    } else {
        // Sair do menu de pausa e voltar à room do jogo
        if (game_room != -1) {
            instance_deactivate_all(true);
            room_goto(game_room);
            game_room = -1; // Reseta a variável
        }
    }
}
