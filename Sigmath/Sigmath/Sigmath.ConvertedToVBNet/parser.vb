Imports System.Data
Imports System.Linq.Expressions

Public Class ExpressionParser
	Private ReadOnly dataTable As DataTable

	Public Sub New(dataTable As DataTable)
		Me.dataTable = dataTable
	End Sub

	Public Function Parse(expression__1 As String) As Expression
		Try
			Return Expression.Constant(dataTable.Compute(expression__1, Nothing), GetType(Double))
		Catch
			Throw New ArgumentException("Invalid expression")
		End Try
	End Function

	Public Function Compile(expression__1 As Expression) As Func(Of Double)
		Try
			Dim lambda = Expression.Lambda(Of Func(Of Double))(expression__1)
			Dim compiled = lambda.Compile()
			Return compiled
		Catch
			Throw New ArgumentException("Invalid expression")
		End Try
	End Function
End Class
