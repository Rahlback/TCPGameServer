shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 main_color = COLOR;
	vec4 test_color = vec4(UV.r, UV.g, 0.0, 1.0);
	COLOR = mix(main_color, test_color, vec4(0.5, 0.5, 0.5, 1.0));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
