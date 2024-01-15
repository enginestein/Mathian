Public Class Computing
	Public Shared Function Floor(x As Double) As Integer
		Return CInt(Math.Truncate(If(x >= 0, x, x - 0.999999999999999)))
	End Function

	Public Shared Function Ceil(x As Double) As Integer
		Return CInt(Math.Truncate(If(x >= 0, x + 0.999999999999999, x)))
	End Function

	Public Shared Function Round(x As Double) As Integer
		Return CInt(Math.Truncate(If(x >= 0, x + 0.5, x - 0.5)))
	End Function
End Class
