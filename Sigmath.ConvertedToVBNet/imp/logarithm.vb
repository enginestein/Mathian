
Public Class Logarithm
	Private Const EPSILON As Double = 1E-14

	Public Shared Function Log(x As Double) As Double
		If x <= 0 Then
			Throw New ArgumentException("Invalid argument: x must be positive")
		End If

		Dim y As Double = 0
		Dim k As Integer = 0
		While x >= 2
			x /= 2
			k += 1
		End While
		While x < 1
			x *= 2
			k -= 1
		End While
		Dim z As Double = x - 1
		Dim z2 As Double = z * z
		Dim z3 As Double = z * z2
		y = 2 * z / (1 + z) + 0.5 * z2 / (1 + z) - 0.25 * z3 / ((1 + z) * (1 + z)) + z3 / (3 * (1 + z) * (1 + z) * (1 + z))
		Return y + k
	End Function

	Public Shared Function Log10(x As Double) As Double
		If x <= 0 Then
			Throw New ArgumentException("Invalid argument: x must be positive")
		End If
		Return Log(x) / Log(10)
	End Function


	Public Shared Function Logn(n As Double, x As Double) As Double
		Return Log(x) / Log(n)
	End Function
End Class
