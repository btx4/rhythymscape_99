shader_type canvas_item;

uniform vec4 glow_color; // Color of the glow (will be set dynamically)
uniform float glow_strength = 2.0; // Strength of the glow
uniform float glow_spread = 0.5; // Spread of the glow

void fragment() {
    float dist = length(UV - vec2(0.5));
    float glow = smoothstep(glow_spread, 0.0, dist);
    glow *= glow_strength;
    vec4 final_color = glow_color * glow;
    COLOR = final_color + texture(TEXTURE, UV) * (1.0 - final_color.a);
}