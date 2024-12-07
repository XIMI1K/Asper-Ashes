controlsSetup();
#region управление инициализация
move_dir = 0;
move_spd = 2;
xspd = 0;
yspd = 0;
#endregion
#region прыжки
grav = .250;
term_vel = 4;
on_ground = true;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
//отдельные прыжки
jump_hold_frames[0] = 18;
jump_hold_frames[1] = 10;
jspd[1] = -4.15;
jspd[0] = -3.85;
#endregion