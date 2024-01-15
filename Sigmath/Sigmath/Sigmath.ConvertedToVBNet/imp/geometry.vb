Public Class Geometry
	Public Shared Function CircleArea(radius As Double) As Double
		Return Constants.Pi * radius * radius
	End Function

	Public Shared Function CirclePerimeter(radius As Double) As Double
		Return 2 * Constants.Pi * radius
	End Function


	Public Shared Function RectangleArea(width As Double, height As Double) As Double
		Return width * height
	End Function

	Public Shared Function RectanglePerimeter(width As Double, height As Double) As Double
		Return 2 * (width + height)
	End Function

	Public Shared Function TriangleArea(base As Double, height As Double) As Double
		Return 0.5 * base * height
	End Function

	Public Shared Function TrianglePerimeter(side1 As Double, side2 As Double, side3 As Double) As Double
		Return side1 + side2 + side3
	End Function

	Public Shared Function DistanceBetweenPoints2D(x1 As Double, y1 As Double, x2 As Double, y2 As Double) As Double
		Return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2))
	End Function

	Public Shared Function DistanceBetweenPoints3D(x1 As Double, y1 As Double, z1 As Double, x2 As Double, y2 As Double, z2 As Double) As Double
		Return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2) + Basic.Power(z2 - z1, 2))
	End Function

	Public Shared Function AngleBetweenLines(slope1 As Double, slope2 As Double) As Double
		Return Trig.Atan(Basic.Abs((slope2 - slope1) / (1 + slope1 * slope2)))
	End Function

	Public Shared Function AngleBetweenVectors2D(x1 As Double, y1 As Double, x2 As Double, y2 As Double) As Double
		Return Trig.Acos((x1 * x2 + y1 * y2) / (Basic.SquareRoot(x1 * x1 + y1 * y1) * Basic.SquareRoot(x2 * x2 + y2 * y2)))
	End Function

	Public Shared Function AngleBetweenVectors3D(x1 As Double, y1 As Double, z1 As Double, x2 As Double, y2 As Double, z2 As Double, _
		v As Integer) As Double
		Return Trig.Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic.SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic.SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)))
	End Function
End Class
