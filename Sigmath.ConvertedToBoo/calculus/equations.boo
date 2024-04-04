
namespace Sigmath

import System
import System.Data
import System.Linq.Expressions
import System.Text.RegularExpressions

public class Equations:

	
	public static def ExponentialEquationSolver(equation as string, value as double) as double:
		equifiedEquation as var = Equif.Equify(equation, value).ToString()
		
		if not equifiedEquation.Contains('x'):
			return double.NaN
		
		a as double = 0
		c as double = 0
		
		matches as MatchCollection = Regex.Matches(equifiedEquation, '(\\d+\\.?\\d*)([eE]\\^\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?')
		if matches.Count == 1:
			match as Match = matches[0]
			double.TryParse(match.Groups[1].Value, a)
			double.TryParse(match.Groups[3].Value, c)
		else:
			return double.NaN
		
		if a == 0:
			return double.NaN
		else:
			result as double = (Logarithm.Log(((value - c) / a)) / Logarithm.Log(Constants.E))
			return result
		

	
	public static def LogarithmicEquationSolver(equation as string, value as double) as double:
		equifiedEquation as var = Equif.Equify(equation, value).ToString()
		
		if not equifiedEquation.Contains('x'):
			return double.NaN
		
		a as double = 0
		c as double = 0
		
		// Parse the equation to find coefficients
		matches as MatchCollection = Regex.Matches(equifiedEquation, '(\\d+\\.?\\d*)(\\*?log\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?')
		if matches.Count == 1:
			match as Match = matches[0]
			double.TryParse(match.Groups[1].Value, a)
			double.TryParse(match.Groups[3].Value, c)
		else:
			return double.NaN
		
		// Solve for x
		if (a == 0) or (c < 0):
			return double.NaN
		else:
			result as double = ((value - c) / a)
			result = Basic.Power(10, result)
			result = (result / a)
			return result

	
	public static def SolveEquation(equifiedEquation as string) as double:
		dataTable as var = DataTable()
		parser as var = ExpressionParser(dataTable)
		expression as var = parser.Parse(equifiedEquation)
		
		lambda as var = Expression.Lambda((expression cast Expression))
		function as var = lambda.Compile()
		return function()

	public static def SolveLinearEquation(equation as string, x as double) as double:
		equation = '({equation})'
		equation = equation.Replace('=', '-')
		result as double = Equif.Equify(equation, x)
		return result

	
	public static def SolveQuadraticEquation(equation as string) as Tuple[of double, double]:
		equation = '({equation})'
		parts as var = equation.Split((' = ',), StringSplitOptions.RemoveEmptyEntries)
		expr as var = parts[0]
		rhs as var = double.Parse(parts[1])
		expr = Regex.Replace(expr, 'x\\^2', 'a')
		expr = Regex.Replace(expr, 'x', 'b')
		dataTable as var = DataTable()
		parser as var = ExpressionParser(dataTable)
		expression as var = parser.Parse(expr)
		lambda as var = Expression.Lambda((expression cast Expression), Expression.Parameter(typeof(double), 'a'))
		function as Func[of double, double] = lambda.Compile()
		a as double = function(1)
		b as double = function(0)
		c as double = (-rhs)
		discriminant as double = ((b * b) - ((4 * a) * c))
		if discriminant < 0:
			raise ArgumentException('Equation has no real roots.')
		root1 as double = (((-b) + Basic.SquareRoot(discriminant)) / (2 * a))
		root2 as double = (((-b) - Basic.SquareRoot(discriminant)) / (2 * a))
		return Tuple.Create(root1, root2)

	
	public static def SolveCubicEquation(equation as string) as Tuple[of double, double, double]:
		root3 as double
		root2 as double
		root1 as double
		equation = '({equation})'
		parts as var = equation.Split((' = ',), StringSplitOptions.RemoveEmptyEntries)
		expr as var = parts[0]
		rhs as var = double.Parse(parts[1])
		expr = Regex.Replace(expr, 'x\\^3', 'a')
		expr = Regex.Replace(expr, 'x\\^2', 'b')
		expr = Regex.Replace(expr, 'x', 'c')
		dataTable as var = DataTable()
		parser as var = ExpressionParser(dataTable)
		expression as var = parser.Parse(expr)
		lambda as var = Expression.Lambda((expression cast Expression), Expression.Parameter(typeof(double), 'a'))
		function as Func[of double, double] = lambda.Compile()
		a as double = function(1)
		b as double = function(0)
		c as double = function(0)
		d as double = (-rhs)
		Q as double = ((((3 * a) * c) - (b * b)) / ((9 * a) * a))
		R as double = ((((((9 * a) * b) * c) - (((27 * a) * a) * d)) - (((2 * b) * b) * b)) / (((54 * a) * a) * a))
		D as double = (((Q * Q) * Q) + (R * R))
		if D >= 0:
			S as double = (Math.Sign((R + Basic.SquareRoot(D))) * Math.Pow(Basic.Abs((R + Basic.SquareRoot(D))), (1.0 / 3.0)))
			T as double = (Math.Sign((R - Basic.SquareRoot(D))) * Math.Pow(Basic.Abs((R - Basic.SquareRoot(D))), (1.0 / 3.0)))
			root1 = ((((-b) / (3 * a)) + S) + T)
			root2 = (((-b) / (3 * a)) - ((S + T) / 2))
			root3 = (((-b) / (3 * a)) - ((S + T) / 2))
			return Tuple.Create(root1, root2, root3)
		else:
			theta as double = Trig.Acos((R / Basic.SquareRoot((((-Q) * Q) * Q))))
			root1 = ((((-2) * Basic.SquareRoot(-Q)) * Trig.Cos((theta / 3))) - (b / (3 * a)))
			root2 = ((((-2) * Basic.SquareRoot(-Q)) * Trig.Cos(((theta + (2 * Constants.Pi)) / 3))) - (b / (3 * a)))
			root3 = ((((-2) * Basic.SquareRoot(-Q)) * Trig.Cos(((theta - (2 * Constants.Pi)) / 3))) - (b / (3 * a)))
			return Tuple.Create(root1, root2, root3)

	
	public static def SolvePolynomialEquation(coefficients as (double)) as (double):
		if (coefficients is null) or (coefficients.Length < 2):
			raise ArgumentException('The coefficients must contain at least two values.')
		
		degree as int = (coefficients.Length - 1)
		
		if degree == 1:
			return (of double: ((-coefficients[0]) / coefficients[1]))
		
		if degree == 2:
			discriminant as double = ((coefficients[1] * coefficients[1]) - ((4 * coefficients[0]) * coefficients[2]))
			
			if discriminant >= 0:
				sqrtDiscriminant as double = Basic.SquareRoot(discriminant)
				r1 as double = (((-coefficients[1]) + sqrtDiscriminant) / (2 * coefficients[2]))
				r2 as double = (((-coefficients[1]) - sqrtDiscriminant) / (2 * coefficients[2]))
				return (of double: r1, r2)
			
			return array(double, 0)
		
		roots as (double) = array(double, degree)
		work as (double) = array(double, degree)
		
		x = 1.0
		for i in range(0, degree):
		
			work[i] = coefficients[i]
		for i in range((degree - 1), -1, -1):
		
			b as double = work[i]
			d as double = 0
			for j in range(i, -1, -1):
			
				d = ((d * x) + work[j])
			
			roots[i] = (b / d)
			x = roots[i]
		
		return roots

	
	internal class BinomialTheorem:

		public static def Calculate(a as double, b as double, n as double) as double:
			result as double = 1
			for i in range(0, n):
				result *= ((a - i) / (i + 1))
				result *= b
			return result

	
	internal class PowerEquation:

		public static def Solve(baseValue as double, exponent as double) as double:
			return Basic.Power(baseValue, exponent)

	
	internal class Differentiation:

		public static def Differentiate(equation as string, x as double) as double:
			dataTable as var = DataTable()
			parser as var = ExpressionParser(dataTable)
			expression as var = parser.Parse(equation)
			
			lambda as var = Expression.Lambda((expression cast Expression), (Expression.Parameter(typeof(double), 'x'),))
			function as var = lambda.Compile()
			
			h = 0.00000001
			f1 as double = ((function((x + h)) - function((x - h))) / (2 * h))
			return f1

	
	internal class HyperbolicEquation:

		public static def Solve(equation as string, tolerance as double) as double:
			dataTable as var = DataTable()
			parser as var = ExpressionParser(dataTable)
			expression as var = parser.Parse(equation)
			
			lambda as var = Expression.Lambda((expression cast Expression), (Expression.Parameter(typeof(double), 'x'),))
			function as var = lambda.Compile()
			
			x = 1.0
			y = 0.0
			dx as double = (tolerance * 10)
			while dx > tolerance:
				y = function(x)
				dy as double = (function((x + dx)) - y)
				if dy == 0:
					break 
				x -= (y / dy)
				dx = Basic.Abs(y)
			return x
	
	
	


