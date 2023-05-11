#include "statistics/stats.h"

#include <system/linq/enumerable.h>
#include <system/func.h>
#include <system/exceptions.h>
#include <system/details/dispose_guard.h>
#include <system/collections/keyvalue_pair.h>
#include <system/collections/ienumerator.h>
#include <system/collections/ienumerable.h>
#include <system/collections/dictionary.h>
#include <system/array.h>
#include <functional>
#include <cstdint>

#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1851698172u, ::Sigmath::Statistics, ThisTypeBaseTypesInfo);

double Statistics::Mean(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate mean of empty sequence");
    }
    
    int32_t count = 0;
    double sum = 0.0;
    
    
    {
        auto value_enumerator = (values)->GetEnumerator();
        while (value_enumerator->MoveNext())
        {
            auto&& value = value_enumerator->get_Current();
            
            count++;
            sum += value;
        }
    }
    
    return sum / count;
}

double Statistics::Median(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate median of empty sequence");
    }
    
    auto sortedValues = values->LINQ_OrderBy(static_cast<System::Func<double, double>>(static_cast<std::function<double(double v)>>([](double v) -> double
    {
        return v;
    })))->LINQ_ToArray();
    int32_t middleIndex = sortedValues->get_Length() / 2;
    
    if (sortedValues->get_Length() % 2 == 0)
    {
        return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0;
    }
    else
    {
        return sortedValues[middleIndex];
    }
}

double Statistics::Mode(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate mode of empty sequence");
    }
    
    auto valueCounts = System::MakeObject<System::Collections::Generic::Dictionary<double, int32_t>>();
    
    
    {
        auto value_enumerator = (values)->GetEnumerator();
        while (value_enumerator->MoveNext())
        {
            auto&& value = value_enumerator->get_Current();
            
            if (!valueCounts->ContainsKey(value))
            {
                valueCounts->Add(value, 0);
            }
            
            valueCounts->idx_set(value, valueCounts->idx_get(value) + 1);
        }
    }
    
    int32_t maxCount = valueCounts->get_Values()->LINQ_Max();
    auto modes = valueCounts->LINQ_Where(static_cast<System::Func<System::Collections::Generic::KeyValuePair<double, int32_t>, bool>>(static_cast<std::function<bool(System::Collections::Generic::KeyValuePair<double, int32_t> pair)>>([&maxCount](System::Collections::Generic::KeyValuePair<double, int32_t> pair) -> bool
    {
        return pair.get_Value() == maxCount;
    })))->LINQ_Select(static_cast<System::Func<System::Collections::Generic::KeyValuePair<double, int32_t>, double>>(static_cast<std::function<double(System::Collections::Generic::KeyValuePair<double, int32_t> pair)>>([](System::Collections::Generic::KeyValuePair<double, int32_t> pair) -> double
    {
        return pair.get_Key();
    })));
    
    if (modes->LINQ_Count() == 1)
    {
        return modes->LINQ_First();
    }
    else
    {
        throw System::InvalidOperationException(u"Sequence has multiple modes");
    }
}

double Statistics::Variance(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate variance of empty sequence");
    }
    
    double mean = Mean(values);
    int32_t count = 0;
    double sumOfSquaredDifferences = 0.0;
    
    
    {
        auto value_enumerator = (values)->GetEnumerator();
        while (value_enumerator->MoveNext())
        {
            auto&& value = value_enumerator->get_Current();
            
            count++;
            double difference = value - mean;
            sumOfSquaredDifferences += difference * difference;
        }
    }
    
    return sumOfSquaredDifferences / count;
}

double Statistics::StandardDeviation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    return Basic::SquareRoot(Variance(values));
}

// Using statement is translated using System::Details::DisposeGuard class which may store exception and then throw from destructor.
// We block the warnings related as these are false alarms (the exception, if caught, will be re-thrown from the destructor).
#if defined(__MSVC__)
#pragma warning( push )
#pragma warning(disable : 4715)
#pragma warning(disable : 4700)
#pragma warning(disable : 4701)
#elif defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wreturn-type"
#endif
double Statistics::Correlation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> valuesX, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> valuesY)
{
    if (valuesX == nullptr || valuesY == nullptr || !valuesX->LINQ_Any() || !valuesY->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate correlation coefficient of empty sequences");
    }
    
    int32_t count = 0;
    double sumX = 0.0;
    double sumY = 0.0;
    double sumXY = 0.0;
    double sumXSquared = 0.0;
    double sumYSquared = 0.0;
    
    {
        auto enumX = valuesX->GetEnumerator();
        // Clearing resources under 'using' statement
        System::Details::DisposeGuard<1> __dispose_guard_1({ enumX});
        // ------------------------------------------
        
        try{
            auto enumY = valuesY->GetEnumerator();
            // Clearing resources under 'using' statement
            System::Details::DisposeGuard<1> __dispose_guard_0({ enumY});
            // ------------------------------------------
            
            try
            {
                while (enumX->MoveNext() && enumY->MoveNext())
                {
                    double valueX = enumX->get_Current();
                    double valueY = enumY->get_Current();
                    count++;
                    sumX += valueX;
                    sumY += valueY;
                    sumXY += valueX * valueY;
                    sumXSquared += valueX * valueX;
                    sumYSquared += valueY * valueY;
                }
            }
            catch(...)
            {
                __dispose_guard_0.SetCurrentException(std::current_exception());
            }
        }
        catch(...)
        {
            __dispose_guard_1.SetCurrentException(std::current_exception());
        }
    }
    
    double numerator = count * sumXY - sumX * sumY;
    double denominator = Basic::SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY));
    
    return numerator / denominator;
}
#if defined(__MSVC__)
#pragma warning( pop )
#elif defined(__GNUC__)
#pragma GCC diagnostic pop
#endif

} // namespace Sigmath
