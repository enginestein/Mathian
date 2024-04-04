
namespace Sigmath

import System
import System.Data
import System.Linq.Expressions

public class Basic:

	public static def Add(*numbers as (double)) as double:
		sum as double = 0
		for num as double in numbers:
			sum += num
		return sum

	
	public static def Subtract(*numbers as (double)) as double:
		result as double = numbers[0]
		for i in range(1, numbers.Length):
			result -= numbers[i]
		return result

	
	public static def Multiply(*numbers as (double)) as double:
		product as double = 1
		for num as double in numbers:
			product *= num
		return product

	
	public static def Divide(*numbers as (double)) as double:
		result as double = numbers[0]
		for i in range(1, numbers.Length):
			if numbers[i] == 0:
				raise DivideByZeroException()
			result /= numbers[i]
		return result

	
	public static def Power(baseNum as double, exponent as double) as double:
		result as double = 1
		for i in range(0, exponent):
			result *= baseNum
		return result

	
	public static def Abs(value as double) as double:
		return (value if (value >= 0) else (-value))

	
	public static def Abs(value as single) as single:
		return (value if (value >= 0) else (-value))

	
	public static def Abs(value as int) as int:
		return (value if (value >= 0) else (-value))

	
	public static def Abs(value as long) as long:
		return (value if (value >= 0) else (-value))

	public static def SquareRoot(number as double) as double:
		if number < 0:
			raise ArgumentException('Cannot take square root of negative number')
		guess as double = (number / 2)
		for i in range(0, 100):
			newGuess as double = ((guess + (number / guess)) / 2)
			if Abs((newGuess - guess)) < 0.0001:
				break 
			guess = newGuess
		return guess

	
	public static def Exp(x as double) as double:
		result = 1.0
		term = 1.0
		n = 1
		while term > 0.0000001:
			term *= (x / n)
			result += term
			n += 1
		return result

	
	public static def CubeRoot(x as double) as double:
		if x >= 0:
			return Power(x, (1.0 / 3.0))
		else:
			return (-Power(-x, (1.0 / 3.0)))

	
	public static def Evaluate(expression as string) as double:
		dataTable as var = DataTable()
		parser as var = ExpressionParser(dataTable)
		parsedExpression as var = parser.Parse(expression)
		lambda as var = Expression.Lambda((parsedExpression cast Expression))
		compiledExpression as var = lambda.Compile()
		return compiledExpression()
	

