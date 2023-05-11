#include "trig/const.h"

#include <system/string.h>
#include <system/exceptions.h>

#include "imp/constants.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1115060117u, ::Sigmath::Trig, ThisTypeBaseTypesInfo);

const int32_t Trig::numTerms = 10;

double Trig::Sin(double x)
{
    while (x < 0)
    {
        x += 2 * Constants::Pi;
    }
    
    while (x > 2 * Constants::Pi)
    {
        x -= 2 * Constants::Pi;
    }
    
    double sum = 0;
    
    for (int32_t i = 0; i < numTerms; i++)
    {
        sum += ((i % 2 == 0 ? 1 : -1) * Basic::Power(x, 2 * i + 1)) / Factorial(2 * i + 1);
    }
    
    return sum;
}

double Trig::Cos(double x)
{
    while (x < 0)
    {
        x += 2 * Constants::Pi;
    }
    
    while (x > 2 * Constants::Pi)
    {
        x -= 2 * Constants::Pi;
    }
    
    double sum = 0;
    
    for (int32_t i = 0; i < numTerms; i++)
    {
        sum += ((i % 2 == 0 ? 1 : -1) * Basic::Power(x, 2 * i)) / Factorial(2 * i);
    }
    
    return sum;
}

double Trig::Tan(double x)
{
    return Sin(x) / Cos(x);
}

double Trig::Asin(double x)
{
    if (x < static_cast<double>(-1) || x > 1)
    {
        throw System::ArgumentException(u"Input to arcsine function must be between -1 and 1");
    }
    
    double sum = 0;
    
    for (int32_t i = 0; i < numTerms; i++)
    {
        sum += (Factorial(2 * i) * Basic::Power(x, 2 * i + 1)) / (Basic::Power(4, i) * Basic::Power(Factorial(i), 2) * (2 * i + 1));
    }
    
    return sum;
}

double Trig::Acos(double x)
{
    if (x < static_cast<double>(-1) || x > 1)
    {
        throw System::ArgumentException(u"Input to arccosine function must be between -1 and 1");
    }
    
    return Constants::Pi / 2 - Asin(x);
}

double Trig::Atan(double x)
{
    double sum = 0;
    
    for (int32_t i = 0; i < numTerms; i++)
    {
        sum += ((i % 2 == 0 ? 1 : -1) * Basic::Power(x, 2 * i + 1)) / (2 * i + 1);
    }
    
    return sum;
}

double Trig::Factorial(int32_t n)
{
    double result = 1;
    
    for (int32_t i = 1; i <= n; i++)
    {
        result *= i;
    }
    
    return result;
}

} // namespace Sigmath
