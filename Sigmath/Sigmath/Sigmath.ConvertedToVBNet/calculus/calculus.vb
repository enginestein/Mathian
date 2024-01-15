Imports System.Collections.Generic

Public Class Calculus
	Public Shared Function Derivative(f As Func(Of Double, Double), x As Double) As Double
		Const  dx As Double = 1E-09
		' small increment to find the derivative
		Dim y1 As Double = f(x)
		Dim y2 As Double = f(x + dx)
		Dim derivative__1 As Double = (y2 - y1) / dx
		Return derivative__1
	End Function

	Public Shared Function Integral(f As Func(Of Double, Double), a As Double, b As Double, n As Integer) As Double
		Dim h As Double = (b - a) / n
		Dim integral__1 As Double = 0
		For i As Integer = 1 To n - 1
			Dim x As Double = a + i * h
			integral__1 += f(x)
		Next
		integral__1 += (f(a) + f(b)) / 2
		integral__1 *= h
		Return integral__1
	End Function

	Public Shared Function Limit(f As Func(Of Double, Double), g As Func(Of Double, Double), x As Double) As Double
		Const  maxIterations As Integer = 1000
		Const  tolerance As Double = 1E-09
		Dim fx As Double = f(x)
		Dim gx As Double = g(x)
		Dim limit__1 As Double = fx / gx
		For i As Integer = 0 To maxIterations - 1
			Dim fx1 As Double = Derivative(f, x)
			Dim gx1 As Double = Derivative(g, x)
			Dim newLimit As Double = fx1 / gx1
			If Basic.Abs(newLimit - limit__1) < tolerance Then
				Return newLimit
			End If
			limit__1 = newLimit
			x += 1E-09
		Next
		Throw New Exception("Limit does not exist or cannot be computed with L'Hopital's Rule.")
	End Function

	Public Shared Function FindRoot(f As Func(Of Double, Double), a As Double, b As Double, Optional epsilon As Double = 1E-06) As Double
		If f(a) * f(b) > 0 Then
			Throw New ArgumentException("Function must have opposite signs at interval endpoints")
		End If

		Dim c As Double = (a + b) / 2

		While Math.Abs(f(c)) > epsilon
			If f(a) * f(c) < 0 Then
				b = c
			Else
				a = c
			End If

			c = (a + b) / 2
		End While

		Return c
	End Function

	Private Shared Function Factorial(n As Integer) As Integer
		Dim result As Integer = 1

		For i As Integer = 2 To n
			result *= i
		Next

		Return result
	End Function

	Public Shared Function PartialDerivative(f As Func(Of Double(), Double), index As Integer, Optional h As Double = 1E-06) As Func(Of Double(), Double)
		Return Function(x) 
		Dim xPlus = DirectCast(x.Clone(), Double())
		xPlus(index) += h

		Dim xMinus = DirectCast(x.Clone(), Double())
		xMinus(index) -= h

		Return (f(xPlus) - f(xMinus)) / (2 * h)

End Function
	End Function

	Public Shared Function Gradient(f As Func(Of Double(), Double), Optional h As Double = 1E-06) As Func(Of Double(), Double())
		Return Function(x) 
		Dim gradient__1 = New Double(x.Length - 1) {}

		For i As Integer = 0 To x.Length - 1
			gradient__1(i) = PartialDerivative(f, i, h)(x)
		Next

		Return gradient__1

End Function
	End Function

	Public Shared Function Hessian(f As Func(Of Double(), Double), Optional h As Double = 1E-06) As Func(Of Double(), Double(,))
		Return Function(x) 
		Dim n As Integer = x.Length
		Dim hessian__1 = New Double(n - 1, n - 1) {}

		For i As Integer = 0 To n - 1
			For j As Integer = 0 To n - 1
				Dim fxx = PartialDerivative(PartialDerivative(f, i, h), j, h)(x)
				hessian__1(i, j) = fxx
			Next
		Next

		Return hessian__1

End Function
	End Function

	Public Shared Function FindCriticalPoints(f As Func(Of Double, Double), a As Double, b As Double, Optional epsilon As Double = 1E-06) As Double()
		Dim criticalPoints = New List(Of Double)()

		' Evaluate function at endpoints of interval
		Dim fa As Double = f(a)
		Dim fb As Double = f(b)

		' Check if endpoints are critical points
		If Math.Abs(fa) < epsilon Then
			criticalPoints.Add(a)
		End If
		If Math.Abs(fb) < epsilon Then
			criticalPoints.Add(b)
		End If

		' Find critical points in the interval
		Dim x As Double = a
		Dim fx As Double = f(a)

		While x < b
			Dim xNext As Double = x + epsilon
			Dim fxNext As Double = f(xNext)

			' Check if the current point is a critical point
			If Math.Abs(fx) < epsilon AndAlso x > a AndAlso x < b Then
				criticalPoints.Add(x)
			End If

			' Check if the function changes sign between x and xNext
			If fx * fxNext < 0 Then
				' Use bisection method to find a root
				Dim xLeft As Double = x
				Dim xRight As Double = xNext

				While xRight - xLeft > epsilon
					Dim xMid As Double = (xLeft + xRight) / 2
					Dim fxMid As Double = f(xMid)

					If Math.Abs(fxMid) < epsilon Then
						criticalPoints.Add(xMid)
						Exit While
					End If

					If fx * fxMid < 0 Then
						xRight = xMid
					Else
						xLeft = xMid
					End If
				End While
			End If

			x = xNext
			fx = fxNext
		End While

		Return criticalPoints.ToArray()
	End Function

	Public Enum RiemannSumType
		Left
		Right
		Midpoint
		Trapezoidal
	End Enum

	Public Shared Function RiemannSum(f As Func(Of Double, Double), a As Double, b As Double, n As Integer, Optional type As RiemannSumType = RiemannSumType.Left) As Double
		Dim dx As Double = (b - a) / n
		Dim sum As Double = 0

		For i As Integer = 0 To n - 1
			Dim x As Double = a + i * dx
			Dim fx As Double = f(x)

			Select Case type
				Case RiemannSumType.Left
					sum += fx * dx
					Exit Select
				Case RiemannSumType.Right
					sum += f(x + dx) * dx
					Exit Select
				Case RiemannSumType.Midpoint
					sum += f(x + dx / 2) * dx
					Exit Select
				Case RiemannSumType.Trapezoidal
					sum += (fx + f(x + dx)) * dx / 2
					Exit Select
			End Select
		Next

		Return sum
	End Function

	Public Shared Function DefiniteIntegral(f As Func(Of Double, Double), a As Double, b As Double, Optional n As Integer = 1000) As Double
		Return RiemannSum(f, a, b, n, RiemannSumType.Midpoint)
	End Function
End Class
