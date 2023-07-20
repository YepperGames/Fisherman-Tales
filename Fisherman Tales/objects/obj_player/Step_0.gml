// código de andar
// variáveis que armazenam os cliques do teclado
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _run_key_pressed = keyboard_check(vk_shift);

// liga a variável de correr
//if _run_key_pressed{
//	running = !running;
//}

// liga a variável de correr
if keyboard_check_pressed(vk_shift) {
    running = true;
} else if (keyboard_check_released(vk_shift)) {
    running = false;
}

// coloca a velocidade de movimento a velocidade de correr
if running == true{
	my_speed = run_speed;
} else {
	my_speed = walk_speed;
}

// adiciona o valor 1 para o lado esquerdo (nesse caso, direita e cima) e -1 para o lado direito
var _xinput = _right - _left;
var _yinput = _down - _up;

// se move para o angulo x e y de acordo com a velocidade, colide com um objeto
move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall)
//move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall_inv)

// Trocar sprite do boneco andando ou correndo ou parado
if _xinput != 0 or _yinput != 0 {
    // Movendo em alguma direção
    if _yinput < 0 {
        sprite_index = running ? spr_player_char_running_up : spr_player_char_walking_up;
    } else if _yinput > 0 {
        sprite_index = running ? spr_player_char_running_down : spr_player_char_walking_down;
    } else if _xinput < 0 {
        sprite_index = running ? spr_player_char_running_left : spr_player_char_walking_left;
    } else if _xinput > 0 {
        sprite_index = running ? spr_player_char_running_right : spr_player_char_walking_right;
    }
} else {
    // Personagem parado
    if sprite_index == spr_player_char_running_up or
       sprite_index == spr_player_char_walking_up {
        sprite_index = spr_player_char_standing_up;
    } else if sprite_index == spr_player_char_running_down or
              sprite_index == spr_player_char_walking_down {
        sprite_index = spr_player;
    } else if sprite_index == spr_player_char_running_left or
              sprite_index == spr_player_char_walking_left {
        sprite_index = spr_player_char_standing_left;
    } else if sprite_index == spr_player_char_running_right or
              sprite_index == spr_player_char_walking_right {
        sprite_index = spr_player_char_standing_right;
    }
}

// se o player tiver o valor de x ou y < 0 ele está correndo, se for > 0 andando, e = 0 parado
