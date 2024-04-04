require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq.Expressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Basic
		def Basic.Add(numbers)
			sum = 0
			enumerator = numbers.GetEnumerator()
			while enumerator.MoveNext()
				num = enumerator.Current
				sum += num
			end
			return sum
		end

		def Basic.Subtract(numbers)
			result = numbers[0]
			i = 1
			while i < numbers.Length
				result -= numbers[i]
				i += 1
			end
			return result
		end

		def Basic.Multiply(numbers)
			product = 1
			enumerator = numbers.GetEnumerator()
			while enumerator.MoveNext()
				num = enumerator.Current
				product *= num
			end
			return product
		end

		def Basic.Divide(numbers)
			result = numbers[0]
			i = 1
			while i < numbers.Length
				if numbers[i] == 0 then
					raise DivideByZeroException.new()
				end
				result /= numbers[i]
				i += 1
			end
			return result
		end

		def Basic.Power(baseNum, exponent)
			result = 1
			i = 0
			while i < exponent
				result *= baseNum
				i += 1
			end
			return result
		end

		def Basic.Abs(value)
			return value >= 0 ? value : -value
		end

		def Basic.Abs(value)
			return value >= 0 ? value : -value
		end

		def Basic.Abs(value)
			return value >= 0 ? value : -value
		end

		def Basic.Abs(value)
			return value >= 0 ? value : -value
		end

		def Basic.SquareRoot(number)
			if number < 0 then
				raise ArgumentException.new("Cannot take square root of negative number")
			end
			guess = number / 2
			i = 0
			while i < 100
				newGuess = (guess + number / guess) / 2
				if Basic.Abs(newGuess - guess) < 0.0001 then
					break
				end
				guess = newGuess
				i += 1
			end
			return guess
		end

		def Basic.Exp(x)
			result = 1.0
			term = 1.0
			n = 1
			while term > 0.0000001
				term *= x / n
				result += term
				n += 1
			end
			return result
		end

		def Basic.CubeRoot(x)
			if x >= 0 then
				return Basic.Power(x, 1.0 / 3.0)
			else
				return -Basic.Power(-x, 1.0 / 3.0)
			end
		end

		def Basic.Evaluate(expression)
			dataTable = DataTable.new()
			parser = ExpressionParser.new(dataTable)
			parsedExpression = parser.Parse(expression)
			lambda = Expression.Lambda(parsedExpression)
			compiledExpression = lambda.Compile()
			return Basic.compiledExpression()
		end
	end
end