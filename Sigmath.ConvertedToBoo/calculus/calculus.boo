
namespace Sigmath

import System
import System.Collections.Generic

public class Calculus:

	public static def Derivative(f as Func[of double, double], x as double) as double:
		dx = 0.000000001
		// small increment to find the derivative
		y1 as double = f(x)
		y2 as double = f((x + dx))
		derivative as double = ((y2 - y1) / dx)
		return derivative

	
	public static def Integral(f as Func[of double, double], a as double, b as double, n as int) as double:
		h as double = ((b - a) / n)
		integral as double = 0
		for i in range(1, n):
			x as double = (a + (i * h))
			integral += f(x)
		integral += ((f(a) + f(b)) / 2)
		integral *= h
		return integral

	
	public static def Limit(f as Func[of double, double], g as Func[of double, double], x as double) as double:
		maxIterations = 1000
		tolerance = 0.000000001
		fx as double = f(x)
		gx as double = g(x)
		limit as double = (fx / gx)
		for i in range(0, maxIterations):
			fx1 as double = Derivative(f, x)
			gx1 as double = Derivative(g, x)
			newLimit as double = (fx1 / gx1)
			if Basic.Abs((newLimit - limit)) < tolerance:
				return newLimit
			limit = newLimit
			x += 0.000000001
		raise Exception('Limit does not exist or cannot be computed with L\'Hopital\'s Rule.')

	
	public static def FindRoot(f as Func[of double, double], a as double, b as double, epsilon as double) as double:
		if (f(a) * f(b)) > 0:
			raise ArgumentException('Function must have opposite signs at interval endpoints')
		
		c as double = ((a + b) / 2)
		
		while Math.Abs(f(c)) > epsilon:
			if (f(a) * f(c)) < 0:
				b = c
			else:
				a = c
			
			c = ((a + b) / 2)
		
		return c

	
	private static def Factorial(n as int) as int:
		result = 1
		for i in range(2, (n + 1)):
		
			result *= i
		
		return result

	
	public static def PartialDerivative(f as Func[of (double), double], index as int, h as double) as Func[of (double), double]:
		return def (x):
			xPlus as var = (x.Clone() cast (double))
			xPlus[index] += h
			
			xMinus as var = (x.Clone() cast (double))
			xMinus[index] -= h
			
			return ((f(xPlus) - f(xMinus)) / (2 * h))


	
	public static def Gradient(f as Func[of (double), double], h as double) as Func[of (double), (double)]:
		return def (x):
			gradient as var = array(double, x.Length)
			for i in range(0, x.Length):
			
				gradient[i] = PartialDerivative(f, i, h)(x)
			
			return gradient


	
	public static def Hessian(f as Func[of (double), double], h as double) as Func[of (double), (double, 2)]:
		return def (x):
			n as int = x.Length
			hessian as var = matrix(double, n, n)
			for i in range(0, n):
			
				for j in range(0, n):
					fxx as var = PartialDerivative(PartialDerivative(f, i, h), j, h)(x)
					hessian[i, j] = fxx
			
			return hessian


	
	public static def FindCriticalPoints(f as Func[of double, double], a as double, b as double, epsilon as double) as (double):
		criticalPoints as var = List[of double]()
		
		// Evaluate function at endpoints of interval
		fa as double = f(a)
		fb as double = f(b)
		
		// Check if endpoints are critical points
		if Math.Abs(fa) < epsilon:
			criticalPoints.Add(a)
		if Math.Abs(fb) < epsilon:
			criticalPoints.Add(b)
		
		// Find critical points in the interval
		x as double = a
		fx as double = f(a)
		
		while x < b:
			xNext as double = (x + epsilon)
			fxNext as double = f(xNext)
			
			// Check if the current point is a critical point
			if ((Math.Abs(fx) < epsilon) and (x > a)) and (x < b):
				criticalPoints.Add(x)
			
			// Check if the function changes sign between x and xNext
			if (fx * fxNext) < 0:
				// Use bisection method to find a root
				xLeft as double = x
				xRight as double = xNext
				
				while (xRight - xLeft) > epsilon:
					xMid as double = ((xLeft + xRight) / 2)
					fxMid as double = f(xMid)
					
					if Math.Abs(fxMid) < epsilon:
						criticalPoints.Add(xMid)
						break 
					
					if (fx * fxMid) < 0:
						xRight = xMid
					else:
						xLeft = xMid
			
			x = xNext
			fx = fxNext
		
		return criticalPoints.ToArray()

	
	public enum RiemannSumType:

		Left

		Right

		Midpoint

		Trapezoidal

	
	public static def RiemannSum(f as Func[of double, double], a as double, b as double, n as int, type as RiemannSumType) as double:
		dx as double = ((b - a) / n)
		sum as double = 0
		for i in range(0, n):
		
			x as double = (a + (i * dx))
			fx as double = f(x)
			converterGeneratedName1 = type
			
			if converterGeneratedName1 == RiemannSumType.Left:
				sum += (fx * dx)
			elif converterGeneratedName1 == RiemannSumType.Right:
				sum += (f((x + dx)) * dx)
			elif converterGeneratedName1 == RiemannSumType.Midpoint:
				sum += (f((x + (dx / 2))) * dx)
			elif converterGeneratedName1 == RiemannSumType.Trapezoidal:
				sum += (((fx + f((x + dx))) * dx) / 2)
		
		return sum

	
	public static def DefiniteIntegral(f as Func[of double, double], a as double, b as double, n as int) as double:
		return RiemannSum(f, a, b, n, RiemannSumType.Midpoint)

