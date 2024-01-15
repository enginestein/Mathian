import clr

			import clr

		import clr

		import clr

from System import *
from System.Data import *
from System.Linq.Expressions import *
from System.Text.RegularExpressions import *

class Equations(object):
	def ExponentialEquationSolver(equation, value):
		equifiedEquation = Equif.Equify(equation, value).ToString()
		if not equifiedEquation.Contains("x"):
			return Double.NaN
		a = 0
		c = 0
		matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)([eE]\^\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
		if matches.Count == 1:
			match = matches[0]
			Double.TryParse(match.Groups[1].Value, )
			Double.TryParse(match.Groups[3].Value, )
		else:
			return Double.NaN
		if a == 0:
			return Double.NaN
		else:
			result = (Logarithm.Log((value - c) / a)) / Logarithm.Log(Constants.E)
			return result

	ExponentialEquationSolver = staticmethod(ExponentialEquationSolver)

	def LogarithmicEquationSolver(equation, value):
		equifiedEquation = Equif.Equify(equation, value).ToString()
		if not equifiedEquation.Contains("x"):
			return Double.NaN
		a = 0
		c = 0
		# Parse the equation to find coefficients
		matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)(\*?log\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
		if matches.Count == 1:
			match = matches[0]
			Double.TryParse(match.Groups[1].Value, )
			Double.TryParse(match.Groups[3].Value, )
		else:
			return Double.NaN
		# Solve for x
		if a == 0 or c < 0:
			return Double.NaN
		else:
			result = (value - c) / a
			result = Basic.Power(10, result)
			result = result / a
			return result

	LogarithmicEquationSolver = staticmethod(LogarithmicEquationSolver)

	def SolveEquation(equifiedEquation):
		dataTable = DataTable()
		parser = ExpressionParser(dataTable)
		expression = parser.Parse(equifiedEquation)
		lambda = Expression.Lambda(expression)
		function = lambda.Compile()
		return Equations.function()

	SolveEquation = staticmethod(SolveEquation)

	def SolveLinearEquation(equation, x):
		equation = "({equation})"
		equation = equation.Replace("=", "-")
		result = Equif.Equify(equation, x)
		return result

	SolveLinearEquation = staticmethod(SolveLinearEquation)

	def SolveQuadraticEquation(equation):
		equation = "({equation})"
		parts = equation.Split(Array[]((" = ")), StringSplitOptions.RemoveEmptyEntries)
		expr = parts[0]
		rhs = Double.Parse(parts[1])
		expr = Regex.Replace(expr, @"x\^2", "a")
		expr = Regex.Replace(expr, @"x", "b")
		dataTable = DataTable()
		parser = ExpressionParser(dataTable)
		expression = parser.Parse(expr)
		lambda = Expression.Lambda(expression, Expression.Parameter(clr.GetClrType(Double), "a"))
		function = lambda.Compile()
		a = Equations.function(1)
		b = Equations.function(0)
		c = -rhs
		discriminant = b * b - 4 * a * c
		if discriminant < 0:
			raise ArgumentException("Equation has no real roots.")
		root1 = (-b + Basic.SquareRoot(discriminant)) / (2 * a)
		root2 = (-b - Basic.SquareRoot(discriminant)) / (2 * a)
		return Tuple.Create(root1, root2)

	SolveQuadraticEquation = staticmethod(SolveQuadraticEquation)

	def SolveCubicEquation(equation):
		equation = "({equation})"
		parts = equation.Split(Array[]((" = ")), StringSplitOptions.RemoveEmptyEntries)
		expr = parts[0]
		rhs = Double.Parse(parts[1])
		expr = Regex.Replace(expr, @"x\^3", "a")
		expr = Regex.Replace(expr, @"x\^2", "b")
		expr = Regex.Replace(expr, @"x", "c")
		dataTable = DataTable()
		parser = ExpressionParser(dataTable)
		expression = parser.Parse(expr)
		lambda = Expression.Lambda(expression, Expression.Parameter(clr.GetClrType(Double), "a"))
		function = lambda.Compile()
		a = Equations.function(1)
		b = Equations.function(0)
		c = Equations.function(0)
		d = -rhs
		Q = (3 * a * c - b * b) / (9 * a * a)
		R = (9 * a * b * c - 27 * a * a * d - 2 * b * b * b) / (54 * a * a * a)
		D = Q * Q * Q + R * R
		if D >= 0:
			S = Math.Sign(R + Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R + Basic.SquareRoot(D)), 1.0 / 3.0)
			T = Math.Sign(R - Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R - Basic.SquareRoot(D)), 1.0 / 3.0)
			root1 = (-b / (3 * a)) + S + T
			root2 = (-b / (3 * a)) - (S + T) / 2
			root3 = (-b / (3 * a)) - (S + T) / 2
			return Tuple.Create(root1, root2, root3)
		else:
			theta = Trig.Acos(R / Basic.SquareRoot(-Q * Q * Q))
			root1 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos(theta / 3) - b / (3 * a))
			root2 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta + 2 * Constants.Pi) / 3) - b / (3 * a))
			root3 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta - 2 * Constants.Pi) / 3) - b / (3 * a))
			return Tuple.Create(root1, root2, root3)

	SolveCubicEquation = staticmethod(SolveCubicEquation)

	def SolvePolynomialEquation(coefficients):
		if coefficients == None or coefficients.Length < 2:
			raise ArgumentException("The coefficients must contain at least two values.")
		degree = coefficients.Length - 1
		if degree == 1:
			return Array[Double]((-coefficients[0] / coefficients[1]))
		if degree == 2:
			discriminant = coefficients[1] * coefficients[1] - 4 * coefficients[0] * coefficients[2]
			if discriminant >= 0:
				sqrtDiscriminant = Basic.SquareRoot(discriminant)
				r1 = (-coefficients[1] + sqrtDiscriminant) / (2 * coefficients[2])
				r2 = (-coefficients[1] - sqrtDiscriminant) / (2 * coefficients[2])
				return Array[Double]((r1, r2))
			return Array.CreateInstance(Double, 0)
		roots = Array.CreateInstance(Double, degree)
		work = Array.CreateInstance(Double, degree)
		x = 1.0
		i = 0
		while i < degree:
			work[i] = coefficients[i]
			i += 1
		i = degree - 1
		while i >= 0:
			b = work[i]
			d = 0
			j = i
			while j >= 0:
				d = d * x + work[j]
				j -= 1
			roots[i] = b / d
			x = roots[i]
			i -= 1
		return roots

	SolvePolynomialEquation = staticmethod(SolvePolynomialEquation)

	class BinomialTheorem(object):
		def Calculate(a, b, n):
			result = 1
			i = 0
			while i < n:
				result *= (a - i) / (i + 1)
				result *= b
				i += 1
			return result

		Calculate = staticmethod(Calculate)

	class PowerEquation(object):
		def Solve(baseValue, exponent):
			return Basic.Power(baseValue, exponent)

		Solve = staticmethod(Solve)

	class Differentiation(object):
		def Differentiate(equation, x):
			dataTable = DataTable()
			parser = ExpressionParser(dataTable)
			expression = parser.Parse(equation)
			lambda = Expression.Lambda(expression, Array[]((Expression.Parameter(clr.GetClrType(Double), "x"))))
			function = lambda.Compile()
			h = 0.00000001
			f1 = (Differentiation.function(x + h) - Differentiation.function(x - h)) / (2 * h)
			return f1

		Differentiate = staticmethod(Differentiate)

	class HyperbolicEquation(object):
		def Solve(equation, tolerance):
			dataTable = DataTable()
			parser = ExpressionParser(dataTable)
			expression = parser.Parse(equation)
			lambda = Expression.Lambda(expression, Array[]((Expression.Parameter(clr.GetClrType(Double), "x"))))
			function = lambda.Compile()
			x = 1.0
			y = 0.0
			dx = tolerance * 10
			while dx > tolerance:
				y = HyperbolicEquation.function(x)
				dy = HyperbolicEquation.function(x + dx) - y
				if dy == 0:
					break
				x -= y / dy
				dx = Basic.Abs(y)
			return x

		Solve = staticmethod(Solve)