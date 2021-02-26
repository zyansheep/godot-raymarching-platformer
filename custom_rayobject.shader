shader_type canvas_item;

float mainSDF( vec3 p ) {
	vec3 b = vec3(1,1,1);
	vec3 q = abs(p) - b;
	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0);
}