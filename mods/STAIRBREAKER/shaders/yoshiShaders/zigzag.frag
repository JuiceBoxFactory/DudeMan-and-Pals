#pragma header

uniform float uTime = 0;
uniform float uAmt = 1;
void main() { 
    // vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
    gl_FragColor = texture2D(bitmap, openfl_TextureCoordv + vec2(sin(openfl_TextureCoordv.y * uAmt + uTime * 2) * 0.25, 0));
}