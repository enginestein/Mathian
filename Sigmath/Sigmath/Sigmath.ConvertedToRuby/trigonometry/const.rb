require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Trig
		def initialize()
			@numTerms = 10
		end

		def Trig.Sin(x)
			while x < 0
				x += 2 * Constants.Pi
			end
			while x > 2 * Constants.Pi
				x -= 2 * Constants.Pi
			end
			sum = 0
			i = 0
			while i < @numTerms
				sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i + 1)) / Trig.Factorial(2 * i + 1)
				i += 1
			end
			return sum
		end

		def Trig.Cos(x)
			while x < 0
				x += 2 * Constants.Pi
			end
			while x > 2 * Constants.Pi
				x -= 2 * Constants.Pi
			end
			sum = 0
			i = 0
			while i < @numTerms
				sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i)) / Trig.Factorial(2 * i)
				i += 1
			end
			return sum
		end

		def Trig.Tan(x)
			return Trig.Sin(x) / Trig.Cos(x)
		end

		def Trig.Asin(x)
			if x < -1 or x > 1 then
				raise ArgumentException.new("Input to arcsine function must be between -1 and 1")
			end
			sum = 0
			i = 0
			while i < @numTerms
				sum += (Trig.Factorial(2 * i) * Basic.Power(x, 2 * i + 1)) / (Basic.Power(4, i) * Basic.Power(Trig.Factorial(i), 2) * (2 * i + 1))
				i += 1
			end
			return sum
		end

		def Trig.Acos(x)
			if x < -1 or x > 1 then
				raise ArgumentException.new("Input to arccosine function must be between -1 and 1")
			end
			return Constants.Pi / 2 - Trig.Asin(x)
		end

		def Trig.Atan(x)
			sum = 0
			i = 0
			while i < @numTerms
				sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i + 1)) / (2 * i + 1)
				i += 1
			end
			return sum
		end

		def Trig.Factorial(n)
			result = 1
			i = 1
			while i <= n
				result *= i
				i += 1
			end
			return result
		end
	end
end