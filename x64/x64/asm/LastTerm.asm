.method /*06000009*/ public hidebysig static 
        float64  'LastTerm'(float64 'a1',
                            int32 'n',
                            float64 'd') cil managed
// SIG: 00 03 0D 0D 08 0D
{
  // Method begins at RVA 0x2190
  // Code size       14 (0xe)
  .maxstack  3
  .locals /*11000002*/ init ([0] float64 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\calculus\ap.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 03   |                  */ ldarg.1
  IL_0003:  /* 17   |                  */ ldc.i4.1
  IL_0004:  /* 59   |                  */ sub
  IL_0005:  /* 6C   |                  */ conv.r8
  IL_0006:  /* 04   |                  */ ldarg.2
  IL_0007:  /* 5A   |                  */ mul
  IL_0008:  /* 58   |                  */ add
  IL_0009:  /* 0A   |                  */ stloc.0
  IL_000a:  /* 2B   | 00               */ br.s       IL_000c
  IL_000c:  /* 06   |                  */ ldloc.0
  IL_000d:  /* 2A   |                  */ ret
} // end of method 'ArithmeticProgression'::'LastTerm'

