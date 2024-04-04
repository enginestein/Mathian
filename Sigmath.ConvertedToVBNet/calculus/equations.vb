Imports System.Data
Imports System.Linq.Expressions
Imports System.Text.RegularExpressions

Public Class Equations

	Public Shared Function ExponentialEquationSolver(equation As String, value As Double) As Double
		Dim equifiedEquation = Equif.Equify(equation, value).ToString()

		If Not equifiedEquation.Contains("x") Then
			Return Double.NaN
		End If

		Dim a As Double = 0
		Dim c As Double = 0

		Dim matches As MatchCollection = Regex.Matches(equifiedEquation, "(\d+\.?\d*)([eE]\^\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
		If matches.Count = 1 Then
			Dim match As Match = matches(0)
			Double.TryParse(match.Groups(1).Value, a)
			Double.TryParse(match.Groups(3).Value, c)
		Else
			Return Double.NaN
		End If

		If a = 0 Then
			Return Double.NaN
		Else
			Dim result As Double = (Logarithm.Log((value - c) / a)) / Logarithm.Log(Constants.E)
			Return result
		End If

	End Function

	Public Shared Function LogarithmicEquationSolver(equation As String, value As Double) As Double
		Dim equifiedEquation = Equif.Equify(equation, value).ToString()

		If Not equifiedEquation.Contains("x") Then
			Return Double.NaN
		End If

		Dim a As Double = 0
		Dim c As Double = 0

		' Parse the equation to find coefficients
		Dim matches As MatchCollection = Regex.Matches(equifiedEquation, "(\d+\.?\d*)(\*?log\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?")
		If matches.Count = 1 Then
			Dim match As Match = matches(0)
			Double.TryParse(match.Groups(1).Value, a)
			Double.TryParse(match.Groups(3).Value, c)
		Else
			Return Double.NaN
		End If

		' Solve for x
		If a = 0 OrElse c < 0 Then
			Return Double.NaN
		Else
			Dim result As Double = (value - c) / a
			result = Basic.Power(10, result)
			result = result / a
			Return result
		End If
	End Function

	Public Shared Function SolveEquation(equifiedEquation As String) As Double
		Dim dataTable = New DataTable()
		Dim parser = New ExpressionParser(dataTable)
		Dim expression__1 = parser.Parse(equifiedEquation)

		Dim lambda = Expression.Lambda(Of Func(Of Double))(DirectCast(expression__1, Expression))
		Dim [function] = lambda.Compile()
		Return [function]()
	End Function
	Public Shared Function SolveLinearEquation(equation As String, x As Double) As Double
		equation = "({equation})"
		equation = equation.Replace("=", "-")
		Dim result As Double = Equif.Equify(equation, x)
		Return result
	End Function

	Public Shared Function SolveQuadraticEquation(equation As String) As Tuple(Of Double, Double)
		equation = "({equation})"
		Dim parts = equation.Split(New () {" = "}, StringSplitOptions.RemoveEmptyEntries)
		Dim expr = parts(0)
		Dim rhs = Double.Parse(parts(1))
		expr = Regex.Replace(expr, "x\^2", "a")
		expr = Regex.Replace(expr, "x", "b")
		Dim dataTable = New DataTable()
		Dim parser = New ExpressionParser(dataTable)
		Dim expression__1 = parser.Parse(expr)
		Dim lambda = Expression.Lambda(Of Func(Of Double, Double))(DirectCast(expression__1, Expression), Expression.Parameter(GetType(Double), "a"))
		Dim [function] As Func(Of Double, Double) = lambda.Compile()
		Dim a As Double = [function](1)
		Dim b As Double = [function](0)
		Dim c As Double = -rhs
		Dim discriminant As Double = b * b - 4 * a * c
		If discriminant < 0 Then
			Throw New ArgumentException("Equation has no real roots.")
		End If
		Dim root1 As Double = (-b + Basic.SquareRoot(discriminant)) / (2 * a)
		Dim root2 As Double = (-b - Basic.SquareRoot(discriminant)) / (2 * a)
		Return Tuple.Create(root1, root2)
	End Function

	Public Shared Function SolveCubicEquation(equation As String) As Tuple(Of Double, Double, Double)
		equation = "({equation})"
		Dim parts = equation.Split(New () {" = "}, StringSplitOptions.RemoveEmptyEntries)
		Dim expr = parts(0)
		Dim rhs = Double.Parse(parts(1))
		expr = Regex.Replace(expr, "x\^3", "a")
		expr = Regex.Replace(expr, "x\^2", "b")
		expr = Regex.Replace(expr, "x", "c")
		Dim dataTable = New DataTable()
		Dim parser = New ExpressionParser(dataTable)
		Dim expression__1 = parser.Parse(expr)
		Dim lambda = Expression.Lambda(Of Func(Of Double, Double))(DirectCast(expression__1, Expression), Expression.Parameter(GetType(Double), "a"))
		Dim [function] As Func(Of Double, Double) = lambda.Compile()
		Dim a As Double = [function](1)
		Dim b As Double = [function](0)
		Dim c As Double = [function](0)
		Dim d__2 As Double = -rhs
		Dim Q As Double = (3 * a * c - b * b) / (9 * a * a)
		Dim R As Double = (9 * a * b * c - 27 * a * a * d__2 - 2 * b * b * b) / (54 * a * a * a)
		Dim D__3 As Double = Q * Q * Q + R * R
		If D__3 >= 0 Then
			Dim S As Double = Math.Sign(R + Basic.SquareRoot(D__3)) * Math.Pow(Basic.Abs(R + Basic.SquareRoot(D__3)), 1.0 / 3.0)
			Dim T As Double = Math.Sign(R - Basic.SquareRoot(D__3)) * Math.Pow(Basic.Abs(R - Basic.SquareRoot(D__3)), 1.0 / 3.0)
			Dim root1 As Double = (-b / (3 * a)) + S + T
			Dim root2 As Double = (-b / (3 * a)) - (S + T) / 2
			Dim root3 As Double = (-b / (3 * a)) - (S + T) / 2
			Return Tuple.Create(root1, root2, root3)
		Else
			Dim theta As Double = Trig.Acos(R / Basic.SquareRoot(-Q * Q * Q))
			Dim root1 As Double = (-2 * Basic.SquareRoot(-Q) * Trig.Cos(theta / 3) - b / (3 * a))
			Dim root2 As Double = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta + 2 * Constants.Pi) / 3) - b / (3 * a))
			Dim root3 As Double = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta - 2 * Constants.Pi) / 3) - b / (3 * a))
			Return Tuple.Create(root1, root2, root3)
		End If
	End Function

	Public Shared Function SolvePolynomialEquation(coefficients As Double()) As Double()
		If coefficients Is Nothing OrElse coefficients.Length < 2 Then
			Throw New ArgumentException("The coefficients must contain at least two values.")
		End If

		Dim degree As Integer = coefficients.Length - 1

		If degree = 1 Then
			Return New Double() {-coefficients(0) / coefficients(1)}
		End If

		If degree = 2 Then
			Dim discriminant As Double = coefficients(1) * coefficients(1) - 4 * coefficients(0) * coefficients(2)

			If discriminant >= 0 Then
				Dim sqrtDiscriminant As Double = Basic.SquareRoot(discriminant)
				Dim r1 As Double = (-coefficients(1) + sqrtDiscriminant) / (2 * coefficients(2))
				Dim r2 As Double = (-coefficients(1) - sqrtDiscriminant) / (2 * coefficients(2))
				Return New Double() {r1, r2}
			End If

			Return New Double(-1) {}
		End If

		Dim roots As Double() = New Double(degree - 1) {}
		Dim work As Double() = New Double(degree - 1) {}

		Dim x As Double = 1.0

		For i As Integer = 0 To degree - 1
			work(i) = coefficients(i)
		Next

		For i As Integer = degree - 1 To 0 Step -1
			Dim b As Double = work(i)
			Dim d As Double = 0

			For j As Integer = i To 0 Step -1
				d = d * x + work(j)
			Next

			roots(i) = b / d
			x = roots(i)
		Next

		Return roots
	End Function

	Friend Class BinomialTheorem
		Public Shared Function Calculate(a As Double, b As Double, n As Double) As Double
			Dim result As Double = 1
			For i As Integer = 0 To n - 1
				result *= (a - i) / (i + 1)
				result *= b
			Next
			Return result
		End Function
	End Class

	Friend Class PowerEquation
		Public Shared Function Solve(baseValue As Double, exponent As Double) As Double
			Return Basic.Power(baseValue, exponent)
		End Function
	End Class

	Friend Class Differentiation
		Public Shared Function Differentiate(equation As String, x As Double) As Double
			Dim dataTable = New DataTable()
			Dim parser = New ExpressionParser(dataTable)
			Dim expression__1 = parser.Parse(equation)

			Dim lambda = Expression.Lambda(Of Func(Of Double, Double))(DirectCast(expression__1, Expression), New () {Expression.Parameter(GetType(Double), "x")})
			Dim [function] = lambda.Compile()

			Dim h As Double = 1E-08
			Dim f1 As Double = ([function](x + h) - [function](x - h)) / (2 * h)
			Return f1
		End Function
	End Class

	Friend Class HyperbolicEquation
		Public Shared Function Solve(equation As String, tolerance As Double) As Double
			Dim dataTable = New DataTable()
			Dim parser = New ExpressionParser(dataTable)
			Dim expression__1 = parser.Parse(equation)

			Dim lambda = Expression.Lambda(Of Func(Of Double, Double))(DirectCast(expression__1, Expression), New () {Expression.Parameter(GetType(Double), "x")})
			Dim [function] = lambda.Compile()

			Dim x As Double = 1.0
			Dim y As Double = 0.0
			Dim dx As Double = tolerance * 10
			While dx > tolerance
				y = [function](x)
				Dim dy As Double = [function](x + dx) - y
				If dy = 0 Then
					Exit While
				End If
				x -= y / dy
				dx = Basic.Abs(y)
			End While
			Return x
		End Function
	End Class



End Class

