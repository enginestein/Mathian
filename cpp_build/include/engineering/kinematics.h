#pragma once

#include <system/object.h>

namespace Sigmath {

class Kinematics : public System::Object
{
    typedef Kinematics ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double CalculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time);
    static double CalculateFinalVelocity(double initialVelocity, double acceleration, double displacement);
    static double CalculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration);
    static double CalculateAcceleration(double initialVelocity, double finalVelocity, double displacement, double time);
    static double CalculateProjectileRange(double initialVelocity, double launchAngle);
    
};

} // namespace Sigmath


