.method /*06000005*/ public hidebysig static 
        int32  'TermNumber'(float64 'an',
                            float64 'a1',
                            float64 'd') cil managed
// SIG: 00 03 08 0D 0D 0D
{
  // Method begins at RVA 0x210c
  // Code size       28 (0x1c)
  .maxstack  2
  .locals /*11000003*/ init ([0] float64 'n',
           [1] int32 'V_1')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\calculus\ap.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 03   |                  */ ldarg.1
  IL_0003:  /* 59   |                  */ sub
  IL_0004:  /* 04   |                  */ ldarg.2
  IL_0005:  /* 5B   |                  */ div
  IL_0006:  /* 23   | 000000000000F03F */ ldc.r8     1.
  IL_000f:  /* 58   |                  */ add
  IL_0010:  /* 0A   |                  */ stloc.0
  IL_0011:  /* 06   |                  */ ldloc.0
  IL_0012:  /* 28   | (0A)000012       */ call       int32 ['mscorlib'/*23000001*/]'System'.'Convert'/*01000028*/::'ToInt32'(float64) /* 0A000012 */
  IL_0017:  /* 0B   |                  */ stloc.1
  IL_0018:  /* 2B   | 00               */ br.s       IL_001a
  IL_001a:  /* 07   |                  */ ldloc.1
  IL_001b:  /* 2A   |                  */ ret
} // end of method 'ArithmeticProgression'::'TermNumber'

