namespace Sigmath
{
    public class Geometry
    {
        public static double CircleArea(double radius)
        {
            return Constants.Pi * radius * radius;
        }

        public static double CirclePerimeter(double radius)
        {
            return 2 * Constants.Pi * radius;
        }


        public static double RectangleArea(double width, double height)
        {
            return width * height;
        }

        public static double RectanglePerimeter(double width, double height)
        {
            return 2 * (width + height);
        }

        public static double TriangleArea(double @base, double height)
        {
            return 0.5 * @base * height;
        }

        public static double TrianglePerimeter(double side1, double side2, double side3)
        {
            return side1 + side2 + side3;
        }

        public static double DistanceBetweenPoints2D(double x1, double y1, double x2, double y2)
        {
            return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2));
        }

        public static double DistanceBetweenPoints3D(double x1, double y1, double z1, double x2, double y2, double z2)
        {
            return Basic.SquareRoot(Basic.Power(x2 - x1, 2) + Basic.Power(y2 - y1, 2) + Basic.Power(z2 - z1, 2));
        }

        public static double AngleBetweenLines(double slope1, double slope2)
        {
            return Trig.Atan(Basic.Abs((slope2 - slope1) / (1 + slope1 * slope2)));
        }

        public static double AngleBetweenVectors2D(double x1, double y1, double x2, double y2)
        {
            return Trig.Acos((x1 * x2 + y1 * y2) / (Basic.SquareRoot(x1 * x1 + y1 * y1) * Basic.SquareRoot(x2 * x2 + y2 * y2)));
        }

        public static double AngleBetweenVectors3D(double x1, double y1, double z1, double x2, double y2, double z2, int v)
        {
            return Trig.Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic.SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic.SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)));
        }
    }
}