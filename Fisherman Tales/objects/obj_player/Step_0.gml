// Código de andar
// Variáveis que armazenam os cliques do teclado e do gamepad

gamepad_set_axis_deadzone(global.controle, 0.25);

var _up = keyboard_check(vk_up) or keyboard_check(ord("W")) or gamepad_axis_value(global.controle, gp_axislv) < -0.25;
var _down = keyboard_check(vk_down) or keyboard_check(ord("S")) or gamepad_axis_value(global.controle, gp_axislv) > 0.25;
var _right = keyboard_check(vk_right) or keyboard_check(ord("D")) or gamepad_axis_value(global.controle, gp_axislh) > 0.25;
var _left = keyboard_check(vk_left) or keyboard_check(ord("A")) or gamepad_axis_value(global.controle, gp_axislh) < -0.25;
var _run_button_pressed = keyboard_check(vk_shift) or gamepad_button_check(global.controle, gp_face1);

// Ligar a variável de correr
if _run_button_pressed {
    running = false;
} else if (keyboard_check_released(vk_shift) or gamepad_button_check_released(global.controle, gp_face1)) {
    running = true;
}

// Colocar a velocidade de movimento a velocidade de correr
if running == true {
    my_speed = run_speed;
} else {
    my_speed = walk_speed;
}

// Adicionar o valor 1 para o lado esquerdo (nesse caso, direita e cima) e -1 para o lado direito
var _xinput = _right - _left;
var _yinput = _down - _up;

// Mover para o ângulo x e y de acordo com a velocidade, colidir com um objeto
move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall);

// Trocar sprite do boneco andando ou correndo ou parado
if _xinput != 0 or _yinput != 0 {
    // Prioridade para movimento diagonal
    if _xinput > 0 {
        if _yinput > 0 {
            sprite_index = running ? spr_player_char_running_right : spr_player_char_walking_right;
        } else if _yinput < 0 {
            sprite_index = running ? spr_player_char_running_right : spr_player_char_walking_right;
        } else {
            sprite_index = running ? spr_player_char_running_right : spr_player_char_walking_right;
        }
    } else if _xinput < 0 {
        if _yinput > 0 {
            sprite_index = running ? spr_player_char_running_left : spr_player_char_walking_left;
        } else if _yinput < 0 {
            sprite_index = running ? spr_player_char_running_left : spr_player_char_walking_left;
        } else {
            sprite_index = running ? spr_player_char_running_left : spr_player_char_walking_left;
        }
    } else {
        if _yinput > 0 {
            sprite_index = running ? spr_player_char_running_down : spr_player_char_walking_down;
        } else if _yinput < 0 {
            sprite_index = running ? spr_player_char_running_up : spr_player_char_walking_up;
        }
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

// Se o player tiver o valor de x ou y < 0 ele está correndo, se for > 0 andando, e = 0 parado

// Ajustar a ordem de renderização
depth = -y; // Isso fará com que o objeto seja renderizado acima dos objetos que estiverem em uma posição y maior (acima na tela)

// Verificar se o personagem está correndo e se não está no modo de pausa
if (running && !inPause) {
    // Se o personagem estiver se movendo, aumentar o timer para criar a fumacinha
    if (_xinput != 0 or _yinput != 0) {
        smoke_timer++;
        
        // Se o timer atingir um valor específico, criar a fumacinha
        if (smoke_timer == 10) { // Valor ajustável para controlar o tempo de criação da fumacinha
            var smoke_instance = instance_create_layer(x, y, "Instances", obj_smoke);
            smoke_timer = 0; // Reiniciar o timer para criar a próxima fumacinha
            
            // Se o personagem estiver correndo, ajustar a sprite da fumacinha de acordo com a direção
            if (_xinput > 0) {
                smoke_instance.sprite_index = spr_smoke_right;
            } else if (_xinput < 0) {
                smoke_instance.sprite_index = spr_smoke_left;
            } else if (_yinput > 0) {
                smoke_instance.sprite_index = spr_smoke_down;
            } else if (_yinput < 0) {
                smoke_instance.sprite_index = spr_smoke_up;
            }
        }
    } else {
        smoke_timer = 0; // Reiniciar o timer se o personagem parar de se mover
    }
}

// Se o personagem estiver correndo, ajustar a sprite de acordo com a direção
if (running) {
    if (_xinput > 0) {
        sprite_index = spr_player_char_running_right;
    } else if (_xinput < 0) {
        sprite_index = spr_player_char_running_left;
    }
}
