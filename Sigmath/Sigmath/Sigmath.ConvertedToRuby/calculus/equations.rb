require "mscorlib"

				require "mscorlib"

			require "mscorlib"

			require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq.Expressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text.RegularExpressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Equations
		def Equations.ExponentialEquationSolver(equation, value)
			equifiedEquation = Equif.Equify(equation, value).ToString()
			if not equifiedEquation.Contains("x") then
				return System::Double.NaN
			end
			a = 0
			c = 0
			matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)([eE]\^\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
			if matches.Count == 1 then
				match = matches[0]
				System::Double.TryParse(match.Groups[1].Value, a)
				System::Double.TryParse(match.Groups[3].Value, c)
			else
				return System::Double.NaN
			end
			if a == 0 then
				return System::Double.NaN
			else
				result = (Logarithm.Log((value - c) / a)) / Logarithm.Log(Constants.E)
				return result
			end
		end

		def Equations.LogarithmicEquationSolver(equation, value)
			equifiedEquation = Equif.Equify(equation, value).ToString()
			if not equifiedEquation.Contains("x") then
				return System::Double.NaN
			end
			a = 0
			c = 0
			# Parse the equation to find coefficients
			matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)(\*?log\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
			if matches.Count == 1 then
				match = matches[0]
				System::Double.TryParse(match.Groups[1].Value, a)
				System::Double.TryParse(match.Groups[3].Value, c)
			else
				return System::Double.NaN
			end
			# Solve for x
			if a == 0 or c < 0 then
				return System::Double.NaN
			else
				result = (value - c) / a
				result = Basic.Power(10, result)
				result = result / a
				return result
			end
		end

		def Equations.SolveEquation(equifiedEquation)
			dataTable = DataTable.new()
			parser = ExpressionParser.new(dataTable)
			expression = parser.Parse(equifiedEquation)
			lambda = Expression.Lambda(expression)
			function = lambda.Compile()
			return Equations.function()
		end

		def Equations.SolveLinearEquation(equation, x)
			equation = "({equation})"
			equation = equation.Replace("=", "-")
			result = Equif.Equify(equation, x)
			return result
		end

		def Equations.SolveQuadraticEquation(equation)
			equation = "({equation})"
			parts = equation.Split(Array[].new([" = "]), StringSplitOptions.RemoveEmptyEntries)
			expr = parts[0]
			rhs = System::Double.Parse(parts[1])
			expr = Regex.Replace(expr, @"x\^2", "a")
			expr = Regex.Replace(expr, @"x", "b")
			dataTable = DataTable.new()
			parser = ExpressionParser.new(dataTable)
			expression = parser.Parse(expr)
			lambda = Expression.Lambda(expression, Expression.Parameter(System::Double.to_clr_type, "a"))
			function = lambda.Compile()
			a = Equations.function(1)
			b = Equations.function(0)
			c = -rhs
			discriminant = b * b - 4 * a * c
			if discriminant < 0 then
				raise ArgumentException.new("Equation has no real roots.")
			end
			root1 = (-b + Basic.SquareRoot(discriminant)) / (2 * a)
			root2 = (-b - Basic.SquareRoot(discriminant)) / (2 * a)
			return Tuple.Create(root1, root2)
		end

		def Equations.SolveCubicEquation(equation)
			equation = "({equation})"
			parts = equation.Split(Array[].new([" = "]), StringSplitOptions.RemoveEmptyEntries)
			expr = parts[0]
			rhs = System::Double.Parse(parts[1])
			expr = Regex.Replace(expr, @"x\^3", "a")
			expr = Regex.Replace(expr, @"x\^2", "b")
			expr = Regex.Replace(expr, @"x", "c")
			dataTable = DataTable.new()
			parser = ExpressionParser.new(dataTable)
			expression = parser.Parse(expr)
			lambda = Expression.Lambda(expression, Expression.Parameter(System::Double.to_clr_type, "a"))
			function = lambda.Compile()
			a = Equations.function(1)
			b = Equations.function(0)
			c = Equations.function(0)
			d = -rhs
			Q = (3 * a * c - b * b) / (9 * a * a)
			R = (9 * a * b * c - 27 * a * a * d - 2 * b * b * b) / (54 * a * a * a)
			D = Q * Q * Q + R * R
			if D >= 0 then
				S = Math.Sign(R + Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R + Basic.SquareRoot(D)), 1.0 / 3.0)
				T = Math.Sign(R - Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R - Basic.SquareRoot(D)), 1.0 / 3.0)
				root1 = (-b / (3 * a)) + S + T
				root2 = (-b / (3 * a)) - (S + T) / 2
				root3 = (-b / (3 * a)) - (S + T) / 2
				return Tuple.Create(root1, root2, root3)
			else
				theta = Trig.Acos(R / Basic.SquareRoot(-Q * Q * Q))
				root1 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos(theta / 3) - b / (3 * a))
				root2 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta + 2 * Constants.Pi) / 3) - b / (3 * a))
				root3 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta - 2 * Constants.Pi) / 3) - b / (3 * a))
				return Tuple.Create(root1, root2, root3)
			end
		end

		def Equations.SolvePolynomialEquation(coefficients)
			if coefficients == nil or coefficients.Length < 2 then
				raise ArgumentException.new("The coefficients must contain at least two values.")
			end
			degree = coefficients.Length - 1
			if degree == 1 then
				return Array[System::Double].new([-coefficients[0] / coefficients[1]])
			end
			if degree == 2 then
				discriminant = coefficients[1] * coefficients[1] - 4 * coefficients[0] * coefficients[2]
				if discriminant >= 0 then
					sqrtDiscriminant = Basic.SquareRoot(discriminant)
					r1 = (-coefficients[1] + sqrtDiscriminant) / (2 * coefficients[2])
					r2 = (-coefficients[1] - sqrtDiscriminant) / (2 * coefficients[2])
					return Array[System::Double].new([r1, r2])
				end
				return Array.CreateInstance(System::Double, 0)
			end
			roots = Array.CreateInstance(System::Double, degree)
			work = Array.CreateInstance(System::Double, degree)
			x = 1.0
			i = 0
			while i < degree
				work[i] = coefficients[i]
				i += 1
			end
			i = degree - 1
			while i >= 0
				b = work[i]
				d = 0
				j = i
				while j >= 0
					d = d * x + work[j]
					j -= 1
				end
				roots[i] = b / d
				x = roots[i]
				i -= 1
			end
			return roots
		end

		class BinomialTheorem
			def BinomialTheorem.Calculate(a, b, n)
				result = 1
				i = 0
				while i < n
					result *= (a - i) / (i + 1)
					result *= b
					i += 1
				end
				return result
			end
		end
		class PowerEquation
			def PowerEquation.Solve(baseValue, exponent)
				return Basic.Power(baseValue, exponent)
			end
		end
		class Differentiation
			def Differentiation.Differentiate(equation, x)
				dataTable = DataTable.new()
				parser = ExpressionParser.new(dataTable)
				expression = parser.Parse(equation)
				lambda = Expression.Lambda(expression, Array[].new([Expression.Parameter(System::Double.to_clr_type, "x")]))
				function = lambda.Compile()
				h = 0.00000001
				f1 = (Differentiation.function(x + h) - Differentiation.function(x - h)) / (2 * h)
				return f1
			end
		end
		class HyperbolicEquation
			def HyperbolicEquation.Solve(equation, tolerance)
				dataTable = DataTable.new()
				parser = ExpressionParser.new(dataTable)
				expression = parser.Parse(equation)
				lambda = Expression.Lambda(expression, Array[].new([Expression.Parameter(System::Double.to_clr_type, "x")]))
				function = lambda.Compile()
				x = 1.0
				y = 0.0
				dx = tolerance * 10
				while dx > tolerance
					y = HyperbolicEquation.function(x)
					dy = HyperbolicEquation.function(x + dx) - y
					if dy == 0 then
						break
					end
					x -= y / dy
					dx = Basic.Abs(y)
				end
				return x
			end
		end
	end
end