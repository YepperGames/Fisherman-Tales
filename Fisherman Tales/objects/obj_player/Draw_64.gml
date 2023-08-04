// No evento Draw GUI do objeto obj_player

// Resto do código...

// Se o jogador estiver pescando, desenhar a barra de pesca
if (fishing) {
    var bar_width = 96; // Largura da barra de pesca (ajuste conforme necessário)
    var bar_height = 16; // Altura da barra de pesca (ajuste conforme necessário)
    var bar_x = display_get_width() / 2 - bar_width / 2; // Posição X para centralizar a barra no meio da tela
    var bar_y = display_get_height() / 2 - bar_height / 2 - 80; // Posição Y para posicionar a barra acima do centro da tela

    // Definir cor de fundo (preto)
    draw_set_color(c_black);
    // Desenhar o fundo da barra de pesca (parte não preenchida)
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

    // Definir cor de preenchimento (verde)
    draw_set_color(c_lime);
    // Calcular a largura preenchida da barra de pesca com base no medidor de pesca
    var fill_width = bar_width * fish_meter / fish_max_meter;
    // Desenhar a parte preenchida da barra de pesca
    draw_rectangle(bar_x, bar_y, bar_x + fill_width, bar_y + bar_height, false);
}
