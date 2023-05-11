#pragma once

#include <system/object.h>
#include <cstdint>

namespace System
{
namespace Collections
{
namespace Generic
{
template <typename> class IEnumerable;
} // namespace Generic
} // namespace Collections
} // namespace System

namespace Sigmath {

class Statgorithm : public System::Object
{
    typedef Statgorithm ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Skewness(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Kurtosis(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Covariance(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> xValues, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> yValues);
    static double Correlation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> xValues, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> yValues);
    static double Percentile(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values, int32_t percentile);
    static System::SharedPtr<System::Collections::Generic::IEnumerable<double>> RemoveOutliers(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    
};

} // namespace Sigmath


