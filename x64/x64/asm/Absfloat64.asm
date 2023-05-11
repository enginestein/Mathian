.method /*06000030*/ public hidebysig static 
        float64  'Abs'(float64 'value') cil managed
// SIG: 00 01 0D 0D
{
  // Method begins at RVA 0x35ac
  // Code size       23 (0x17)
  .maxstack  2
  .locals /*11000002*/ init ([0] float64 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\computing\basic.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 23   | 0000000000000000 */ ldc.r8     0.0
  IL_000b:  /* 2F   | 04               */ bge.s      IL_0011
  IL_000d:  /* 02   |                  */ ldarg.0
  IL_000e:  /* 65   |                  */ neg
  IL_000f:  /* 2B   | 01               */ br.s       IL_0012
  IL_0011:  /* 02   |                  */ ldarg.0
  IL_0012:  /* 0A   |                  */ stloc.0
  IL_0013:  /* 2B   | 00               */ br.s       IL_0015
  IL_0015:  /* 06   |                  */ ldloc.0
  IL_0016:  /* 2A   |                  */ ret
} // end of method 'Basic'::'Abs'

