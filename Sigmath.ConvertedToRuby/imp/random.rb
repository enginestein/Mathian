require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Rand
		def initialize(seed)
			@a = 6364136223846793005
			@c = 1442695040888963407
			@m = 9223372036854775783
			self.@seed = seed
		end

		def initialize(seed)
			@a = 6364136223846793005
			@c = 1442695040888963407
			@m = 9223372036854775783
			self.@seed = seed
		end

		def NextLong()
			@seed = (@a * @seed + @c) % @m
			return @seed
		end

		def NextDouble()
			return self.NextLong() / @m
		end

		def Next(minValue, maxValue)
			if minValue >= maxValue then
				raise ArgumentException.new("minValue must be less than maxValue")
			end
			range = maxValue - minValue
			return (self.NextDouble() * range) + minValue
		end

		def Next(maxValue)
			return self.Next(0, maxValue)
		end

		def Next()
			return self.Next(System::Int32.MinValue, System::Int32.MaxValue)
		end
	end
	class Random
		def Random.RandUniform(min, max)
			rand = Rand.new()
			return rand.NextDouble() * (max - min) + min
		end

		def Random.RandNormal(mean, stdDev)
			rand = Rand.new()
			u1 = rand.NextDouble()
			u2 = rand.NextDouble()
			z0 = Basic.SquareRoot(-2 * Logarithm.Log(u1)) * Trig.Cos(2 * Constants.Pi * u2)
			return z0 * stdDev + mean
		end

		def Random.RandPoisson(lambda)
			rand = Rand.new()
			L = Basic.Exp(-lambda)
			p = 1
			k = 0
			while p > L
				k += 1
				p *= rand.NextDouble()
			end
			return k - 1
		end
	end
end