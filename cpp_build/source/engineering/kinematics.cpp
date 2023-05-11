#include "engineering/kinematics.h"

#include <cstdint>

#include "trig/const.h"
#include "imp/constants.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(520246279u, ::Sigmath::Kinematics, ThisTypeBaseTypesInfo);

double Kinematics::CalculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time)
{
    return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic::Power(time, 2));
}

double Kinematics::CalculateFinalVelocity(double initialVelocity, double acceleration, double displacement)
{
    return Basic::SquareRoot(Basic::Power(initialVelocity, 2) + 2 * acceleration * displacement);
}

double Kinematics::CalculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration)
{
    return (2 * displacement) / (initialVelocity + finalVelocity);
}

double Kinematics::CalculateAcceleration(double initialVelocity, double finalVelocity, double displacement, double time)
{
    return (2 * (displacement - (initialVelocity * time))) / Basic::Power(time, 2);
}

double Kinematics::CalculateProjectileRange(double initialVelocity, double launchAngle)
{
    return (Basic::Power(initialVelocity, 2) * Trig::Sin(2 * launchAngle)) / Constants::G;
}

} // namespace Sigmath
