from System import *
from System.Collections.Generic import *

class Calculus(object):
	def Derivative(f, x):
		dx = 1e-9 # small increment to find the derivative
		y1 = Calculus.f(x)
		y2 = Calculus.f(x + dx)
		derivative = (y2 - y1) / dx
		return derivative

	Derivative = staticmethod(Derivative)

	def Integral(f, a, b, n):
		h = (b - a) / n
		integral = 0
		i = 1
		while i < n:
			x = a + i * h
			integral += Calculus.f(x)
			i += 1
		integral += (Calculus.f(a) + Calculus.f(b)) / 2
		integral *= h
		return integral

	Integral = staticmethod(Integral)

	def Limit(f, g, x):
		maxIterations = 1000
		tolerance = 1e-9
		fx = Calculus.f(x)
		gx = Calculus.g(x)
		limit = fx / gx
		i = 0
		while i < maxIterations:
			fx1 = Calculus.Derivative(f, x)
			gx1 = Calculus.Derivative(g, x)
			newLimit = fx1 / gx1
			if Basic.Abs(newLimit - limit) < tolerance:
				return newLimit
			limit = newLimit
			x += 1e-9
			i += 1
		raise Exception("Limit does not exist or cannot be computed with L'Hopital's Rule.")

	Limit = staticmethod(Limit)

	def FindRoot(f, a, b, epsilon):
		if Calculus.f(a) * Calculus.f(b) > 0:
			raise ArgumentException("Function must have opposite signs at interval endpoints")
		c = (a + b) / 2
		while Math.Abs(Calculus.f(c)) > epsilon:
			if Calculus.f(a) * Calculus.f(c) < 0:
				b = c
			else:
				a = c
			c = (a + b) / 2
		return c

	FindRoot = staticmethod(FindRoot)

	def Factorial(n):
		result = 1
		i = 2
		while i <= n:
			result *= i
			i += 1
		return result

	Factorial = staticmethod(Factorial)

	def PartialDerivative(f, index, h):
		return 

	PartialDerivative = staticmethod(PartialDerivative)

	def Gradient(f, h):
		return 

	Gradient = staticmethod(Gradient)

	def Hessian(f, h):
		return 

	Hessian = staticmethod(Hessian)

	def FindCriticalPoints(f, a, b, epsilon):
		criticalPoints = List[Double]()
		# Evaluate function at endpoints of interval
		fa = Calculus.f(a)
		fb = Calculus.f(b)
		# Check if endpoints are critical points
		if Math.Abs(fa) < epsilon:
			criticalPoints.Add(a)
		if Math.Abs(fb) < epsilon:
			criticalPoints.Add(b)
		# Find critical points in the interval
		x = a
		fx = Calculus.f(a)
		while x < b:
			xNext = x + epsilon
			fxNext = Calculus.f(xNext)
			# Check if the current point is a critical point
			if Math.Abs(fx) < epsilon and x > a and x < b:
				criticalPoints.Add(x)
			# Check if the function changes sign between x and xNext
			if fx * fxNext < 0:
				# Use bisection method to find a root
				xLeft = x
				xRight = xNext
				while xRight - xLeft > epsilon:
					xMid = (xLeft + xRight) / 2
					fxMid = Calculus.f(xMid)
					if Math.Abs(fxMid) < epsilon:
						criticalPoints.Add(xMid)
						break
					if fx * fxMid < 0:
						xRight = xMid
					else:
						xLeft = xMid
			x = xNext
			fx = fxNext
		return criticalPoints.ToArray()

	FindCriticalPoints = staticmethod(FindCriticalPoints)

	class RiemannSumType(object):
		def __init__(self):

	def RiemannSum(f, a, b, n, type):
		dx = (b - a) / n
		sum = 0
		i = 0
		while i < n:
			x = a + i * dx
			fx = Calculus.f(x)
			if type == RiemannSumType.Left:
				sum += fx * dx
			elif type == RiemannSumType.Right:
				sum += Calculus.f(x + dx) * dx
			elif type == RiemannSumType.Midpoint:
				sum += Calculus.f(x + dx / 2) * dx
			elif type == RiemannSumType.Trapezoidal:
				sum += (fx + Calculus.f(x + dx)) * dx / 2
			i += 1
		return sum

	RiemannSum = staticmethod(RiemannSum)

	def DefiniteIntegral(f, a, b, n):
		return Calculus.RiemannSum(f, a, b, n, RiemannSumType.Midpoint)

	DefiniteIntegral = staticmethod(DefiniteIntegral)