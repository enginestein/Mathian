
namespace Sigmath

import System

public class Trig:

	private static final numTerms = 10

	public static def Sin(x as double) as double:
		while x < 0:
			x += (2 * Constants.Pi)
		
		while x > (2 * Constants.Pi):
			x -= (2 * Constants.Pi)
		
		sum as double = 0
		for i in range(0, numTerms):
		
			sum += (((1 if ((i % 2) == 0) else (-1)) * Basic.Power(x, ((2 * i) + 1))) / Factorial(((2 * i) + 1)))
		
		return sum

	
	public static def Cos(x as double) as double:
		while x < 0:
			x += (2 * Constants.Pi)
		
		while x > (2 * Constants.Pi):
			x -= (2 * Constants.Pi)
		
		sum as double = 0
		for i in range(0, numTerms):
		
			sum += (((1 if ((i % 2) == 0) else (-1)) * Basic.Power(x, (2 * i))) / Factorial((2 * i)))
		
		return sum

	
	public static def Tan(x as double) as double:
		return (Sin(x) / Cos(x))

	
	public static def Asin(x as double) as double:
		if (x < (-1)) or (x > 1):
			raise ArgumentException('Input to arcsine function must be between -1 and 1')
		
		sum as double = 0
		for i in range(0, numTerms):
		
			sum += ((Factorial((2 * i)) * Basic.Power(x, ((2 * i) + 1))) / ((Basic.Power(4, i) * Basic.Power(Factorial(i), 2)) * ((2 * i) + 1)))
		
		return sum

	
	public static def Acos(x as double) as double:
		if (x < (-1)) or (x > 1):
			raise ArgumentException('Input to arccosine function must be between -1 and 1')
		
		return ((Constants.Pi / 2) - Asin(x))

	
	public static def Atan(x as double) as double:
		sum as double = 0
		for i in range(0, numTerms):
		
			sum += (((1 if ((i % 2) == 0) else (-1)) * Basic.Power(x, ((2 * i) + 1))) / ((2 * i) + 1))
		
		return sum

	
	private static def Factorial(n as int) as double:
		result as double = 1
		for i in range(1, (n + 1)):
		
			result *= i
		
		return result

