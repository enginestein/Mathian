
Public Class Compl

	Public Structure Complex
		Public ReadOnly Property Real() As Double
		Public ReadOnly Property Imaginary() As Double

		Public Sub New(real__1 As Double, imaginary__2 As Double)
			Real = real__1
			Imaginary = imaginary__2
		End Sub

		Public Shared Operator +(a As Complex, b As Complex) As Complex
			Return New Complex(a.Real + b.Real, a.Imaginary + b.Imaginary)
		End Operator

		Public Shared Operator -(a As Complex, b As Complex) As Complex
			Return New Complex(a.Real - b.Real, a.Imaginary - b.Imaginary)
		End Operator

		Public Shared Operator *(a As Complex, b As Complex) As Complex
			Return New Complex(a.Real * b.Real - a.Imaginary * b.Imaginary, a.Real * b.Imaginary + a.Imaginary * b.Real)
		End Operator

		Public Shared Operator /(a As Complex, b As Complex) As Complex
			Dim denominator = b.Real * b.Real + b.Imaginary * b.Imaginary
			Dim numeratorReal = a.Real * b.Real + a.Imaginary * b.Imaginary
			Dim numeratorImaginary = a.Imaginary * b.Real - a.Real * b.Imaginary

			Return New Complex(numeratorReal / denominator, numeratorImaginary / denominator)
		End Operator

		Public Shared Widening Operator CType(v As Integer) As Complex
			Throw New NotImplementedException()
		End Operator

		Public Shared Function Abs(a As Complex) As Double
			Return Basic.SquareRoot(a.Real * a.Real + a.Imaginary * a.Imaginary)
		End Function

		Public Shared Function Magnitude(number As Complex) As Double
			Return Basic.SquareRoot(number.Real * number.Real + number.Imaginary * number.Imaginary)
		End Function
	End Structure
End Class
