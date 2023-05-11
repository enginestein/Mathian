#pragma once

#include <system/object.h>
#include <cstdint>

namespace Sigmath {

class Rand : public System::Object
{
    typedef Rand ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    Rand();
    Rand(int64_t seed);
    
    int64_t NextLong();
    double NextDouble();
    int32_t Next(int32_t minValue, int32_t maxValue);
    int32_t Next(int32_t maxValue);
    int32_t Next();
    
private:

    static const int64_t a;
    static const int64_t c;
    static const int64_t m;
    int64_t seed;
    
};

class Random : public System::Object
{
    typedef Random ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double RandUniform(double min, double max);
    static double RandNormal(double mean, double stdDev);
    static int32_t RandPoisson(double lambda);
    
};

} // namespace Sigmath


