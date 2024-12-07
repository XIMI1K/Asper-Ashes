#region ввод для управления (x)
getControls()
move_dir = right_key - left_key;
xspd = move_dir * move_spd;
#endregion
#region коллизия
var _sub_pixel = .5;
if place_meeting(x + xspd, y, obj_wall)
{
	var _pixel_check = _sub_pixel * sign(xspd);
	while !place_meeting(x + _pixel_check, y, obj_wall)
	{
		x += _pixel_check;
	}
	xspd = 0;
}
#endregion
#region движение
x += xspd;
#endregion
#region ввод для управления (y)
yspd += grav;
if on_ground
{
	jump_count = 0;
	jump_hold_timer = 0;
}
else
{
	if jump_count == 0 {jump_count = 1; };
}
if jump_key_buffer && jump_count < jump_max
{
	jump_key_buffer = false;
	jump_buffer_time = 0;
	jump_count++;
	jump_hold_timer = jump_hold_frames[jump_count-1];
	if !jump_key
	{
		jump_hold_timer = 0;
	}
	if jump_hold_timer > 0
	{
		yspd = jspd[jump_count - 1];
		jump_hold_timer--;
	}
}
if yspd > term_vel { yspd = term_vel; };
#endregion
#region коллизия по y
 _sub_pixel = .5;
if place_meeting(x, y + yspd,obj_wall)
{
	var _pixel_check = _sub_pixel * sign(yspd);
	while !place_meeting(x, y + _pixel_check, obj_wall)
	{
		y += _pixel_check;
	}
	if yspd < 0
	{
		jump_hold_timer = 0;
	}
	yspd = 0;
}
if yspd >= 0 && place_meeting(x, y+1, obj_wall)
	{
		on_ground = true;
	}
	else 
	{
	 on_ground = false;
	}

	y += yspd;
#endregion
#region перекаты
if (!rolling) {
    if (keyboard_check_pressed(vk_shift)) {


        rolling = true; // Активируем перекат
        roll_timer = roll_duration; // Устанавливаем таймер
	}
}
		if (rolling)
		{
	    if (!place_meeting(x + xspd, y, obj_wall))
		{
        x += xspd;
	}
		if (!place_meeting(x, y + yspd, obj_wall))
		{
        y += yspd;
    }
    roll_timer--;
    if (roll_timer <= 0)
		{
        rolling = false; // Завершаем перекат
    }
} 

if (rolling)
{
    sprite_index = s_hover; // Спрайт переката
} 
else
{
    sprite_index = s_player; // Обычный спрайт
}
if (rolling)
{
    invincible = true;
} 
else
{
    invincible = false;
}
if (!invincible) { 
	//тут урон типа
}
#endregion