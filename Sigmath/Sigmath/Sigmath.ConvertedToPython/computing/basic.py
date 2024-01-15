from System import *
from System.Data import *
from System.Linq.Expressions import *

class Basic(object):
	def Add(numbers):
		sum = 0
		enumerator = numbers.GetEnumerator()
		while enumerator.MoveNext():
			num = enumerator.Current
			sum += num
		return sum

	Add = staticmethod(Add)

	def Subtract(numbers):
		result = numbers[0]
		i = 1
		while i < numbers.Length:
			result -= numbers[i]
			i += 1
		return result

	Subtract = staticmethod(Subtract)

	def Multiply(numbers):
		product = 1
		enumerator = numbers.GetEnumerator()
		while enumerator.MoveNext():
			num = enumerator.Current
			product *= num
		return product

	Multiply = staticmethod(Multiply)

	def Divide(numbers):
		result = numbers[0]
		i = 1
		while i < numbers.Length:
			if numbers[i] == 0:
				raise DivideByZeroException()
			result /= numbers[i]
			i += 1
		return result

	Divide = staticmethod(Divide)

	def Power(baseNum, exponent):
		result = 1
		i = 0
		while i < exponent:
			result *= baseNum
			i += 1
		return result

	Power = staticmethod(Power)

	def Abs(value):
		return value if value >= 0 else -value

	Abs = staticmethod(Abs)

	def Abs(value):
		return value if value >= 0 else -value

	Abs = staticmethod(Abs)

	def Abs(value):
		return value if value >= 0 else -value

	Abs = staticmethod(Abs)

	def Abs(value):
		return value if value >= 0 else -value

	Abs = staticmethod(Abs)

	def SquareRoot(number):
		if number < 0:
			raise ArgumentException("Cannot take square root of negative number")
		guess = number / 2
		i = 0
		while i < 100:
			newGuess = (guess + number / guess) / 2
			if Basic.Abs(newGuess - guess) < 0.0001:
				break
			guess = newGuess
			i += 1
		return guess

	SquareRoot = staticmethod(SquareRoot)

	def Exp(x):
		result = 1.0
		term = 1.0
		n = 1
		while term > 0.0000001:
			term *= x / n
			result += term
			n += 1
		return result

	Exp = staticmethod(Exp)

	def CubeRoot(x):
		if x >= 0:
			return Basic.Power(x, 1.0 / 3.0)
		else:
			return -Basic.Power(-x, 1.0 / 3.0)

	CubeRoot = staticmethod(CubeRoot)

	def Evaluate(expression):
		dataTable = DataTable()
		parser = ExpressionParser(dataTable)
		parsedExpression = parser.Parse(expression)
		lambda = Expression.Lambda(parsedExpression)
		compiledExpression = lambda.Compile()
		return Basic.compiledExpression()

	Evaluate = staticmethod(Evaluate)