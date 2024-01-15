from System import *

class Logarithm(object):
	def __init__(self):
		self._EPSILON = 1e-14

	def Log(x):
		if x <= 0:
			raise ArgumentException("Invalid argument: x must be positive")
		y = 0
		k = 0
		while x >= 2:
			x /= 2
			k += 1
		while x < 1:
			x *= 2
			k -= 1
		z = x - 1
		z2 = z * z
		z3 = z * z2
		y = 2 * z / (1 + z) + 0.5 * z2 / (1 + z) - 0.25 * z3 / ((1 + z) * (1 + z)) + z3 / (3 * (1 + z) * (1 + z) * (1 + z))
		return y + k

	Log = staticmethod(Log)

	def Log10(x):
		if x <= 0:
			raise ArgumentException("Invalid argument: x must be positive")
		return Logarithm.Log(x) / Logarithm.Log(10)

	Log10 = staticmethod(Log10)

	def Logn(n, x):
		return Logarithm.Log(x) / Logarithm.Log(n)

	Logn = staticmethod(Logn)