#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_texCoord;
uniform sampler2D u_texture;
uniform vec4 v_teamColor;

void main()
{
    vec4 finalColor = texture2D(u_texture, v_texCoord);
    finalColor = finalColor * vec4(0.3, 0.59, 0.11, 1.0);
    float luminance = (finalColor.r + finalColor.g + finalColor.b) * 2.0;
    
    finalColor.rgb = mix(vec3(luminance, luminance, luminance) * v_teamColor.rgb, texture2D(u_texture, v_texCoord).rgb, 0.5);
    
    gl_FragColor = clamp(finalColor, 0.0, 1.0);
}

