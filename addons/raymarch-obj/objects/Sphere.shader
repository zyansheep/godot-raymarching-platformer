shader_type canvas_item;

uniform mat4 transform;
uniform vec3 color;

vec4 mainSDF(vec3 p) {
	vec4 tp = transform * vec4(p,1.0);
	float len = length(tp.xyz) - 0.5;
	//vec3 color = vec3(0,0,255);
	return vec4(color, len);
}