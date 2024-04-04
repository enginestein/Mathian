from System import *

class Trig(object):
	def __init__(self):
		self._numTerms = 10

	def Sin(x):
		while x < 0:
			x += 2 * Constants.Pi
		while x > 2 * Constants.Pi:
			x -= 2 * Constants.Pi
		sum = 0
		i = 0
		while i < self._numTerms:
			sum += ((1 if i % 2 == 0 else -1) * Basic.Power(x, 2 * i + 1)) / Trig.Factorial(2 * i + 1)
			i += 1
		return sum

	Sin = staticmethod(Sin)

	def Cos(x):
		while x < 0:
			x += 2 * Constants.Pi
		while x > 2 * Constants.Pi:
			x -= 2 * Constants.Pi
		sum = 0
		i = 0
		while i < self._numTerms:
			sum += ((1 if i % 2 == 0 else -1) * Basic.Power(x, 2 * i)) / Trig.Factorial(2 * i)
			i += 1
		return sum

	Cos = staticmethod(Cos)

	def Tan(x):
		return Trig.Sin(x) / Trig.Cos(x)

	Tan = staticmethod(Tan)

	def Asin(x):
		if x < -1 or x > 1:
			raise ArgumentException("Input to arcsine function must be between -1 and 1")
		sum = 0
		i = 0
		while i < self._numTerms:
			sum += (Trig.Factorial(2 * i) * Basic.Power(x, 2 * i + 1)) / (Basic.Power(4, i) * Basic.Power(Trig.Factorial(i), 2) * (2 * i + 1))
			i += 1
		return sum

	Asin = staticmethod(Asin)

	def Acos(x):
		if x < -1 or x > 1:
			raise ArgumentException("Input to arccosine function must be between -1 and 1")
		return Constants.Pi / 2 - Trig.Asin(x)

	Acos = staticmethod(Acos)

	def Atan(x):
		sum = 0
		i = 0
		while i < self._numTerms:
			sum += ((1 if i % 2 == 0 else -1) * Basic.Power(x, 2 * i + 1)) / (2 * i + 1)
			i += 1
		return sum

	Atan = staticmethod(Atan)

	def Factorial(n):
		result = 1
		i = 1
		while i <= n:
			result *= i
			i += 1
		return result

	Factorial = staticmethod(Factorial)