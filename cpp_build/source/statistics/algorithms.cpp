#include "statistics/algorithms.h"

#include <system/math.h>
#include <system/linq/enumerable.h>
#include <system/func.h>
#include <system/exceptions.h>
#include <system/details/dispose_guard.h>
#include <system/collections/ienumerator.h>
#include <system/collections/ienumerable.h>
#include <functional>

#include "statistics/stats.h"
#include "computing/basic.h"


using namespace Sigmath;
namespace Sigmath {

RTTI_INFO_IMPL_HASH(1354512461u, ::Sigmath::Statgorithm, ThisTypeBaseTypesInfo);

double Statgorithm::Skewness(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate skewness of empty sequence");
    }
    
    int32_t count = 0;
    double sum = 0.0;
    double sumOfSquaredDifferences = 0.0;
    double sumOfCubedDifferences = 0.0;
    
    
    {
        auto value_enumerator = (values)->GetEnumerator();
        while (value_enumerator->MoveNext())
        {
            auto&& value = value_enumerator->get_Current();
            
            count++;
            sum += value;
            double difference = value - Statistics::Mean(values);
            sumOfSquaredDifferences += difference * difference;
            sumOfCubedDifferences += difference * difference * difference;
        }
    }
    
    double variance = Statistics::Variance(values);
    double skewness = sumOfCubedDifferences / (count * Basic::CubeRoot(variance));
    
    return skewness;
}

double Statgorithm::Kurtosis(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate kurtosis of empty sequence");
    }
    
    double mean = Statistics::Mean(values);
    int32_t count = 0;
    double sumOfSquaredDifferences = 0.0;
    double sumOfFourthPowersOfDifferences = 0.0;
    
    
    {
        auto value_enumerator = (values)->GetEnumerator();
        while (value_enumerator->MoveNext())
        {
            auto&& value = value_enumerator->get_Current();
            
            count++;
            double difference = value - mean;
            sumOfSquaredDifferences += difference * difference;
            sumOfFourthPowersOfDifferences += difference * difference * difference * difference;
        }
    }
    
    double variance = sumOfSquaredDifferences / count;
    double fourthMoment = sumOfFourthPowersOfDifferences / count;
    double kurtosis = fourthMoment / (variance * variance) - 3;
    
    return kurtosis;
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
double Statgorithm::Covariance(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> xValues, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> yValues)
{
    if (xValues == nullptr || !xValues->LINQ_Any() || yValues == nullptr || !yValues->LINQ_Any() || xValues->LINQ_Count() != yValues->LINQ_Count())
    {
        throw System::ArgumentException(u"Invalid input");
    }
    
    double xMean = Statistics::Mean(xValues);
    double yMean = Statistics::Mean(yValues);
    int32_t count = 0;
    double sumOfProductsOfDifferences = 0.0;
    
    {
        auto xEnumerator = xValues->GetEnumerator();
        // Clearing resources under 'using' statement
        System::Details::DisposeGuard<1> __dispose_guard_1({ xEnumerator});
        // ------------------------------------------
        
        try{
            auto yEnumerator = yValues->GetEnumerator();
            // Clearing resources under 'using' statement
            System::Details::DisposeGuard<1> __dispose_guard_0({ yEnumerator});
            // ------------------------------------------
            
            try
            {
                while (xEnumerator->MoveNext() && yEnumerator->MoveNext())
                {
                    count++;
                    double xDifference = xEnumerator->get_Current() - xMean;
                    double yDifference = yEnumerator->get_Current() - yMean;
                    sumOfProductsOfDifferences += xDifference * yDifference;
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
    
    double covariance = sumOfProductsOfDifferences / count;
    
    return covariance;
}
#if defined(__MSVC__)
#pragma warning( pop )
#elif defined(__GNUC__)
#pragma GCC diagnostic pop
#endif

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
double Statgorithm::Correlation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> xValues, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> yValues)
{
    if (xValues == nullptr || !xValues->LINQ_Any() || yValues == nullptr || !yValues->LINQ_Any() || xValues->LINQ_Count() != yValues->LINQ_Count())
    {
        throw System::ArgumentException(u"Invalid input");
    }
    
    double xMean = Statistics::Mean(xValues);
    double yMean = Statistics::Mean(yValues);
    int32_t count = 0;
    double sumOfProductsOfDifferences = 0.0;
    double sumOfSquaredDifferencesOfX = 0.0;
    double sumOfSquaredDifferencesOfY = 0.0;
    
    {
        auto xEnumerator = xValues->GetEnumerator();
        // Clearing resources under 'using' statement
        System::Details::DisposeGuard<1> __dispose_guard_1({ xEnumerator});
        // ------------------------------------------
        
        try{
            auto yEnumerator = yValues->GetEnumerator();
            // Clearing resources under 'using' statement
            System::Details::DisposeGuard<1> __dispose_guard_0({ yEnumerator});
            // ------------------------------------------
            
            try
            {
                while (xEnumerator->MoveNext() && yEnumerator->MoveNext())
                {
                    count++;
                    double xDifference = xEnumerator->get_Current() - xMean;
                    double yDifference = yEnumerator->get_Current() - yMean;
                    sumOfProductsOfDifferences += xDifference * yDifference;
                    sumOfSquaredDifferencesOfX += xDifference * xDifference;
                    sumOfSquaredDifferencesOfY += yDifference * yDifference;
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
    
    double correlation = sumOfProductsOfDifferences / (Basic::SquareRoot(sumOfSquaredDifferencesOfX) * Basic::SquareRoot(sumOfSquaredDifferencesOfY));
    
    return correlation;
}
#if defined(__MSVC__)
#pragma warning( pop )
#elif defined(__GNUC__)
#pragma GCC diagnostic pop
#endif

double Statgorithm::Percentile(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values, int32_t percentile)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot calculate percentile of empty sequence");
    }
    
    if (percentile < 0 || percentile > 100)
    {
        throw System::ArgumentOutOfRangeException(u"percentile", u"Percentile must be between 0 and 100");
    }
    
    auto sortedValues = values->LINQ_OrderBy(static_cast<System::Func<double, double>>(static_cast<std::function<double(double v)>>([](double v) -> double
    {
        return v;
    })))->LINQ_ToArray();
    int32_t index = (int32_t)System::Math::Ceiling((percentile / 100.0) * sortedValues->get_Length()) - 1;
    
    return sortedValues[index];
}

System::SharedPtr<System::Collections::Generic::IEnumerable<double>> Statgorithm::RemoveOutliers(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values)
{
    if (values == nullptr || !values->LINQ_Any())
    {
        throw System::ArgumentException(u"Cannot remove outliers from empty sequence");
    }
    
    auto sortedValues = values->LINQ_OrderBy(static_cast<System::Func<double, double>>(static_cast<std::function<double(double v)>>([](double v) -> double
    {
        return v;
    })))->LINQ_ToArray();
    double q1 = Percentile(sortedValues, 25);
    double q3 = Percentile(sortedValues, 75);
    double iqr = q3 - q1;
    double lowerBound = q1 - (1.5 * iqr);
    double upperBound = q3 + (1.5 * iqr);
    
    return sortedValues->LINQ_Where(static_cast<System::Func<double, bool>>(static_cast<std::function<bool(double v)>>([&lowerBound, &upperBound](double v) -> bool
    {
        return v >= lowerBound && v <= upperBound;
    })));
}

} // namespace Sigmath
