shader_type canvas_item;

uniform float desaturation: hint_range(0.0, 1.0); // Control the desaturation level
uniform float opacity: hint_range(0.0, 1.0); // Control the desaturation level

void fragment() {
    vec3 color = texture(TEXTURE, UV).rgb;
    float gray = dot(color, vec3(0.299, 0.587, 0.114)); // Convert to grayscale
    vec3 desaturated = mix(color, vec3(gray), desaturation); // Interpolate between color & gray
    COLOR = vec4(desaturated, opacity);
}