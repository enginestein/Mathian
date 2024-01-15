require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Compl
		class Complex
			def Real
			end

			def Imaginary
			end

			def initialize(real, imaginary)
				self.Real = real
				self.Imaginary = imaginary
			end

			return Complex.new(a.Real + b.Real, a.Imaginary + b.Imaginary)
			return Complex.new(a.Real - b.Real, a.Imaginary - b.Imaginary)
			return Complex.new(a.Real * b.Real - a.Imaginary * b.Imaginary, a.Real * b.Imaginary + a.Imaginary * b.Real)
			denominator = b.Real * b.Real + b.Imaginary * b.Imaginary
			numeratorReal = a.Real * b.Real + a.Imaginary * b.Imaginary
			numeratorImaginary = a.Imaginary * b.Real - a.Real * b.Imaginary
			return Complex.new(numeratorReal / denominator, numeratorImaginary / denominator)
			raise NotImplementedException.new()
			def Complex.Abs(a)
				return Basic.SquareRoot(a.Real * a.Real + a.Imaginary * a.Imaginary)
			end

			def Complex.Magnitude(number)
				return Basic.SquareRoot(number.Real * number.Real + number.Imaginary * number.Imaginary)
			end
		end
	end
end