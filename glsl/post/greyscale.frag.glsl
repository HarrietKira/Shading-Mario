#version 150

in vec2 fs_UV;

out vec3 color;

uniform sampler2D u_RenderedTexture;

void main()
{
    // grey
    vec4 previousColor = texture(u_RenderedTexture, fs_UV);
    float grey = 0.21 * previousColor.r + 0.72 * previousColor.g + 0.07 * previousColor.b;
    // vignette
    vec2 pt = vec2(0.5, 0.5);   // center
    float dist = distance(fs_UV, pt);
    color = vec3(grey - dist);
}
