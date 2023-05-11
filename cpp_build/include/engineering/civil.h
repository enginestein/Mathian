#pragma once

#include <system/object.h>

namespace Sigmath {

class Civil : public System::Object
{
    typedef Civil ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
private:

    static double CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia);
    static double CalculateStress(double force, double area);
    static double CalculateStrain(double initialLength, double finalLength, double initialDiameter);
    static double CalculateYoungsModulus(double stress, double strain);
    
};

} // namespace Sigmath


