#version 150

uniform ivec2 u_Dimensions;
uniform int u_Time;

in vec2 fs_UV;

out vec3 color;

uniform sampler2D u_RenderedTexture;

void main()
{
    vec2 uv = fs_UV;
    float interval = (smoothstep(-1, 1, sin(u_Time * 0.02))) + 0.5;
    float xOffset = uv.x * (cos(u_Time * 3.1415926 + uv.y)) / 200000;
    float yOffset = uv.y * (cos(u_Time * 3 + 50* uv.y)) / 30;
    float xShake = (xOffset / interval) + uv.x;
    float yShake = (-yOffset/interval) - (0.01 - uv.y);
    vec2 shake = vec2(xShake, yShake);
    vec3 shakeOffset = vec3(texture(u_RenderedTexture, shake));
    shakeOffset /= (interval * 3);
    vec2 size = vec2(textureSize(u_RenderedTexture, 0));
    float offset = 20 / size.x;
    vec2 redOffset = vec2(uv.x + offset, uv.y);
    vec2 greenOffset = vec2(uv.x - offset, uv.y);
    vec2 blueOffset = vec2(uv.x, uv.y + offset);
    vec3 colorOffset = vec3(texture(u_RenderedTexture, redOffset).r,
                            texture(u_RenderedTexture, greenOffset).g,
                            texture(u_RenderedTexture, blueOffset).b);
    color = shakeOffset + colorOffset;
}
