#pragma once

#include <system/object.h>

namespace Sigmath {

class Logarithm : public System::Object
{
    typedef Logarithm ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Log(double x);
    static double Log10(double x);
    static double Ln(double x);
    static double Logn(double n, double x);
    
private:

    static const double EPSILON;
    
};

} // namespace Sigmath


