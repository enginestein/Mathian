#include "mechanical.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(473036584u, ::Sigmath::Mechanical, ThisTypeBaseTypesInfo);

double Mechanical::CalculateTorque(double force, double radius)
{
    return force * radius;
}

double Mechanical::CalculatePower(double torque, double angularVelocity)
{
    return torque * angularVelocity;
}

double Mechanical::CalculateVelocity(double distance, double time)
{
    return distance / time;
}

double Mechanical::CalculateAcceleration(double initialVelocity, double finalVelocity, double time)
{
    return (finalVelocity - initialVelocity) / time;
}

double Mechanical::CalculateForce(double mass, double acceleration)
{
    return mass * acceleration;
}

} // namespace Sigmath
