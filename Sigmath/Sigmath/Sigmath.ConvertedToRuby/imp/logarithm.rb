require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Logarithm
		def initialize()
			@EPSILON = 1e-14
		end

		def Logarithm.Log(x)
			if x <= 0 then
				raise ArgumentException.new("Invalid argument: x must be positive")
			end
			y = 0
			k = 0
			while x >= 2
				x /= 2
				k += 1
			end
			while x < 1
				x *= 2
				k -= 1
			end
			z = x - 1
			z2 = z * z
			z3 = z * z2
			y = 2 * z / (1 + z) + 0.5 * z2 / (1 + z) - 0.25 * z3 / ((1 + z) * (1 + z)) + z3 / (3 * (1 + z) * (1 + z) * (1 + z))
			return y + k
		end

		def Logarithm.Log10(x)
			if x <= 0 then
				raise ArgumentException.new("Invalid argument: x must be positive")
			end
			return Logarithm.Log(x) / Logarithm.Log(10)
		end

		def Logarithm.Logn(n, x)
			return Logarithm.Log(x) / Logarithm.Log(n)
		end
	end
end