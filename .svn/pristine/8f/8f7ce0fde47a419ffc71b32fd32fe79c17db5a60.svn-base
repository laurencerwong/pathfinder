#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_texCoord;
uniform sampler2D u_texture;
uniform vec4 v_toColor;
uniform vec4 v_fromColor;
uniform float f_time;

void main()
{
    vec4 lerpColor = mix(v_fromColor, v_toColor, f_time*3.0);
    lerpColor = clamp(lerpColor, 0.0, 1.0);
    gl_FragColor = lerpColor;
}
