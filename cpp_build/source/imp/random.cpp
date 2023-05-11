#include "imp/random.h"

#include <system/string.h>
#include <system/primitive_types.h>
#include <system/exceptions.h>
#include <system/date_time.h>

#include "trig/const.h"
#include "imp/logarithm.h"
#include "imp/constants.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(3708735422u, ::Sigmath::Rand, ThisTypeBaseTypesInfo);

const int64_t Rand::a = INT64_C(6364136223846793005);
const int64_t Rand::c = INT64_C(1442695040888963407);
const int64_t Rand::m = INT64_C(9223372036854775783);

Rand::Rand() : seed(0)
{
    seed = System::DateTime::get_Now().get_Ticks();
}

Rand::Rand(int64_t seed) : seed(0)
{
    this->seed = seed;
}

int64_t Rand::NextLong()
{
    seed = (a * seed + c) % m;
    return seed;
}

double Rand::NextDouble()
{
    return (double)NextLong() / m;
}

int32_t Rand::Next(int32_t minValue, int32_t maxValue)
{
    if (minValue >= maxValue)
    {
        throw System::ArgumentException(u"minValue must be less than maxValue");
    }
    
    int64_t range = (int64_t)maxValue - minValue;
    return (int32_t)(NextDouble() * range) + minValue;
}

int32_t Rand::Next(int32_t maxValue)
{
    return Next(0, maxValue);
}

int32_t Rand::Next()
{
    return Next(std::numeric_limits<int32_t>::lowest(), std::numeric_limits<int32_t>::max());
}

RTTI_INFO_IMPL_HASH(2190863484u, ::Sigmath::Random, ThisTypeBaseTypesInfo);

double Random::RandUniform(double min, double max)
{
    System::SharedPtr<Rand> rand = System::MakeObject<Rand>();
    return rand->NextDouble() * (max - min) + min;
}

double Random::RandNormal(double mean, double stdDev)
{
    System::SharedPtr<Rand> rand = System::MakeObject<Rand>();
    double u1 = rand->NextDouble();
    double u2 = rand->NextDouble();
    double z0 = Basic::SquareRoot(static_cast<double>(-2) * Logarithm::Log(u1)) * Trig::Cos(2 * Constants::Pi * u2);
    return z0 * stdDev + mean;
}

int32_t Random::RandPoisson(double lambda)
{
    System::SharedPtr<Rand> rand = System::MakeObject<Rand>();
    double L = Basic::Exp(-lambda);
    double p = 1;
    int32_t k = 0;
    do
    {
        k++;
        p *= rand->NextDouble();
    } while (p > L);
    return k - 1;
}

} // namespace Sigmath
