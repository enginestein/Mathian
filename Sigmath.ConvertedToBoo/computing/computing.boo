namespace Sigmath

public class Computing:

	public static def Floor(x as double) as int:
		return ((x if (x >= 0) else (x - 1.0)) cast int)

	
	public static def Ceil(x as double) as int:
		return (((x + 1.0) if (x >= 0) else x) cast int)

	
	public static def Round(x as double) as int:
		return (((x + 0.5) if (x >= 0) else (x - 0.5)) cast int)

