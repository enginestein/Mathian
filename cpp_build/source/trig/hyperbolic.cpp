#include "trig/hyperbolic.h"

#include <system/string.h>
#include <system/exceptions.h>
#include <cstdint>

#include "imp/logarithm.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1315287622u, ::Sigmath::Hyperbolic, ThisTypeBaseTypesInfo);

double Hyperbolic::Sinh(double x)
{
    return (Basic::Exp(x) - Basic::Exp(-x)) / 2;
}

double Hyperbolic::Cosh(double x)
{
    return (Basic::Exp(x) + Basic::Exp(-x)) / 2;
}

double Hyperbolic::Tanh(double x)
{
    return Sinh(x) / Cosh(x);
}

double Hyperbolic::Sech(double x)
{
    return 1 / Cosh(x);
}

double Hyperbolic::Csch(double x)
{
    return 1 / Sinh(x);
}

double Hyperbolic::Coth(double x)
{
    return 1 / Tanh(x);
}

double Hyperbolic::Asinh(double x)
{
    return Logarithm::Log(x + Basic::SquareRoot(Basic::Power(x, 2) + 1));
}

double Hyperbolic::Acosh(double x)
{
    if (x < 1)
    {
        throw System::ArgumentException(u"Input to inverse hyperbolic cosine function must be greater than or equal to 1");
    }
    return Logarithm::Log(x + Basic::SquareRoot(Basic::Power(x, 2) - 1));
}

double Hyperbolic::Atanh(double x)
{
    if (x <= static_cast<double>(-1) || x >= 1)
    {
        throw System::ArgumentException(u"Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)");
    }
    return 0.5 * Logarithm::Log((1 + x) / (1 - x));
}

double Hyperbolic::Asech(double x)
{
    if (x <= 0 || x >= 1)
    {
        throw System::ArgumentException(u"Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)");
    }
    return Acosh(1 / x);
}

double Hyperbolic::Acsch(double x)
{
    if (x <= 0)
    {
        throw System::ArgumentException(u"Input to inverse hyperbolic cosecant function must be greater than 0");
    }
    return Asinh(1 / x);
}

double Hyperbolic::Acoth(double x)
{
    if (x <= static_cast<double>(-1) || x >= 1)
    {
        throw System::ArgumentException(u"Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)");
    }
    return 0.5 * Logarithm::Log((x + 1) / (x - 1));
}

} // namespace Sigmath
