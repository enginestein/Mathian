from System import *
from System.Data import *
from System.Linq.Expressions import *
from System.Text.RegularExpressions import *

class Equif(object):
	def Equify(equation, value):
		equation = Regex.Replace(equation, @"[A-Za-z]+", )
		dataTable = DataTable()
		parser = ExpressionParser(dataTable)
		expression = parser.Parse(equation)
		lambda = Expression.Lambda(expression)
		function = lambda.Compile()
		return Equif.function()

	Equify = staticmethod(Equify)