#include "computing/complex.h"

#include <system/scope_guard.h>
#include <system/exceptions.h>

#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1186901580u, ::Sigmath::Compl::Complex, ThisTypeBaseTypesInfo);

double Compl::Complex::get_Real()
{
    return pr_Real;
}

double Compl::Complex::get_Imaginary()
{
    return pr_Imaginary;
}

Compl::Complex::Complex(double real, double imaginary) : pr_Real(0), pr_Imaginary(0)
{
    //Self Reference+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    System::Details::ThisProtector __local_self_ref(this);
    //---------------------------------------------------------Self Reference
    
    pr_Real = real;
    pr_Imaginary = imaginary;
}

Compl::Complex operator +(Compl::Complex a, Compl::Complex b)
{
    return Compl::Complex(a.get_Real() + b.get_Real(), a.get_Imaginary() + b.get_Imaginary());
}

Compl::Complex operator -(Compl::Complex a, Compl::Complex b)
{
    return Compl::Complex(a.get_Real() - b.get_Real(), a.get_Imaginary() - b.get_Imaginary());
}

Compl::Complex operator *(Compl::Complex a, Compl::Complex b)
{
    return Compl::Complex(a.get_Real() * b.get_Real() - a.get_Imaginary() * b.get_Imaginary(), a.get_Real() * b.get_Imaginary() + a.get_Imaginary() * b.get_Real());
}

Compl::Complex operator /(Compl::Complex a, Compl::Complex b)
{
    double denominator = b.get_Real() * b.get_Real() + b.get_Imaginary() * b.get_Imaginary();
    double numeratorReal = a.get_Real() * b.get_Real() + a.get_Imaginary() * b.get_Imaginary();
    double numeratorImaginary = a.get_Imaginary() * b.get_Real() - a.get_Real() * b.get_Imaginary();
    
    return Compl::Complex(numeratorReal / denominator, numeratorImaginary / denominator);
}

Compl::Complex Compl::Complex::to_Complex(int32_t v)
{
    throw System::NotImplementedException();
}

double Compl::Complex::Abs(Compl::Complex a)
{
    return Basic::SquareRoot(a.get_Real() * a.get_Real() + a.get_Imaginary() * a.get_Imaginary());
}

double Compl::Complex::Magnitude(Compl::Complex number)
{
    return Basic::SquareRoot(number.get_Real() * number.get_Real() + number.get_Imaginary() * number.get_Imaginary());
}

Compl::Complex::Complex() : pr_Real(0), pr_Imaginary(0)
{
}


RTTI_INFO_IMPL_HASH(3329682692u, ::Sigmath::Compl, ThisTypeBaseTypesInfo);

double Compl::Abs(double v)
{
    throw System::NotImplementedException();
}

} // namespace Sigmath
