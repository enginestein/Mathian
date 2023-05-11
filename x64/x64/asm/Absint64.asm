.method /*06000033*/ public hidebysig static 
        int64  'Abs'(int64 'value') cil managed
// SIG: 00 01 0A 0A
{
  // Method begins at RVA 0x360c
  // Code size       16 (0x10)
  .maxstack  2
  .locals /*11000020*/ init ([0] int64 'V_0')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\computing\basic.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 02   |                  */ ldarg.0
  IL_0002:  /* 16   |                  */ ldc.i4.0
  IL_0003:  /* 6A   |                  */ conv.i8
  IL_0004:  /* 2F   | 04               */ bge.s      IL_000a
  IL_0006:  /* 02   |                  */ ldarg.0
  IL_0007:  /* 65   |                  */ neg
  IL_0008:  /* 2B   | 01               */ br.s       IL_000b
  IL_000a:  /* 02   |                  */ ldarg.0
  IL_000b:  /* 0A   |                  */ stloc.0
  IL_000c:  /* 2B   | 00               */ br.s       IL_000e
  IL_000e:  /* 06   |                  */ ldloc.0
  IL_000f:  /* 2A   |                  */ ret
} // end of method 'Basic'::'Abs'

