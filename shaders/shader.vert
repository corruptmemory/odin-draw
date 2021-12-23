#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

// Vertex attributes
layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

// Instanced attributes
layout(location = 3) in vec3 instancePos;
layout(location = 4) in vec3 instanceRot;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    mat3 mx, my, mz;

    // rotate around x
    float s = sin(instanceRot.x);
    float c = cos(instanceRot.x);

    mx[0] = vec3(c, s, 0.0);
    mx[1] = vec3(-s, c, 0.0);
    mx[2] = vec3(0.0, 0.0, 1.0);

    // rotate around y
    s = sin(instanceRot.y);
    c = cos(instanceRot.y);

    my[0] = vec3(c, 0.0, s);
    my[1] = vec3(0.0, 1.0, 0.0);
    my[2] = vec3(-s, 0.0, c);

    // rot around z
    s = sin(instanceRot.z);
    c = cos(instanceRot.z);

    mz[0] = vec3(1.0, 0.0, 0.0);
    mz[1] = vec3(0.0, c, s);
    mz[2] = vec3(0.0, -s, c);

    mat3 rotMat = mz * my * mx;

    vec4 locPos = vec4(inPosition.xyz * rotMat, 1.0);

    gl_Position = ubo.proj * ubo.view * ubo.model * (locPos + vec4(instancePos, 0.0));
    fragColor = inColor;
    fragTexCoord = inTexCoord;
}
