class Geometry(object):
	def CircleArea(radius):
		return Constants.Pi * radius * radius

	CircleArea = staticmethod(CircleArea)

	def CirclePerimeter(radius):
		return 2 * Constants.Pi * radius

	CirclePerimeter = staticmethod(CirclePerimeter)

	def RectangleArea(width, height):
		return width * height

	RectangleArea = staticmethod(RectangleArea)

	def RectanglePerimeter(width, height):
		return 2 * (width + height)

	RectanglePerimeter = staticmethod(RectanglePerimeter)

	def TriangleArea(base, height):
		return 0.5 * base * height

	TriangleArea = staticmethod(TriangleArea)

	def TrianglePerimeter(side1, side2, side3):
		return side1 + side2 + side3

	TrianglePerimeter = staticmethod(TrianglePerimeter)

	def DistanceBetweenPoints2D(x1, y1, x2, y2):
		return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2))

	DistanceBetweenPoints2D = staticmethod(DistanceBetweenPoints2D)

	def DistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2):
		return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2) + Basic.Power(z2 - z1, 2))

	DistanceBetweenPoints3D = staticmethod(DistanceBetweenPoints3D)

	def AngleBetweenLines(slope1, slope2):
		return Trig.Atan(Basic.Abs((slope2 - slope1) / (1 + slope1 * slope2)))

	AngleBetweenLines = staticmethod(AngleBetweenLines)

	def AngleBetweenVectors2D(x1, y1, x2, y2):
		return Trig.Acos((x1 * x2 + y1 * y2) / (Basic.SquareRoot(x1 * x1 + y1 * y1) * Basic.SquareRoot(x2 * x2 + y2 * y2)))

	AngleBetweenVectors2D = staticmethod(AngleBetweenVectors2D)

	def AngleBetweenVectors3D(x1, y1, z1, x2, y2, z2, v):
		return Trig.Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic.SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic.SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)))

	AngleBetweenVectors3D = staticmethod(AngleBetweenVectors3D)