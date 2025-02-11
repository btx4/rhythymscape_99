shader_type canvas_item;

uniform float fade_strength : hint_range(0.0, 1.0) = 0.5;
uniform float fade_size : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Get vertical position in UV coordinates (0 at bottom, 1 at top)
    float vertical = UV.y;
    
    // Inverse fade effect: More opaque at the center, more transparent at edges
    float fade = 1.0 - abs(vertical - 0.5) / fade_size;
    
    // Smooth fade effect for a natural transition
    float alpha = mix(tex_color.a, tex_color.a * (1.0 - fade_strength), smoothstep(0.0, 1.0, fade));

    COLOR = vec4(tex_color.rgb, alpha);
}
