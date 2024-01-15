from System import *

class Hyperbolic(object):
	def Sinh(x):
		return (Basic.Exp(x) - Basic.Exp(-x)) / 2

	Sinh = staticmethod(Sinh)

	def Cosh(x):
		return (Basic.Exp(x) + Basic.Exp(-x)) / 2

	Cosh = staticmethod(Cosh)

	def Tanh(x):
		return Hyperbolic.Sinh(x) / Hyperbolic.Cosh(x)

	Tanh = staticmethod(Tanh)

	def Sech(x):
		return 1 / Hyperbolic.Cosh(x)

	Sech = staticmethod(Sech)

	def Csch(x):
		return 1 / Hyperbolic.Sinh(x)

	Csch = staticmethod(Csch)

	def Coth(x):
		return 1 / Hyperbolic.Tanh(x)

	Coth = staticmethod(Coth)

	def Asinh(x):
		return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) + 1))

	Asinh = staticmethod(Asinh)

	def Acosh(x):
		if x < 1:
			raise ArgumentException("Input to inverse hyperbolic cosine function must be greater than or equal to 1")
		return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) - 1))

	Acosh = staticmethod(Acosh)

	def Atanh(x):
		if x <= -1 or x >= 1:
			raise ArgumentException("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)")
		return 0.5 * Logarithm.Log((1 + x) / (1 - x))

	Atanh = staticmethod(Atanh)

	def Asech(x):
		if x <= 0 or x >= 1:
			raise ArgumentException("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)")
		return Hyperbolic.Acosh(1 / x)

	Asech = staticmethod(Asech)

	def Acsch(x):
		if x <= 0:
			raise ArgumentException("Input to inverse hyperbolic cosecant function must be greater than 0")
		return Hyperbolic.Asinh(1 / x)

	Acsch = staticmethod(Acsch)

	def Acoth(x):
		if x <= -1 or x >= 1:
			raise ArgumentException("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)")
		return 0.5 * Logarithm.Log((x + 1) / (x - 1))

	Acoth = staticmethod(Acoth)