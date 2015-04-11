
sampler BaseTex;
sampler SpotLightTex;
sampler StringTex;

struct PS_INPUT
{
    float2 base      : TEXCOORD0;
    float2 spotlight : TEXCOORD1;
    float2 text      : TEXCOORD2;
};

struct PS_OUTPUT
{
    vector diffuse : COLOR0;
};


PS_OUTPUT Main(PS_INPUT input)
{
    // zero out members of output
    PS_OUTPUT output = (PS_OUTPUT)0;

    // sample appropriate textures
    vector b = tex2D(BaseTex,      input.base);
    vector s = tex2D(SpotLightTex, input.spotlight);
    vector t = tex2D(StringTex,    input.text);

    // combine texel colors
    vector c = b * s + t;

    // increase the intensity of the pixel slightly
    c += 0.1f;

    // save the resulting pixel color
    output.diffuse = c;

    return output;
}