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
if jump_key_press && place_meeting(x, y+1, obj_wall)
{
	yspd = jspd;
}
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
	yspd = 0;
}

	y += yspd;
#endregion