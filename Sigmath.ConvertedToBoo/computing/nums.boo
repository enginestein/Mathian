namespace Sigmath

public class Nums:

	
	public static def Gcd(a as int, b as int) as int:
		while b != 0:
			temp as int = b
			b = (a % b)
			a = temp
		return a

	
	public static def Lcm(a as int, b as int) as int:
		return (Basic.Abs((a * b)) / Gcd(a, b))

	
	public static def Mod(a as int, b as int) as int:
		r as int = (a % b)
		return ((r + b) if (r < 0) else r)

