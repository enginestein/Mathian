.method /*06000006*/ public hidebysig static 
        int32  'TermNumber'(float64 'an',
                            int32 'n',
                            float64 'a1') cil managed
// SIG: 00 03 08 0D 08 0D
{
  // Method begins at RVA 0x2134
  // Code size       21 (0x15)
  .maxstack  3
  .locals /*11000003*/ init ([0] float64 'd',
           [1] int32 'V_1')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\calculus\ap.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 04   |                  */ ldarg.2
  IL_0003:  /* 59   |                  */ sub
  IL_0004:  /* 03   |                  */ ldarg.1
  IL_0005:  /* 17   |                  */ ldc.i4.1
  IL_0006:  /* 59   |                  */ sub
  IL_0007:  /* 6C   |                  */ conv.r8
  IL_0008:  /* 5B   |                  */ div
  IL_0009:  /* 0A   |                  */ stloc.0
  IL_000a:  /* 06   |                  */ ldloc.0
  IL_000b:  /* 28   | (0A)000012       */ call       int32 ['mscorlib'/*23000001*/]'System'.'Convert'/*01000028*/::'ToInt32'(float64) /* 0A000012 */
  IL_0010:  /* 0B   |                  */ stloc.1
  IL_0011:  /* 2B   | 00               */ br.s       IL_0013
  IL_0013:  /* 07   |                  */ ldloc.1
  IL_0014:  /* 2A   |                  */ ret
} // end of method 'ArithmeticProgression'::'TermNumber'

