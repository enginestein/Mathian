#include "calculus/ap.h"

#include <system/convert.h>

namespace Sigmath {

RTTI_INFO_IMPL_HASH(860039704u, ::Sigmath::ArithmeticProgression, ThisTypeBaseTypesInfo);

System::ArrayPtr<double> ArithmeticProgression::Arithmetic(double firstTerm, double commonDifference, int32_t numTerms)
{
    System::ArrayPtr<double> terms = System::MakeArray<double>(numTerms, 0);
    for (int32_t i = 0; i < numTerms; i++)
    {
        terms[i] = firstTerm + i * commonDifference;
    }
    return terms;
}

double ArithmeticProgression::ArithmeticSum(double firstTerm, double commonDifference, int32_t numTerms)
{
    return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2;
}

double ArithmeticProgression::Sum(int32_t n, double a1, double d)
{
    return n * (2 * a1 + (n - 1) * d) / 2;
}

double ArithmeticProgression::NthTerm(int32_t n, double a1, double d)
{
    return a1 + (n - 1) * d;
}

int32_t ArithmeticProgression::TermNumber(double an, double a1, double d)
{
    double n = (an - a1) / d + 1;
    return System::Convert::ToInt32(n);
}

int32_t ArithmeticProgression::TermNumber(double an, int32_t n, double a1)
{
    double d = (an - a1) / (n - 1);
    return System::Convert::ToInt32(d);
}

double ArithmeticProgression::CommonDifference(double an, double a1, int32_t n)
{
    return (an - a1) / (n - 1);
}

double ArithmeticProgression::FirstTerm(double an, int32_t n, double d)
{
    return an - (n - 1) * d;
}

double ArithmeticProgression::LastTerm(double a1, int32_t n, double d)
{
    return a1 + (n - 1) * d;
}

} // namespace Sigmath
