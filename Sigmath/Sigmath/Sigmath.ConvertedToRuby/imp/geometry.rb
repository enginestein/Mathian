module Sigmath
	class Geometry
		def Geometry.CircleArea(radius)
			return Constants.Pi * radius * radius
		end

		def Geometry.CirclePerimeter(radius)
			return 2 * Constants.Pi * radius
		end

		def Geometry.RectangleArea(width, height)
			return width * height
		end

		def Geometry.RectanglePerimeter(width, height)
			return 2 * (width + height)
		end

		def Geometry.TriangleArea(base, height)
			return 0.5 * base * height
		end

		def Geometry.TrianglePerimeter(side1, side2, side3)
			return side1 + side2 + side3
		end

		def Geometry.DistanceBetweenPoints2D(x1, y1, x2, y2)
			return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2))
		end

		def Geometry.DistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
			return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2) + Basic.Power(z2 - z1, 2))
		end

		def Geometry.AngleBetweenLines(slope1, slope2)
			return Trig.Atan(Basic.Abs((slope2 - slope1) / (1 + slope1 * slope2)))
		end

		def Geometry.AngleBetweenVectors2D(x1, y1, x2, y2)
			return Trig.Acos((x1 * x2 + y1 * y2) / (Basic.SquareRoot(x1 * x1 + y1 * y1) * Basic.SquareRoot(x2 * x2 + y2 * y2)))
		end

		def Geometry.AngleBetweenVectors3D(x1, y1, z1, x2, y2, z2, v)
			return Trig.Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic.SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic.SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)))
		end
	end
end