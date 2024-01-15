
Public Class Trig
	Private Const numTerms As Integer = 10
	Public Shared Function Sin(x As Double) As Double
		While x < 0
			x += 2 * Constants.Pi
		End While

		While x > 2 * Constants.Pi
			x -= 2 * Constants.Pi
		End While

		Dim sum As Double = 0

		For i As Integer = 0 To numTerms - 1
			sum += ((If(i Mod 2 = 0, 1, -1)) * Basic.Power(x, 2 * i + 1)) / Factorial(2 * i + 1)
		Next

		Return sum
	End Function

	Public Shared Function Cos(x As Double) As Double
		While x < 0
			x += 2 * Constants.Pi
		End While

		While x > 2 * Constants.Pi
			x -= 2 * Constants.Pi
		End While

		Dim sum As Double = 0

		For i As Integer = 0 To numTerms - 1
			sum += ((If(i Mod 2 = 0, 1, -1)) * Basic.Power(x, 2 * i)) / Factorial(2 * i)
		Next

		Return sum
	End Function

	Public Shared Function Tan(x As Double) As Double
		Return Sin(x) / Cos(x)
	End Function

	Public Shared Function Asin(x As Double) As Double
		If x < -1 OrElse x > 1 Then
			Throw New ArgumentException("Input to arcsine function must be between -1 and 1")
		End If

		Dim sum As Double = 0

		For i As Integer = 0 To numTerms - 1
			sum += (Factorial(2 * i) * Basic.Power(x, 2 * i + 1)) / (Basic.Power(4, i) * Basic.Power(Factorial(i), 2) * (2 * i + 1))
		Next

		Return sum
	End Function

	Public Shared Function Acos(x As Double) As Double
		If x < -1 OrElse x > 1 Then
			Throw New ArgumentException("Input to arccosine function must be between -1 and 1")
		End If

		Return Constants.Pi / 2 - Asin(x)
	End Function

	Public Shared Function Atan(x As Double) As Double
		Dim sum As Double = 0

		For i As Integer = 0 To numTerms - 1
			sum += ((If(i Mod 2 = 0, 1, -1)) * Basic.Power(x, 2 * i + 1)) / (2 * i + 1)
		Next

		Return sum
	End Function

	Private Shared Function Factorial(n As Integer) As Double
		Dim result As Double = 1

		For i As Integer = 1 To n
			result *= i
		Next

		Return result
	End Function
End Class
