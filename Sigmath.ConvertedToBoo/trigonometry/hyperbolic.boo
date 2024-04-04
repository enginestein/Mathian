
namespace Sigmath

import System

public class Hyperbolic:

	public static def Sinh(x as double) as double:
		return ((Basic.Exp(x) - Basic.Exp(-x)) / 2)

	
	public static def Cosh(x as double) as double:
		return ((Basic.Exp(x) + Basic.Exp(-x)) / 2)

	
	public static def Tanh(x as double) as double:
		return (Sinh(x) / Cosh(x))

	
	public static def Sech(x as double) as double:
		return (1 / Cosh(x))

	
	public static def Csch(x as double) as double:
		return (1 / Sinh(x))

	
	public static def Coth(x as double) as double:
		return (1 / Tanh(x))

	
	public static def Asinh(x as double) as double:
		return Logarithm.Log((x + Basic.SquareRoot((Basic.Power(x, 2) + 1))))

	
	public static def Acosh(x as double) as double:
		if x < 1:
			raise ArgumentException('Input to inverse hyperbolic cosine function must be greater than or equal to 1')
		return Logarithm.Log((x + Basic.SquareRoot((Basic.Power(x, 2) - 1))))

	
	public static def Atanh(x as double) as double:
		if (x <= (-1)) or (x >= 1):
			raise ArgumentException('Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)')
		return (0.5 * Logarithm.Log(((1 + x) / (1 - x))))

	
	public static def Asech(x as double) as double:
		if (x <= 0) or (x >= 1):
			raise ArgumentException('Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)')
		return Acosh((1 / x))

	
	public static def Acsch(x as double) as double:
		if x <= 0:
			raise ArgumentException('Input to inverse hyperbolic cosecant function must be greater than 0')
		return Asinh((1 / x))

	
	public static def Acoth(x as double) as double:
		if (x <= (-1)) or (x >= 1):
			raise ArgumentException('Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)')
		return (0.5 * Logarithm.Log(((x + 1) / (x - 1))))

