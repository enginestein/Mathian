#include "engineering/civil.h"

#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(3015021146u, ::Sigmath::Civil, ThisTypeBaseTypesInfo);

double Civil::CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
{
    return (load * Basic::Power(length, 3)) / (3 * elasticity * momentOfInertia);
}

double Civil::CalculateStress(double force, double area)
{
    return force / area;
}

double Civil::CalculateStrain(double initialLength, double finalLength, double initialDiameter)
{
    return (finalLength - initialLength) / (initialLength * (initialDiameter / 2));
}

double Civil::CalculateYoungsModulus(double stress, double strain)
{
    return stress / strain;
}

} // namespace Sigmath
