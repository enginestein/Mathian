require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class ArithmeticProgression
		def ArithmeticProgression.Arithmetic(firstTerm, commonDifference, numTerms)
			terms = Array.CreateInstance(System::Double, numTerms)
			i = 0
			while i < numTerms
				terms[i] = firstTerm + i * commonDifference
				i += 1
			end
			return terms
		end

		def ArithmeticProgression.ArithmeticSum(firstTerm, commonDifference, numTerms)
			return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2
		end

		def ArithmeticProgression.NthTerm(n, a1, d)
			return a1 + (n - 1) * d
		end

		def ArithmeticProgression.TermNumber(an, a1, d)
			n = (an - a1) / d + 1
			return Convert.ToInt32(n)
		end

		def ArithmeticProgression.TermNumber(an, n, a1)
			d = (an - a1) / (n - 1)
			return Convert.ToInt32(d)
		end

		def ArithmeticProgression.CommonDifference(an, a1, n)
			return (an - a1) / (n - 1)
		end

		def ArithmeticProgression.FirstTerm(an, n, d)
			return an - (n - 1) * d
		end

		def ArithmeticProgression.LastTerm(a1, n, d)
			return a1 + (n - 1) * d
		end
	end
end