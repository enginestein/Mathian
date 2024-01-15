Imports System.Data
Imports System.Linq.Expressions

Public Class Basic
	Public Shared Function Add(ParamArray numbers As Double()) As Double
		Dim sum As Double = 0
		For Each num As Double In numbers
			sum += num
		Next
		Return sum
	End Function

	Public Shared Function Subtract(ParamArray numbers As Double()) As Double
		Dim result As Double = numbers(0)
		For i As Integer = 1 To numbers.Length - 1
			result -= numbers(i)
		Next
		Return result
	End Function

	Public Shared Function Multiply(ParamArray numbers As Double()) As Double
		Dim product As Double = 1
		For Each num As Double In numbers
			product *= num
		Next
		Return product
	End Function

	Public Shared Function Divide(ParamArray numbers As Double()) As Double
		Dim result As Double = numbers(0)
		For i As Integer = 1 To numbers.Length - 1
			If numbers(i) = 0 Then
				Throw New DivideByZeroException()
			End If
			result /= numbers(i)
		Next
		Return result
	End Function

	Public Shared Function Power(baseNum As Double, exponent As Double) As Double
		Dim result As Double = 1
		For i As Integer = 0 To exponent - 1
			result *= baseNum
		Next
		Return result
	End Function

	Public Shared Function Abs(value As Double) As Double
		Return If(value >= 0, value, -value)
	End Function

	Public Shared Function Abs(value As Single) As Single
		Return If(value >= 0, value, -value)
	End Function

	Public Shared Function Abs(value As Integer) As Integer
		Return If(value >= 0, value, -value)
	End Function

	Public Shared Function Abs(value As Long) As Long
		Return If(value >= 0, value, -value)
	End Function
	Public Shared Function SquareRoot(number As Double) As Double
		If number < 0 Then
			Throw New ArgumentException("Cannot take square root of negative number")
		End If
		Dim guess As Double = number / 2
		For i As Integer = 0 To 99
			Dim newGuess As Double = (guess + number / guess) / 2
			If Abs(newGuess - guess) < 0.0001 Then
				Exit For
			End If
			guess = newGuess
		Next
		Return guess
	End Function

	Public Shared Function Exp(x As Double) As Double
		Dim result As Double = 1.0
		Dim term As Double = 1.0
		Dim n As Integer = 1
		While term > 1E-07
			term *= x / n
			result += term
			n += 1
		End While
		Return result
	End Function

	Public Shared Function CubeRoot(x As Double) As Double
		If x >= 0 Then
			Return Power(x, 1.0 / 3.0)
		Else
			Return -Power(-x, 1.0 / 3.0)
		End If
	End Function

	Public Shared Function Evaluate(expression__1 As String) As Double
		Dim dataTable = New DataTable()
		Dim parser = New ExpressionParser(dataTable)
		Dim parsedExpression = parser.Parse(expression__1)
		Dim lambda = Expression.Lambda(Of Func(Of Double))(DirectCast(parsedExpression, Expression))
		Dim compiledExpression = lambda.Compile()
		Return compiledExpression()
	End Function

End Class
