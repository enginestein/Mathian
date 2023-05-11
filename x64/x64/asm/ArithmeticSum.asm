.method /*06000002*/ public hidebysig static 
        float64  'ArithmeticSum'(float64 'firstTerm',
                                 float64 'commonDifference',
                                 int32 'numTerms') cil managed
// SIG: 00 03 0D 0D 0D 08
{
  // Method begins at RVA 0x2088
  // Code size       37 (0x25)
  .maxstack  4
  .locals /*11000002*/ init ([0] float64 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\calculus\ap.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 04   |                  */ ldarg.2
  IL_0002:  /* 6C   |                  */ conv.r8
  IL_0003:  /* 23   | 0000000000000040 */ ldc.r8     2.
  IL_000c:  /* 02   |                  */ ldarg.0
  IL_000d:  /* 5A   |                  */ mul
  IL_000e:  /* 04   |                  */ ldarg.2
  IL_000f:  /* 17   |                  */ ldc.i4.1
  IL_0010:  /* 59   |                  */ sub
  IL_0011:  /* 6C   |                  */ conv.r8
  IL_0012:  /* 03   |                  */ ldarg.1
  IL_0013:  /* 5A   |                  */ mul
  IL_0014:  /* 58   |                  */ add
  IL_0015:  /* 5A   |                  */ mul
  IL_0016:  /* 23   | 0000000000000040 */ ldc.r8     2.
  IL_001f:  /* 5B   |                  */ div
  IL_0020:  /* 0A   |                  */ stloc.0
  IL_0021:  /* 2B   | 00               */ br.s       IL_0023
  IL_0023:  /* 06   |                  */ ldloc.0
  IL_0024:  /* 2A   |                  */ ret
} // end of method 'ArithmeticProgression'::'ArithmeticSum'

