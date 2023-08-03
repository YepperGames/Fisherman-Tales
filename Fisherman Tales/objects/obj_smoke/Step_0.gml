// Reduzir o tempo de vida da fumacinha
smoke_duration--;

// Destruir a fumacinha quando o tempo de vida acabar
if (smoke_duration <= 0) {
    instance_destroy();
}

// Verificar a direção do personagem e definir o sprite da fumacinha
if (smoke_direction == "up") {
    sprite_index = spr_smoke_up;
} else if (smoke_direction == "down") {
    sprite_index = spr_smoke_down;
} else if (smoke_direction == "left") {
    sprite_index = spr_smoke_left;
} else if (smoke_direction == "right") {
    sprite_index = spr_smoke_right;
}