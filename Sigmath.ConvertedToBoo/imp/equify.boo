
namespace Sigmath

import System
import System.Data
import System.Linq.Expressions
import System.Text.RegularExpressions

public class Equif:

	public static def Equify(equation as string, value as double) as double:
		equation = Regex.Replace(equation, '[A-Za-z]+', def (match):
			if (match.Index > 0) and char.IsDigit(equation[(match.Index - 1)]):
				return match.Value
			else:
				return value.ToString()
)
		
		dataTable as var = DataTable()
		parser as var = ExpressionParser(dataTable)
		expression as var = parser.Parse(equation)
		
		lambda as var = Expression.Lambda((expression cast Expression))
		function as var = lambda.Compile()
		return function()
	
	
	
	

