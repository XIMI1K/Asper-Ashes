function getControls()
{
	//кнопки
	right_key = keyboard_check(ord("D"));
	right_key = clamp(right_key, 0, 1);
	left_key = keyboard_check(ord("A"));
	left_key = clamp(left_key, 0, 1);
	//другие
	jump_key_press = keyboard_check_pressed(vk_space);
	jump_key_press = clamp( jump_key_press, 0, 1);
}