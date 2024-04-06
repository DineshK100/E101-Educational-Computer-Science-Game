/// @description Insert description here
// You can write your code in this editor


var B1  = layer_get_id("B1");
var B2  = layer_get_id("B2");
var B3  = layer_get_id("B3");
var B4  = layer_get_id("B4");



layer_x(B1, lerp(0,camera_get_view_x(view_camera[0]),0.5 ));
layer_x(B2, lerp(0,camera_get_view_x(view_camera[0]),0.7 ));
layer_x(B3, lerp(0,camera_get_view_x(view_camera[0]),0.85 ));
layer_x(B4, lerp(0,camera_get_view_x(view_camera[0]),0.9 ));