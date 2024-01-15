import clr

from System import *
from System.Data import *
from System.Linq.Expressions import *

class ExpressionParser(object):
	def __init__(self, dataTable):
		self._dataTable = dataTable

	def Parse(self, expression):
		try:
			return Expression.Constant(self._dataTable.Compute(expression, None), clr.GetClrType(Double))
		except , :
			raise ArgumentException("Invalid expression")
		finally:

	def Compile(self, expression):
		try:
			lambda = Expression.Lambda(expression)
			compiled = lambda.Compile()
			return compiled
		except , :
			raise ArgumentException("Invalid expression")
		finally: