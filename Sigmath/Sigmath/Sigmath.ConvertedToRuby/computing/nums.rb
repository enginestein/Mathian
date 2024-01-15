module Sigmath
	class Nums
		def Nums.Gcd(a, b)
			while b != 0
				temp = b
				b = a % b
				a = temp
			end
			return a
		end

		def Nums.Lcm(a, b)
			return Basic.Abs(a * b) / Nums.Gcd(a, b)
		end

		def Nums.Mod(a, b)
			r = a % b
			return r < 0 ? r + b : r
		end
	end
end