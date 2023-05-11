.method /*0600002B*/ public hidebysig static 
        float64  'Add'(float64[] 'numbers') cil managed
// SIG: 00 01 0D 1D 0D
{
  .param [1]/*0800005A*/ 
  .custom /*0C000020:0A000011*/ instance void ['mscorlib'/*23000001*/]'System'.'ParamArrayAttribute'/*0100001F*/::.ctor() /* 0A000011 */ = ( 01 00 00 00 ) 
  // Method begins at RVA 0x348c
  // Code size       44 (0x2c)
  .maxstack  2
  .locals /*1100001B*/ init ([0] float64 'sum',
           [1] float64[] 'V_1',
           [2] int32 'V_2',
           [3] float64 'num',
           [4] float64 'V_4')
  .language '{3F5162F8-07C6-11D3-9053-00C04FA302A1}', '{994B45C4-E6E9-11D2-903F-00C04FA302A1}', '{5A869D0B-6611-11D3-BD2A-0000F80849BD}'
// Source File 'C:\Main\Projects\Sigmath\Sigmath\computing\basic.cs' not found
  IL_0000:  /* 00   |                  */ nop
  IL_0001:  /* 23   | 0000000000000000 */ ldc.r8     0.0
  IL_000a:  /* 0A   |                  */ stloc.0
  IL_000b:  /* 00   |                  */ nop
  IL_000c:  /* 02   |                  */ ldarg.0
  IL_000d:  /* 0B   |                  */ stloc.1
  IL_000e:  /* 16   |                  */ ldc.i4.0
  IL_000f:  /* 0C   |                  */ stloc.2
  IL_0010:  /* 2B   | 0C               */ br.s       IL_001e
  IL_0012:  /* 07   |                  */ ldloc.1
  IL_0013:  /* 08   |                  */ ldloc.2
  IL_0014:  /* 99   |                  */ ldelem.r8
  IL_0015:  /* 0D   |                  */ stloc.3
  IL_0016:  /* 06   |                  */ ldloc.0
  IL_0017:  /* 09   |                  */ ldloc.3
  IL_0018:  /* 58   |                  */ add
  IL_0019:  /* 0A   |                  */ stloc.0
  IL_001a:  /* 08   |                  */ ldloc.2
  IL_001b:  /* 17   |                  */ ldc.i4.1
  IL_001c:  /* 58   |                  */ add
  IL_001d:  /* 0C   |                  */ stloc.2
  IL_001e:  /* 08   |                  */ ldloc.2
  IL_001f:  /* 07   |                  */ ldloc.1
  IL_0020:  /* 8E   |                  */ ldlen
  IL_0021:  /* 69   |                  */ conv.i4
  IL_0022:  /* 32   | EE               */ blt.s      IL_0012
  IL_0024:  /* 06   |                  */ ldloc.0
  IL_0025:  /* 13   | 04               */ stloc.s    'V_4'
  IL_0027:  /* 2B   | 00               */ br.s       IL_0029
  IL_0029:  /* 11   | 04               */ ldloc.s    'V_4'
  IL_002b:  /* 2A   |                  */ ret
} // end of method 'Basic'::'Add'

