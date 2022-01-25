#version 330

uniform sampler2D u_Texture; // The texture to be read from by this shader
uniform int u_Time;

in vec3 fs_Pos;
in vec3 fs_Nor;

// TODO
in vec3 fs_LightVec;

layout(location = 0) out vec3 out_Col;

void main()
{
    vec3 n = normalize(fs_Nor);
    vec3 l = normalize(fs_LightVec);

    float t = clamp(dot(n, l), 0, 1);

    t *= sin(u_Time * 1.f);

    vec3 a = vec3(0.8, 0.5, 0.4);
    vec3 b = vec3(0.2, 0.4, 0.2);
    vec3 c = vec3(2.0, 1.0, 1.0);
    vec3 d = vec3(0.00, 0.25, 0.25);
    out_Col = a + b * cos(2 * 3.14159265375 * (c * t + d));
}
