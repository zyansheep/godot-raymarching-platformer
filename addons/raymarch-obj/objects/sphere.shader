shader_type canvas_item;

float mainSDF( vec3 p ) {
 	return length(p - vec3(5.0)) - 1.0;
}