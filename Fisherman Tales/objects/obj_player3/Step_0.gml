// variáveis que armazenam os cliques do teclado
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));

// adiciona o valor 1 para o lado esquerdo (nesse caso, direita e cima) e -1 para o lado direito
var _xinput = _right - _left;
var _yinput = _down - _up;

// se move na velocidade inicial para o angulo x e y, colide com um objeto
move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall)