
namespace Sigmath

import System
import System.Data
import System.Linq.Expressions

public class ExpressionParser:

	private final dataTable as DataTable

	
	public def constructor(dataTable as DataTable):
		self.dataTable = dataTable

	
	public def Parse(expression as string) as Expression:
		try:
			return Expression.Constant(dataTable.Compute(expression, null), typeof(double))
		except :
			raise ArgumentException('Invalid expression')

	
	public def Compile(expression as Expression) as Func[of double]:
		try:
			lambda as var = Expression.Lambda(expression)
			compiled as var = lambda.Compile()
			return compiled
		except :
			raise ArgumentException('Invalid expression')

