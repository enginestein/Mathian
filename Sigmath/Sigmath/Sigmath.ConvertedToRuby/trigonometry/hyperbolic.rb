require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Hyperbolic
		def Hyperbolic.Sinh(x)
			return (Basic.Exp(x) - Basic.Exp(-x)) / 2
		end

		def Hyperbolic.Cosh(x)
			return (Basic.Exp(x) + Basic.Exp(-x)) / 2
		end

		def Hyperbolic.Tanh(x)
			return Hyperbolic.Sinh(x) / Hyperbolic.Cosh(x)
		end

		def Hyperbolic.Sech(x)
			return 1 / Hyperbolic.Cosh(x)
		end

		def Hyperbolic.Csch(x)
			return 1 / Hyperbolic.Sinh(x)
		end

		def Hyperbolic.Coth(x)
			return 1 / Hyperbolic.Tanh(x)
		end

		def Hyperbolic.Asinh(x)
			return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) + 1))
		end

		def Hyperbolic.Acosh(x)
			if x < 1 then
				raise ArgumentException.new("Input to inverse hyperbolic cosine function must be greater than or equal to 1")
			end
			return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) - 1))
		end

		def Hyperbolic.Atanh(x)
			if x <= -1 or x >= 1 then
				raise ArgumentException.new("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)")
			end
			return 0.5 * Logarithm.Log((1 + x) / (1 - x))
		end

		def Hyperbolic.Asech(x)
			if x <= 0 or x >= 1 then
				raise ArgumentException.new("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)")
			end
			return Hyperbolic.Acosh(1 / x)
		end

		def Hyperbolic.Acsch(x)
			if x <= 0 then
				raise ArgumentException.new("Input to inverse hyperbolic cosecant function must be greater than 0")
			end
			return Hyperbolic.Asinh(1 / x)
		end

		def Hyperbolic.Acoth(x)
			if x <= -1 or x >= 1 then
				raise ArgumentException.new("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)")
			end
			return 0.5 * Logarithm.Log((x + 1) / (x - 1))
		end
	end
end