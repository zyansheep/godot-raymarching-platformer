shader_type canvas_item;

//uniform mat4 transform;
uniform vec3 color;

vec4 mainSDF(vec3 p) {
	float len = length( vec4(p, 1.0) ) - 0.5;
	return vec4(color, len);
}