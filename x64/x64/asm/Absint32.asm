.method /*06000032*/ public hidebysig static 
        int32  'Abs'(int32 'value') cil managed
// SIG: 00 01 08 08
{
  // Method begins at RVA 0x35f0
  // Code size       15 (0xf)
  .maxstack  2
  .locals /*1100001F*/ init ([0] int32 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\computing\basic.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 16   |                  */ ldc.i4.0
  IL_0003:  /* 2F   | 04               */ bge.s      IL_0009
  IL_0005:  /* 02   |                  */ ldarg.0
  IL_0006:  /* 65   |                  */ neg
  IL_0007:  /* 2B   | 01               */ br.s       IL_000a
  IL_0009:  /* 02   |                  */ ldarg.0
  IL_000a:  /* 0A   |                  */ stloc.0
  IL_000b:  /* 2B   | 00               */ br.s       IL_000d
  IL_000d:  /* 06   |                  */ ldloc.0
  IL_000e:  /* 2A   |                  */ ret
} // end of method 'Basic'::'Abs'

