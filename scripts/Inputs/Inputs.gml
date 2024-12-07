function controlsSetup()
{
	buffer_time = 3;
	jump_key_buffer = 0;
	jump_buffer_time = 0;
}

function getControls()
{
	//кнопки
	right_key = keyboard_check(ord("D"));
		right_key = clamp(right_key, 0, 1 );
	left_key = keyboard_check(ord("A"));
		left_key = clamp(left_key, 0, 1 );
	//другие
	jump_key_press = keyboard_check_pressed(vk_space);
		jump_key_press = clamp( jump_key_press, 0, 1 );
	jump_key = keyboard_check(vk_space);
		jump_key = clamp( jump_key, 0, 1 );
	#region buffer
	if jump_key_press
	{
		jump_buffer_time = buffer_time;
	}
	if jump_buffer_time > 0
	{
		jump_key_buffer = 1;
		jump_buffer_time--;
	}
	else
	{
		jump_key_buffer = 0;
	}
	#endregion
}