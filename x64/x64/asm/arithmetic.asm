.method /*06000001*/ public hidebysig static 
        float64[]  'Arithmetic'(float64 'firstTerm',
                                float64 'commonDifference',
                                int32 'numTerms') cil managed
// SIG: 00 03 1D 0D 0D 0D 08
{
  // Method begins at RVA 0x2050
  // Code size       41 (0x29)
  .maxstack  5
  .locals /*11000001*/ init ([0] float64[] 'terms',
           [1] int32 'i',
           [2] bool 'V_2',
           [3] float64[] 'V_3')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\calculus\ap.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 04   |                  */ ldarg.2
  IL_0002:  /* 8D   | (01)000027       */ newarr     ['mscorlib'/*23000001*/]'System'.'Double'/*01000027*/
  IL_0007:  /* 0A   |                  */ stloc.0
  IL_0008:  /* 16   |                  */ ldc.i4.0
  IL_0009:  /* 0B   |                  */ stloc.1
  IL_000a:  /* 2B   | 0F               */ br.s       IL_001b
  IL_000c:  /* 00   |                  */ nop
  IL_000d:  /* 06   |                  */ ldloc.0
  IL_000e:  /* 07   |                  */ ldloc.1
  IL_000f:  /* 02   |                  */ ldarg.0
  IL_0010:  /* 07   |                  */ ldloc.1
  IL_0011:  /* 6C   |                  */ conv.r8
  IL_0012:  /* 03   |                  */ ldarg.1
  IL_0013:  /* 5A   |                  */ mul
  IL_0014:  /* 58   |                  */ add
  IL_0015:  /* A1   |                  */ stelem.r8
  IL_0016:  /* 00   |                  */ nop
  IL_0017:  /* 07   |                  */ ldloc.1
  IL_0018:  /* 17   |                  */ ldc.i4.1
  IL_0019:  /* 58   |                  */ add
  IL_001a:  /* 0B   |                  */ stloc.1
  IL_001b:  /* 07   |                  */ ldloc.1
  IL_001c:  /* 04   |                  */ ldarg.2
  IL_001d:  /* FE04 |                  */ clt
  IL_001f:  /* 0C   |                  */ stloc.2
  IL_0020:  /* 08   |                  */ ldloc.2
  IL_0021:  /* 2D   | E9               */ brtrue.s   IL_000c
  IL_0023:  /* 06   |                  */ ldloc.0
  IL_0024:  /* 0D   |                  */ stloc.3
  IL_0025:  /* 2B   | 00               */ br.s       IL_0027
  IL_0027:  /* 09   |                  */ ldloc.3
  IL_0028:  /* 2A   |                  */ ret
} // end of method 'ArithmeticProgression'::'Arithmetic'

