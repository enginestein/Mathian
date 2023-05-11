#pragma once

#include <system/object.h>
#include <cstdint>

namespace Sigmath {

class Trig : public System::Object
{
    typedef Trig ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Sin(double x);
    static double Cos(double x);
    static double Tan(double x);
    static double Asin(double x);
    static double Acos(double x);
    static double Atan(double x);
    
private:

    static const int32_t numTerms;
    
    static double Factorial(int32_t n);
    
};

} // namespace Sigmath


