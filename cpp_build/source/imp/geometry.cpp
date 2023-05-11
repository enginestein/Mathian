#include "imp/geometry.h"

#include "trig/const.h"
#include "imp/constants.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(4269055787u, ::Sigmath::Geometry, ThisTypeBaseTypesInfo);

double Geometry::CircleArea(double radius)
{
    return Constants::Pi * radius * radius;
}

double Geometry::CirclePerimeter(double radius)
{
    return 2 * Constants::Pi * radius;
}

double Geometry::RectangleArea(double width, double height)
{
    return width * height;
}

double Geometry::RectanglePerimeter(double width, double height)
{
    return 2 * (width + height);
}

double Geometry::TriangleArea(double base, double height)
{
    return 0.5 * base * height;
}

double Geometry::TrianglePerimeter(double side1, double side2, double side3)
{
    return side1 + side2 + side3;
}

double Geometry::DistanceBetweenPoints2D(double x1, double y1, double x2, double y2)
{
    return Basic::SquareRoot(Basic::Power(x2 - x1, 2) + Basic::Power(y2 - y1, 2));
}

double Geometry::DistanceBetweenPoints3D(double x1, double y1, double z1, double x2, double y2, double z2)
{
    return Basic::SquareRoot(Basic::Power(x2 - x1, 2) + Basic::Power(y2 - y1, 2) + Basic::Power(z2 - z1, 2));
}

double Geometry::AngleBetweenLines(double slope1, double slope2)
{
    return Trig::Atan(Basic::Abs((slope2 - slope1) / (1 + slope1 * slope2)));
}

double Geometry::AngleBetweenVectors2D(double x1, double y1, double x2, double y2)
{
    return Trig::Acos((x1 * x2 + y1 * y2) / (Basic::SquareRoot(x1 * x1 + y1 * y1) * Basic::SquareRoot(x2 * x2 + y2 * y2)));
}

double Geometry::AngleBetweenVectors3D(double x1, double y1, double z1, double x2, double y2, double z2, int32_t v)
{
    return Trig::Acos((x1 * x2 + y1 * y2 + z1 * z2) / (Basic::SquareRoot(x1 * x1 + y1 * y1 + z1 * z1) * Basic::SquareRoot(x2 * x2 + y2 * y2 + z2 * z2)));
}

} // namespace Sigmath
