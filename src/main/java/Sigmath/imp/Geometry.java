package sigmath;



public class Geometry
{
    public static double circleArea(double radius)
    {
        return Constants.Pi * radius * radius;
    }

    public static double circlePerimeter(double radius)
    {
        return 2 * Constants.Pi * radius;
    }


    public static double rectangleArea(double width, double height)
    {
        return width * height;
    }

    public static double rectanglePerimeter(double width, double height)
    {
        return 2 * (width + height);
    }

    public static double triangleArea(double base, double height)
    {
        return 0.5 * base * height;
    }

    public static double trianglePerimeter(double side1, double side2, double side3)
    {
        return side1 + side2 + side3;
    }

    public static double distanceBetweenPoints2D(double x1, double y1, double x2, double y2)
    {
        return Basic.squareRoot(Basic.power(x2 - x1, 2) + Basic.power(y2 - y1, 2));
    }

    public static double distanceBetweenPoints3D(double x1, double y1, double z1, double x2, double y2, double z2)
    {
        return Basic.squareRoot(Basic.power(x2 - x1, 2) + Basic.power(y2 - y1, 2) + Basic.power(z2 - z1, 2));
    }

    public static double angleBetweenLines(double slope1, double slope2)
    {
        return Trig.atan(Basic.abs((slope2 - slope1) / (1 + slope1 * slope2)));
    }

    public static double angleBetweenVectors2D(double x1, double y1, double x2, double y2)
    {
        return Trig.acos((x1 * x2 + y1 * y2) / (Basic.squareRoot(x1 * x1 + y1 * y1) * Basic.squareRoot(x2 * x2 + y2 * y2)));
    }

    public static double angleBetweenVectors3D(double x1, double y1, double z1, double x2, double y2, double z2, int v)
    {
        return Trig.acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic.squareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic.squareRoot(x2 * x2 + y2 * y2 + z2 * z2)));
    }
}
