#pragma once

#include <system/object.h>
#include <cstdint>

namespace Sigmath {

class Computing : public System::Object
{
    typedef Computing ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static int32_t Floor(double x);
    static int32_t Ceil(double x);
    static int32_t Round(double x);
    
};

} // namespace Sigmath


