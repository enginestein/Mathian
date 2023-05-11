#pragma once

#include <system/object.h>

namespace Sigmath {

class Mechanical : public System::Object
{
    typedef Mechanical ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double CalculateTorque(double force, double radius);
    static double CalculatePower(double torque, double angularVelocity);
    static double CalculateVelocity(double distance, double time);
    static double CalculateAcceleration(double initialVelocity, double finalVelocity, double time);
    static double CalculateForce(double mass, double acceleration);
    
};

} // namespace Sigmath


