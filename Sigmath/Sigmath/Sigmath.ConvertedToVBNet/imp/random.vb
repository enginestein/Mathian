

Public Class Rand
	Private Const a As Long = 6364136223846793005L
	Private Const c As Long = 1442695040888963407L
	Private Const m As Long = 9223372036854775783L
	Private seed As Long

	Public Sub New()
		seed = DateTime.Now.Ticks
	End Sub

	Public Sub New(seed As Long)
		Me.seed = seed
	End Sub

	Public Function NextLong() As Long
		seed = (a * seed + c) Mod m
		Return seed
	End Function

	Public Function NextDouble() As Double
		Return CDbl(NextLong()) / m
	End Function

	Public Function [Next](minValue As Integer, maxValue As Integer) As Integer
		If minValue >= maxValue Then
			Throw New ArgumentException("minValue must be less than maxValue")
		End If

		Dim range As Long = CLng(maxValue) - minValue
		Return CInt(Math.Truncate(NextDouble() * range)) + minValue
	End Function

	Public Function [Next](maxValue As Integer) As Integer
		Return [Next](0, maxValue)
	End Function

	Public Function [Next]() As Integer
		Return [Next](Integer.MinValue, Integer.MaxValue)
	End Function
End Class
Friend Class Random
	Public Shared Function RandUniform(min As Double, max As Double) As Double
		Dim rand As New Rand()
		Return rand.NextDouble() * (max - min) + min
	End Function

	Public Shared Function RandNormal(mean As Double, stdDev As Double) As Double
		Dim rand As New Rand()
		Dim u1 As Double = rand.NextDouble()
		Dim u2 As Double = rand.NextDouble()
		Dim z0 As Double = Basic.SquareRoot(-2 * Logarithm.Log(u1)) * Trig.Cos(2 * Constants.Pi * u2)
		Return z0 * stdDev + mean
	End Function

	Public Shared Function RandPoisson(lambda As Double) As Integer
		Dim rand As New Rand()
		Dim L As Double = Basic.Exp(-lambda)
		Dim p As Double = 1
		Dim k As Integer = 0
		Do
			k += 1
			p *= rand.NextDouble()
		Loop While p > L
		Return k - 1
	End Function
End Class
