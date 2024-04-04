Public Class Nums

	Public Shared Function Gcd(a As Integer, b As Integer) As Integer
		While b <> 0
			Dim temp As Integer = b
			b = a Mod b
			a = temp
		End While
		Return a
	End Function

	Public Shared Function Lcm(a As Integer, b As Integer) As Integer
		Return Basic.Abs(a * b) \ Gcd(a, b)
	End Function

	Public Shared Function [Mod](a As Integer, b As Integer) As Integer
		Dim r As Integer = a Mod b
		Return If(r < 0, r + b, r)
	End Function
End Class
