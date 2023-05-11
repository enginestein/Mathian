.method /*06000031*/ public hidebysig static 
        float32  'Abs'(float32 'value') cil managed
// SIG: 00 01 0C 0C
{
  // Method begins at RVA 0x35d0
  // Code size       19 (0x13)
  .maxstack  2
  .locals /*1100001E*/ init ([0] float32 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\computing\basic.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 22   | 00000000         */ ldc.r4     0.0
  IL_0007:  /* 2F   | 04               */ bge.s      IL_000d
  IL_0009:  /* 02   |                  */ ldarg.0
  IL_000a:  /* 65   |                  */ neg
  IL_000b:  /* 2B   | 01               */ br.s       IL_000e
  IL_000d:  /* 02   |                  */ ldarg.0
  IL_000e:  /* 0A   |                  */ stloc.0
  IL_000f:  /* 2B   | 00               */ br.s       IL_0011
  IL_0011:  /* 06   |                  */ ldloc.0
  IL_0012:  /* 2A   |                  */ ret
} // end of method 'Basic'::'Abs'

