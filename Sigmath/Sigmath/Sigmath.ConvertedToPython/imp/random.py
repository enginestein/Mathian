from System import *

class Rand(object):
	def __init__(self, seed):
		self._a = 6364136223846793005
		self._c = 1442695040888963407
		self._m = 9223372036854775783
		self._seed = seed

	def __init__(self, seed):
		self._a = 6364136223846793005
		self._c = 1442695040888963407
		self._m = 9223372036854775783
		self._seed = seed

	def NextLong(self):
		self._seed = (self._a * self._seed + self._c) % self._m
		return self._seed

	def NextDouble(self):
		return self.NextLong() / self._m

	def Next(self, minValue, maxValue):
		if minValue >= maxValue:
			raise ArgumentException("minValue must be less than maxValue")
		range = maxValue - minValue
		return (self.NextDouble() * range) + minValue

	def Next(self, maxValue):
		return self.Next(0, maxValue)

	def Next(self):
		return self.Next(int.MinValue, int.MaxValue)

class Random(object):
	def RandUniform(min, max):
		rand = Rand()
		return rand.NextDouble() * (max - min) + min

	RandUniform = staticmethod(RandUniform)

	def RandNormal(mean, stdDev):
		rand = Rand()
		u1 = rand.NextDouble()
		u2 = rand.NextDouble()
		z0 = Basic.SquareRoot(-2 * Logarithm.Log(u1)) * Trig.Cos(2 * Constants.Pi * u2)
		return z0 * stdDev + mean

	RandNormal = staticmethod(RandNormal)

	def RandPoisson(lambda):
		rand = Rand()
		L = Basic.Exp(-lambda)
		p = 1
		k = 0
		while p > L:
			k += 1
			p *= rand.NextDouble()
		return k - 1

	RandPoisson = staticmethod(RandPoisson)