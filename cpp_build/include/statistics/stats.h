#pragma once

#include <system/object.h>

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

class Statistics : public System::Object
{
    typedef Statistics ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Mean(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Median(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Mode(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Variance(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double StandardDeviation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> values);
    static double Correlation(System::SharedPtr<System::Collections::Generic::IEnumerable<double>> valuesX, System::SharedPtr<System::Collections::Generic::IEnumerable<double>> valuesY);
    
};

} // namespace Sigmath


