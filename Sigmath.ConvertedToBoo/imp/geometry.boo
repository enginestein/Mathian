namespace Sigmath

public class Geometry:

	public static def CircleArea(radius as double) as double:
		return ((Constants.Pi * radius) * radius)

	
	public static def CirclePerimeter(radius as double) as double:
		return ((2 * Constants.Pi) * radius)

	
	
	public static def RectangleArea(width as double, height as double) as double:
		return (width * height)

	
	public static def RectanglePerimeter(width as double, height as double) as double:
		return (2 * (width + height))

	
	public static def TriangleArea(base as double, height as double) as double:
		return ((0.5 * base) * height)

	
	public static def TrianglePerimeter(side1 as double, side2 as double, side3 as double) as double:
		return ((side1 + side2) + side3)

	
	public static def DistanceBetweenPoints2D(x1 as double, y1 as double, x2 as double, y2 as double) as double:
		return Basic.SquareRoot((Basic.Power((x2 - x1), 2) + Basic.Power((y2 - y1), 2)))

	
	public static def DistanceBetweenPoints3D(x1 as double, y1 as double, z1 as double, x2 as double, y2 as double, z2 as double) as double:
		return Basic.SquareRoot(((Basic.Power((x2 - x1), 2) + Basic.Power((y2 - y1), 2)) + Basic.Power((z2 - z1), 2)))

	
	public static def AngleBetweenLines(slope1 as double, slope2 as double) as double:
		return Trig.Atan(Basic.Abs(((slope2 - slope1) / (1 + (slope1 * slope2)))))

	
	public static def AngleBetweenVectors2D(x1 as double, y1 as double, x2 as double, y2 as double) as double:
		return Trig.Acos((((x1 * x2) + (y1 * y2)) / (Basic.SquareRoot(((x1 * x1) + (y1 * y1))) * Basic.SquareRoot(((x2 * x2) + (y2 * y2))))))

	
	public static def AngleBetweenVectors3D(x1 as double, y1 as double, z1 as double, x2 as double, y2 as double, z2 as double, v as int) as double:
		return Trig.Acos(((((x1 * x2) + (y1 * y2)) + (z1 * z2)) / (Basic.SquareRoot((((x1 * x1) + (y1 * y1)) + (z1 * z1))) * Basic.SquareRoot((((x2 * x2) + (y2 * y2)) + (z2 * z2))))))

