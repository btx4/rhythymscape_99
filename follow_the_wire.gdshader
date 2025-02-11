shader_type canvas_item;

uniform float radius : hint_range(0.0, 200.0) = 100.0;
uniform float transparency : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 mouse_pos = SCREEN_UV * SCREEN_PIXEL_SIZE.xy * vec2(textureSize(TEXTURE, 0));
    vec2 frag_pos = FRAGCOORD.xy;
    
    float dist = distance(frag_pos, mouse_pos);
    
    float alpha = texture(TEXTURE, UV).a;
    
    if (dist < radius) {
        alpha *= mix(1.0, transparency, smoothstep(0.0, radius, dist));
    }

    COLOR = texture(TEXTURE, UV) * vec4(1.0, 1.0, 1.0, alpha);
}
