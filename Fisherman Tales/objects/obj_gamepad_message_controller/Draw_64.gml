if (gamepad_message_timer > 0) {
    draw_set_font(font);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(screen_fixed_x, screen_fixed_y, gamepad_message_text);
}
