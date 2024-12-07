#region перекаты
if (!rolling) {
    if (keyboard_check_pressed(vk_shift)) {


        rolling = true; // Активируем перекат
        roll_timer = roll_duration; // Устанавливаем таймер
			}
		}
		if (rolling) {
    var _hspeed_temp = lengthdir_x(roll_speed, direction);
    var _vspeed_temp = lengthdir_y(roll_speed, direction);
	    if (!place_meeting(x + _hspeed_temp, y, obj_wall))
		{
        x += _hspeed_temp; // Двигаемся по X
    }
		    if (!place_meeting(x, y + _vspeed_temp, obj_wall)) {
        y += _vspeed_temp; // Двигаемся по Y
    }
    roll_timer--;
    if (roll_timer <= 0) {
        rolling = false; // Завершаем перекат
    }

} 
else
{
	getControls()
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
}
#endregion