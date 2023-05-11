#pragma once

#include <system/array.h>
#include <cstdint>

namespace Sigmath {

class ArithmeticProgression : public System::Object
{
    typedef ArithmeticProgression ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static System::ArrayPtr<double> Arithmetic(double firstTerm, double commonDifference, int32_t numTerms);
    static double ArithmeticSum(double firstTerm, double commonDifference, int32_t numTerms);
    static double Sum(int32_t n, double a1, double d);
    static double NthTerm(int32_t n, double a1, double d);
    static int32_t TermNumber(double an, double a1, double d);
    static int32_t TermNumber(double an, int32_t n, double a1);
    static double CommonDifference(double an, double a1, int32_t n);
    static double FirstTerm(double an, int32_t n, double d);
    static double LastTerm(double a1, int32_t n, double d);
    
};

} // namespace Sigmath


