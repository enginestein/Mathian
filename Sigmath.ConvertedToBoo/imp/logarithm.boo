
namespace Sigmath

import System

public class Logarithm:

	private static final EPSILON = 0.0

	
	public static def Log(x as double) as double:
		if x <= 0:
			raise ArgumentException('Invalid argument: x must be positive')
		
		y as double = 0
		k = 0
		while x >= 2:
			x /= 2
			k += 1
		while x < 1:
			x *= 2
			k -= 1
		z as double = (x - 1)
		z2 as double = (z * z)
		z3 as double = (z * z2)
		y = (((((2 * z) / (1 + z)) + ((0.5 * z2) / (1 + z))) - ((0.25 * z3) / ((1 + z) * (1 + z)))) + (z3 / (((3 * (1 + z)) * (1 + z)) * (1 + z))))
		return (y + k)

	
	public static def Log10(x as double) as double:
		if x <= 0:
			raise ArgumentException('Invalid argument: x must be positive')
		return (Log(x) / Log(10))

	
	
	public static def Logn(n as double, x as double) as double:
		return (Log(x) / Log(n))

