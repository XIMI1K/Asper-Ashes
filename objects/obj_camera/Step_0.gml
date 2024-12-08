if keyboard_check_pressed(vk_f8)
{
 window_set_fullscreen(!window_get_fullscreen());
}
if !instance_exists(obj_player) exit;
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);
var _cam_x = obj_player.x - _cam_width/2;
var _cam_y = obj_player.y - _cam_height/2;
_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);
final_cam_x += (_cam_x - final_cam_x) * cam_trail_spd;
final_cam_y += (_cam_y - final_cam_y) * cam_trail_spd;
camera_set_view_pos(view_camera[0], final_cam_x, final_cam_y);
layer_x("parallax_Background", _cam_x * 1.3);
layer_x("parallax_Backgrounds_1", _cam_x * 0.8);
layer_x("parallax_Backgrounds_2", _cam_x * 0.7);
layer_x("parallax_Backgrounds_3", _cam_x * 0.6);
layer_x("parallax_Backgrounds_4", _cam_x * 0.5);
layer_x("parallax_Backgrounds_5", _cam_x * 0.9);