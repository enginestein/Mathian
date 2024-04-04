class Nums(object):
	def Gcd(a, b):
		while b != 0:
			temp = b
			b = a % b
			a = temp
		return a

	Gcd = staticmethod(Gcd)

	def Lcm(a, b):
		return Basic.Abs(a * b) / Nums.Gcd(a, b)

	Lcm = staticmethod(Lcm)

	def Mod(a, b):
		r = a % b
		return r + b if r < 0 else r

	Mod = staticmethod(Mod)