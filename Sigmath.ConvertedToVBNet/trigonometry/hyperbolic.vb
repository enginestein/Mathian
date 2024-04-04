
Public Class Hyperbolic
	Public Shared Function Sinh(x As Double) As Double
		Return (Basic.Exp(x) - Basic.Exp(-x)) / 2
	End Function

	Public Shared Function Cosh(x As Double) As Double
		Return (Basic.Exp(x) + Basic.Exp(-x)) / 2
	End Function

	Public Shared Function Tanh(x As Double) As Double
		Return Sinh(x) / Cosh(x)
	End Function

	Public Shared Function Sech(x As Double) As Double
		Return 1 / Cosh(x)
	End Function

	Public Shared Function Csch(x As Double) As Double
		Return 1 / Sinh(x)
	End Function

	Public Shared Function Coth(x As Double) As Double
		Return 1 / Tanh(x)
	End Function

	Public Shared Function Asinh(x As Double) As Double
		Return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) + 1))
	End Function

	Public Shared Function Acosh(x As Double) As Double
		If x < 1 Then
			Throw New ArgumentException("Input to inverse hyperbolic cosine function must be greater than or equal to 1")
		End If
		Return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) - 1))
	End Function

	Public Shared Function Atanh(x As Double) As Double
		If x <= -1 OrElse x >= 1 Then
			Throw New ArgumentException("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)")
		End If
		Return 0.5 * Logarithm.Log((1 + x) / (1 - x))
	End Function

	Public Shared Function Asech(x As Double) As Double
		If x <= 0 OrElse x >= 1 Then
			Throw New ArgumentException("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)")
		End If
		Return Acosh(1 / x)
	End Function

	Public Shared Function Acsch(x As Double) As Double
		If x <= 0 Then
			Throw New ArgumentException("Input to inverse hyperbolic cosecant function must be greater than 0")
		End If
		Return Asinh(1 / x)
	End Function

	Public Shared Function Acoth(x As Double) As Double
		If x <= -1 OrElse x >= 1 Then
			Throw New ArgumentException("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)")
		End If
		Return 0.5 * Logarithm.Log((x + 1) / (x - 1))
	End Function
End Class
