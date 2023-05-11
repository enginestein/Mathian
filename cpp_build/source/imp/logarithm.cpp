#include "imp/logarithm.h"

#include <system/string.h>
#include <system/exceptions.h>
#include <cstdint>

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1959052844u, ::Sigmath::Logarithm, ThisTypeBaseTypesInfo);

const double Logarithm::EPSILON = 1e-14;

double Logarithm::Log(double x)
{
    if (x <= 0)
    {
        throw System::ArgumentException(u"Invalid argument: x must be positive");
    }
    
    double y = 0;
    int32_t k = 0;
    while (x >= 2)
    {
        x /= 2;
        k++;
    }
    while (x < 1)
    {
        x *= 2;
        k--;
    }
    double z = x - 1;
    double z2 = z * z;
    double z3 = z * z2;
    y = 2 * z / (1 + z) + 0.5 * z2 / (1 + z) - 0.25 * z3 / ((1 + z) * (1 + z)) + z3 / (3 * (1 + z) * (1 + z) * (1 + z));
    return y + k;
}

double Logarithm::Log10(double x)
{
    if (x <= 0)
    {
        throw System::ArgumentException(u"Invalid argument: x must be positive");
    }
    return Log(x) / Log(10);
}

double Logarithm::Ln(double x)
{
    return Log(x);
}

double Logarithm::Logn(double n, double x)
{
    return Log(x) / Log(n);
}

} // namespace Sigmath
