shader_type canvas_item;

vec4 mainSDF( vec3 p ) {
 	return vec4(1.,0.,0., length(p - vec3(5.0)) - 1.0);
}