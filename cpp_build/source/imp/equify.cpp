#include "imp/equify.h"

#include <system/text/regularexpressions/regex.h>
#include <system/text/regularexpressions/match.h>
#include <system/func.h>
#include <system/exceptions.h>
#include <system/details/lambda_capture_holder.h>
#include <system/convert.h>
#include <system/char.h>
#include <system/array.h>
#include <functional>
#include <data/data_table.h>
#include <cstdint>

#include "imp/ExpressionParser.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(2940651213u, ::Sigmath::Equif, ThisTypeBaseTypesInfo);

double Equif::Equify(System::String equation, double value)
{
    System::Details::LambdaCaptureHolder<System::String> _lch_equation = equation;
    System::String& _equation = _lch_equation.GetCapture();
    System::Details::LambdaCaptureHolder<double> _lch_value = value;
    double& _value = _lch_value.GetCapture();
    equation = System::Text::RegularExpressions::Regex::Replace(equation, u"[A-Za-z]+", static_cast<System::Text::RegularExpressions::MatchEvaluator>(static_cast<std::function<System::String(System::SharedPtr<System::Text::RegularExpressions::Match> match)>>([_lch_equation, &_equation, _lch_value, &_value](System::SharedPtr<System::Text::RegularExpressions::Match> match) -> System::String
    {
        if (match->get_Index() > 0 && System::Char::IsDigit(_equation[match->get_Index() - 1]))
        {
            return match->get_Value();
        }
        else
        {
            return System::Convert::ToString(_value);
        }
    })).template AddHeldVariable<System::Text::RegularExpressions::MatchEvaluator>("_equation", _equation).template AddHeldVariable<System::Text::RegularExpressions::MatchEvaluator>("_value", _value));
    
    auto dataTable = System::MakeObject<System::Data::DataTable>();
    auto parser = System::MakeObject<ExpressionParser>(dataTable);
    auto expression = parser->Parse(equation);
    
    auto lambda = System::Linq::Expressions::Expression::Lambda<System::Func<double> >(System::DynamicCast<System::Linq::Expressions::Expression>(expression), System::MakeObject<System::Array<System::SharedPtr<System::Linq::Expressions::ParameterExpression>>>(0));
    System::Func<double> function = lambda->Compile();
    return function();
}

} // namespace Sigmath
