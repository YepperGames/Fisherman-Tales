/// Draw GUI Event (obj_game)

// Definir a cor e a fonte para exibir o FPS
draw_set_color(c_white);
draw_set_font(fnt_menu); // Use a fonte que preferir

// Exibir o FPS na tela (pode ajustar a posição conforme desejar)
draw_text(10, 10, "FPS: " + string(fps));
