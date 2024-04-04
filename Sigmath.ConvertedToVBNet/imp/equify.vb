Imports System.Data
Imports System.Linq.Expressions
Imports System.Text.RegularExpressions

Public Class Equif
	Public Shared Function Equify(equation As String, value As Double) As Double
		equation = Regex.Replace(equation, "[A-Za-z]+", Function(match) 
		If match.Index > 0 AndAlso Char.IsDigit(equation(match.Index - 1)) Then
			Return match.Value
		Else
			Return value.ToString()
		End If

End Function)

		Dim dataTable = New DataTable()
		Dim parser = New ExpressionParser(dataTable)
		Dim expression__1 = parser.Parse(equation)

		Dim lambda = Expression.Lambda(Of Func(Of Double))(DirectCast(expression__1, Expression))
		Dim [function] = lambda.Compile()
		Return [function]()
	End Function




End Class
