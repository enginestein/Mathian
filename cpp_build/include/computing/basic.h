#pragma once

#include <system/array.h>
#include <cstdint>

namespace Sigmath {

class Basic : public System::Object
{
    typedef Basic ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Add(const System::ArrayPtr<double>& numbers);
    static double Subtract(const System::ArrayPtr<double>& numbers);
    static double Multiply(const System::ArrayPtr<double>& numbers);
    static double Divide(const System::ArrayPtr<double>& numbers);
    static double Power(double baseNum, double exponent);
    static double Abs(double value);
    static float Abs(float value);
    static int32_t Abs(int32_t value);
    static int64_t Abs(int64_t value);
    static double SquareRoot(double number);
    static double Exp(double x);
    static double CubeRoot(double x);
    static double Evaluate(System::String expression);
    
};

} // namespace Sigmath


