// código de andar

if keyboard_check(vk_up)
{
	y-=spd;
	sprite_index=spr_player_correndo_cima;
}
if keyboard_check(ord("W"))
{
    y-=spd;
	sprite_index=spr_player_correndo_cima;
}
if keyboard_check(vk_down)
{
	y+=spd;
	sprite_index=sprite_player_correndo_baixo;
}
if keyboard_check(ord("S"))
{
    y+=spd;
	sprite_index=sprite_player_correndo_baixo;
}
if keyboard_check(vk_right)
{
	x+=spd;
	sprite_index=spr_player_correndo_direita;
}
if keyboard_check(ord("D"))
{
    x+=spd;
	sprite_index=spr_player_correndo_direita;
}
if keyboard_check(vk_left)
{
	x-=spd;
	sprite_index=spr_player_correndo_esquerda
}
if keyboard_check(ord("A"))
{
    x-=spd;
	sprite_index=spr_player_correndo_esquerda
}
if keyboard_check(vk_space)
{
    room_restart();
}