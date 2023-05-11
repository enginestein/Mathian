#include "computing/nums.h"

#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(751551142u, ::Sigmath::Nums, ThisTypeBaseTypesInfo);

int32_t Nums::Gcd(int32_t a, int32_t b)
{
    while (b != 0)
    {
        int32_t temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int32_t Nums::Lcm(int32_t a, int32_t b)
{
    return Basic::Abs(a * b) / Gcd(a, b);
}

int32_t Nums::Mod(int32_t a, int32_t b)
{
    int32_t r = a % b;
    return r < 0 ? r + b : r;
}

} // namespace Sigmath
