/// @desc core player logic

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,red_wall)) && (key_jump)
{
vsp = -jumpsp	
}
	
//Horizontal Collision
if (place_meeting(x+hsp,y,red_wall))

{
	while (!place_meeting(x+sign(hsp),y,red_wall))
	{
	x = x + sign(hsp);	
	}
hsp = 0;	
}
x = x + hsp;

//vertical collision 

if (place_meeting(x,y+vsp,red_wall))

{
	while (!place_meeting(x,y+sign(vsp),red_wall))
	{
	y = y + sign(vsp);	
	}
vsp = 0;	
}
y = y + vsp;

//Animation

if (!place_meeting(x,y+1,red_wall))
{
	sprite_index = S_playerA;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
	
	
}
else
{
image_speed = 1;
if (hsp == 0)
{
	sprite_index = Walk_1;
}
else
{
	sprite_index = S_walk;
}
}
if (hsp != 0) image_xscale = sign(hsp);