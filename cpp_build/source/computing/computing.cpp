#include "computing/computing.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(547606011u, ::Sigmath::Computing, ThisTypeBaseTypesInfo);

int32_t Computing::Floor(double x)
{
    return (int32_t)(x >= 0 ? x : x - 0.999999999999999);
}

int32_t Computing::Ceil(double x)
{
    return (int32_t)(x >= 0 ? x + 0.999999999999999 : x);
}

int32_t Computing::Round(double x)
{
    return (int32_t)(x >= 0 ? x + 0.5 : x - 0.5);
}

} // namespace Sigmath
