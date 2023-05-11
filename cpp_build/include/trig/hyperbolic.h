#pragma once

#include <system/object.h>

namespace Sigmath {

class Hyperbolic : public System::Object
{
    typedef Hyperbolic ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Sinh(double x);
    static double Cosh(double x);
    static double Tanh(double x);
    static double Sech(double x);
    static double Csch(double x);
    static double Coth(double x);
    static double Asinh(double x);
    static double Acosh(double x);
    static double Atanh(double x);
    static double Asech(double x);
    static double Acsch(double x);
    static double Acoth(double x);
    
};

} // namespace Sigmath


