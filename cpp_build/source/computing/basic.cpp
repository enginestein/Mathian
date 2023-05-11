#include "computing/basic.h"

#include <system/func.h>
#include <system/exceptions.h>
#include <data/data_table.h>

#include "imp/ExpressionParser.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(4195909333u, ::Sigmath::Basic, ThisTypeBaseTypesInfo);

double Basic::Add(const System::ArrayPtr<double>& numbers)
{
    double sum = 0;
    
    {
        for (double num : numbers)
        {
            sum += num;
        }
        
    }
    return sum;
}

double Basic::Subtract(const System::ArrayPtr<double>& numbers)
{
    double result = numbers[0];
    for (int32_t i = 1; i < numbers->get_Length(); i++)
    {
        result -= numbers[i];
    }
    return result;
}

double Basic::Multiply(const System::ArrayPtr<double>& numbers)
{
    double product = 1;
    
    {
        for (double num : numbers)
        {
            product *= num;
        }
        
    }
    return product;
}

double Basic::Divide(const System::ArrayPtr<double>& numbers)
{
    double result = numbers[0];
    for (int32_t i = 1; i < numbers->get_Length(); i++)
    {
        if (numbers[i] == 0)
        {
            throw System::DivideByZeroException();
        }
        result /= numbers[i];
    }
    return result;
}

double Basic::Power(double baseNum, double exponent)
{
    double result = 1;
    for (int32_t i = 0; i < exponent; i++)
    {
        result *= baseNum;
    }
    return result;
}

double Basic::Abs(double value)
{
    return value >= 0 ? value : -value;
}

float Basic::Abs(float value)
{
    return value >= 0 ? value : -value;
}

int32_t Basic::Abs(int32_t value)
{
    return value >= 0 ? value : -value;
}

int64_t Basic::Abs(int64_t value)
{
    return value >= 0 ? value : -value;
}

double Basic::SquareRoot(double number)
{
    if (number < 0)
    {
        throw System::ArgumentException(u"Cannot take square root of negative number");
    }
    double guess = number / 2;
    for (int32_t i = 0; i < 100; i++)
    {
        double newGuess = (guess + number / guess) / 2;
        if (Abs(newGuess - guess) < 0.0001)
        {
            break;
        }
        guess = newGuess;
    }
    return guess;
}

double Basic::Exp(double x)
{
    double result = 1.0;
    double term = 1.0;
    int32_t n = 1;
    while (term > 0.0000001)
    {
        term *= x / n;
        result += term;
        n++;
    }
    return result;
}

double Basic::CubeRoot(double x)
{
    if (x >= 0)
    {
        return Power(x, 1.0 / 3.0);
    }
    else
    {
        return -Power(-x, 1.0 / 3.0);
    }
}

double Basic::Evaluate(System::String expression)
{
    auto dataTable = System::MakeObject<System::Data::DataTable>();
    auto parser = System::MakeObject<ExpressionParser>(dataTable);
    auto parsedExpression = parser->Parse(expression);
    auto lambda = System::Linq::Expressions::Expression::Lambda<System::Func<double> >(System::DynamicCast<System::Linq::Expressions::Expression>(parsedExpression), System::MakeObject<System::Array<System::SharedPtr<System::Linq::Expressions::ParameterExpression>>>(0));
    System::Func<double> compiledExpression = lambda->Compile();
    return compiledExpression();
}

} // namespace Sigmath
