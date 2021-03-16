shader_type canvas_item;

vec4 mainSDF( vec3 p ) {
	vec3 b = vec3(1,1,1);
	vec3 q = abs(p - b);
	// Return Color as xyz and distance as w
	return vec4(0.,1.,0.,length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0));
}