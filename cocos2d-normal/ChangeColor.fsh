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
    vec4 finalColor = texture2D(u_texture, v_texCoord);
    finalColor = finalColor * vec4(0.3, 0.59, 0.11, 1.0);
    float luminance = (finalColor.r + finalColor.g + finalColor.b) * 1.0;
    vec3 lerpColor = mix(v_fromColor.rgb, v_toColor.rgb, f_time);
    float lerpAlpha = mix(v_fromColor.a, v_toColor.a, f_time);
    finalColor.rgb = clamp(vec3(luminance, luminance, luminance) * lerpColor.rgb, 0.0, 1.0);
    finalColor *= lerpAlpha;
    gl_FragColor = finalColor;
}
