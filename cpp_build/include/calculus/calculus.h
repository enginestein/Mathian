#pragma once

#include <system/func.h>
#include <system/array.h>
#include <cstdint>

namespace Sigmath {

class Calculus : public System::Object
{
    typedef Calculus ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    enum class RiemannSumType
    {
        Left,
        Right,
        Midpoint,
        Trapezoidal
    };
    
    
public:

    static double Derivative(System::Func<double, double> f, double x);
    static double Integral(System::Func<double, double> f, double a, double b, int32_t n);
    static double Limit(System::Func<double, double> f, System::Func<double, double> g, double x);
    static double FindRoot(System::Func<double, double> f, double a, double b, double epsilon = 1e-6);
    static System::Func<System::ArrayPtr<double>, double> PartialDerivative(System::Func<System::ArrayPtr<double>, double> f, int32_t index, double h = 1e-6);
    static System::Func<System::ArrayPtr<double>, System::ArrayPtr<double>> Gradient(System::Func<System::ArrayPtr<double>, double> f, double h = 1e-6);
    static System::Func<System::ArrayPtr<double>, System::ArrayPtr<std::vector<double>>> Hessian(System::Func<System::ArrayPtr<double>, double> f, double h = 1e-6);
    static System::ArrayPtr<double> FindCriticalPoints(System::Func<double, double> f, double a, double b, double epsilon = 1e-6);
    static double RiemannSum(System::Func<double, double> f, double a, double b, int32_t n, Calculus::RiemannSumType type = Sigmath::Calculus::RiemannSumType::Left);
    static double DefiniteIntegral(System::Func<double, double> f, double a, double b, int32_t n = 1000);
    
private:

    static int32_t Factorial(int32_t n);
    
};

} // namespace Sigmath


