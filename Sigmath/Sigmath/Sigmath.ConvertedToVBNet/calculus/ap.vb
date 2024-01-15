
Public Class ArithmeticProgression

	Public Shared Function Arithmetic(firstTerm As Double, commonDifference As Double, numTerms As Integer) As Double()
		Dim terms As Double() = New Double(numTerms - 1) {}
		For i As Integer = 0 To numTerms - 1
			terms(i) = firstTerm + i * commonDifference
		Next
		Return terms
	End Function

	Public Shared Function ArithmeticSum(firstTerm As Double, commonDifference As Double, numTerms As Integer) As Double
		Return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2
	End Function

	Public Shared Function NthTerm(n As Integer, a1 As Double, d As Double) As Double
		Return a1 + (n - 1) * d
	End Function

	Public Shared Function TermNumber(an As Double, a1 As Double, d As Double) As Integer
		Dim n As Double = (an - a1) / d + 1
		Return Convert.ToInt32(n)
	End Function

	Public Shared Function TermNumber(an As Double, n As Integer, a1 As Double) As Integer
		Dim d As Double = (an - a1) / (n - 1)
		Return Convert.ToInt32(d)
	End Function

	Public Shared Function CommonDifference(an As Double, a1 As Double, n As Integer) As Double
		Return (an - a1) / (n - 1)
	End Function

	Public Shared Function FirstTerm(an As Double, n As Integer, d As Double) As Double
		Return an - (n - 1) * d
	End Function

	Public Shared Function LastTerm(a1 As Double, n As Integer, d As Double) As Double
		Return a1 + (n - 1) * d
	End Function
End Class
